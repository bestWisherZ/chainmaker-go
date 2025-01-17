ifeq ($(OS),Windows_NT)
    PLATFORM="Windows"
else
    ifeq ($(shell uname),Darwin)
        PLATFORM="MacOS"
    else
        PLATFORM="Linux"
    endif
endif
DATETIME=$(shell date "+%Y%m%d%H%M%S")
VERSION=v2.3.0
GIT_BRANCH = $(shell git rev-parse --abbrev-ref HEAD)
GIT_COMMIT = $(shell git log --pretty=format:'%h' -n 1)

LOCALCONF_HOME=chainmaker.org/chainmaker-go/module/blockchain
GOLDFLAGS += -X "${LOCALCONF_HOME}.CurrentVersion=${VERSION}"
GOLDFLAGS += -X "${LOCALCONF_HOME}.BuildDateTime=${DATETIME}"
GOLDFLAGS += -X "${LOCALCONF_HOME}.GitBranch=${GIT_BRANCH}"
GOLDFLAGS += -X "${LOCALCONF_HOME}.GitCommit=${GIT_COMMIT}"

chainmaker:
    ifeq ($(PLATFORM),"Windows")
		@echo "build for windows"
		@rm -rf go.sum && cd main && go mod tidy && go build -ldflags '${GOLDFLAGS}' -o ../bin/chainmaker.exe
    else
		@echo "build for linux or mac"
		@rm -rf go.sum && cd main && go mod tidy && go build -ldflags '${GOLDFLAGS}' -o ../bin/chainmaker
    endif

chainmaker-vendor:
	@cd main && go build -mod=vendor -o ../bin/chainmaker

package:
	@cd main && go mod tidy && GOPATH=${GOPATH} go build -ldflags '${GOLDFLAGS}' -o ../bin/chainmaker
	@mkdir -p ./release
	@rm -rf ./tmp/chainmaker/
	@mkdir -p ./tmp/chainmaker/
	@mkdir ./tmp/chainmaker/bin
	@mkdir ./tmp/chainmaker/config
	@mkdir ./tmp/chainmaker/log
	@cp bin/chainmaker ./tmp/chainmaker/bin
	@cp -r config ./tmp/chainmaker/
	@cd ./tmp;tar -zcvf chainmaker-$(VERSION).$(DATETIME).$(PLATFORM).tar.gz chainmaker; mv chainmaker-$(VERSION).$(DATETIME).$(PLATFORM).tar.gz ../release
	@rm -rf ./tmp/

compile:
	@cd main && go mod tidy && go build -ldflags '${GOLDFLAGS}' -o ../bin/chainmaker

cmc:
	@cd tools/cmc && go mod tidy && go build -ldflags '${GOLDFLAGS}' -o ../../bin/cmc

send-tool:
	cd test/send_proposal_request_tool && go build -o ../../bin/send_proposal_request_tool

scanner:
	@cd tools/scanner && GOPATH=${GOPATH} go build -o ../../bin/scanner

dep:
	@go get golang.org/x/tools/cmd/stringer

generate:
	go generate ./...

docker-build:
	rm -rf build/ data/ log/ bin/
	docker build -t chainmaker -f ./DOCKER/Dockerfile .
	docker tag chainmaker chainmaker:${VERSION}

docker-build-dev: chainmaker
	docker build -t chainmaker -f ./DOCKER/dev.Dockerfile .
	docker tag chainmaker chainmaker:${VERSION}

docker-compose-start: docker-compose-stop
	docker-compose up -d

docker-compose-stop:
	docker-compose down

ut:
	cd scripts && ./ut_cover.sh

lint:
	cd main && golangci-lint run ./...
	cd module/accesscontrol && golangci-lint run .
	cd module/blockchain && golangci-lint run .
	cd module/core && golangci-lint run ./...
	cd module/consensus && golangci-lint run ./...
	cd module/net && golangci-lint run ./...
	cd module/rpcserver && golangci-lint run ./...
	cd module/snapshot && golangci-lint run ./...
	cd module/subscriber && golangci-lint run ./...
	cd module/sync && golangci-lint run ./...
	cd module/txfilter && golangci-lint run ./...
	golangci-lint run ./tools/cmc/...
	cd tools/scanner && golangci-lint run ./...

gomod:
	cd scripts && ./gomod_update.sh

test-deploy:
	cd scripts/test/ && ./quick_deploy.sh

sql-qta:
	echo "clear environment"
	cd test/chain2 && ./stop.sh
	cd test/chain2 && ./clean.sh
	echo "start new sql-qta test"
	cd test/chain2 && ./build.sh
	cd test/chain2 && ./start.sh
	cd test/scenario0_native && python3 chain2.py
	cd test/scenario1_evm && python3 chain2.py
	cd test/scenario2_rust && python3 chain2.py
	cd test/scenario4_wasmer_sql && python3 chain2.py
	cd test/chain2 && ./stop.sh
	cd test/chain2 && ./clean.sh

qta: cert-qta pub-qta docker-qta

cert-qta:
	echo "clear environment"
	cd test/chain1 && ./stop.sh
	cd test/chain1 && ./clean.sh
	echo "start new qta test"
	cd test/chain1 && ./build.sh
	cd test/chain1 && ./start.sh
	cd test/scenario0_native && python3 chain1.py
	cd test/scenario1_evm && python3 chain1.py
	cd test/scenario2_rust && python3 chain1.py
	cd test/chain1 && ./stop.sh
	cd test/chain1 && ./clean.sh

pub-qta:
	echo "clear environment"
	cd test/chain3 && ./stop.sh
	cd test/chain3 && ./clean.sh
	echo "start new qta test"
	cd test/chain3 && ./build.sh
	cd test/chain3 && ./start.sh
	cd test/scenario0_native && python3 chain3.py
	cd test/scenario1_evm && python3 chain3.py
	#cd test/scenario2_rust && python3 chain3.py  #Rust合约不能启用Gas
	cd test/chain3 && ./stop.sh
	cd test/chain3 && ./clean.sh

docker-qta:
	echo "clear environment"
	cd test/chain1 && ./stop.sh
	cd test/chain1 && ./clean.sh
	echo "start new docker-qta test"
	cd scripts/docker && ./build-dockergo.sh
	cd test/chain1 && ./build.sh
	cd test/chain1 && ./docker-start.sh
	cd test/chain1 && ./start.sh
	cd test/scenario3_dockergo && python3 chain1.py
	cd test/chain1 && ./stop.sh
	cd test/chain1 && ./clean.sh
	docker rm -f  `docker ps -aq -f name=ci-chain1`


deploy:
#	rm -r build/backup
	cd scripts && ./cluster_quick_stop.sh
	cd scripts && echo "\n\n\n" | ./prepare.sh 4 1
	python3 mod_config.py
	cd scripts && ./build_release.sh
	cd scripts && ./cluster_quick_start.sh normal
	rm -rf tools/cmc/testdata/crypto-config
	cp -r build/crypto-config tools/cmc/testdata


after:
	rm -rf tools/cmc/testdata/crypto-config
	cp -r build/crypto-config tools/cmc/testdata

create:
	cd tools/cmc && ./cmc client contract user create \
	--contract-name=fact \
	--runtime-type=WASMER \
	--byte-code-path=./testdata/claim-wasm-demo/rust-fact-2.0.0.wasm \
	--version=1.0 \
	--sdk-conf-path=./testdata/sdk_config.yml \
	--admin-key-file-paths=./testdata/crypto-config/wx-org1.chainmaker.org/user/admin1/admin1.sign.key,./testdata/crypto-config/wx-org2.chainmaker.org/user/admin1/admin1.sign.key,./testdata/crypto-config/wx-org3.chainmaker.org/user/admin1/admin1.sign.key \
	--admin-crt-file-paths=./testdata/crypto-config/wx-org1.chainmaker.org/user/admin1/admin1.sign.crt,./testdata/crypto-config/wx-org2.chainmaker.org/user/admin1/admin1.sign.crt,./testdata/crypto-config/wx-org3.chainmaker.org/user/admin1/admin1.sign.crt \
	--sync-result=true \
	--params="{}"

invoke:
	cd tools/cmc && ./cmc client contract user invoke \
	--contract-name=fact \
	--method=save \
	--sdk-conf-path=./testdata/sdk_config.yml \
	--params="{\"file_name\":\"name007\",\"file_hash\":\"ab3456df5799b87c77e7f88\",\"time\":\"6543234\"}" \
	--sync-result=false \
	--concurrency=10 \
	--total-count-per-goroutine=2000
update:
	cd submodule/recorderfile && make updateaccessconfig

clean:
	rm -rf ./build/backup/backup_release/

stop:
	cd scripts && ./cluster_quick_stop.sh

calculate:
	python calculate4.py

savelog:
	#cp log/res.csv logRecorder/port_delay/res_$(DATETIME).csv
	cp -r log/* logRecorder/multi_node/res_16\\16_30ms_100Mbps_1s+1s/

testsavelog:
	cp log/tbft_result.csv logRecorder/res_true.csv

paramadapter:
	cd param_adapter && ./param_adapter

start:
	rm -r log/*
	cd scripts && ./cluster_quick_start.sh normal
	rm -rf tools/cmc/testdata/crypto-config
	cp -r build/crypto-config tools/cmc/testdata

check:
	cd submodule/recorderfile && make accessconfig

query:
	cd tools/cmc && ./cmc client chainconfig query \
    --sdk-conf-path=./testdata/sdk_config.yml

delay:
	./delay_script.sh set

cancel:
	./delay_script.sh cancel

total4: start update delay invoke
total5: calculate savelog cancel

change:
	cd tools/cmc && curl -d '{"module":1, "type":1, "param_name":"TBFT_propose_timeout", "param_value":3}' -H "Content-Type: application/json" -X POST http://localhost:8000/

change1:
	cd tools/cmc && curl -d '{"module":1, "type":1, "param_name":"TBFT_prevote_delta_timeout", "param_value":1}' -H "Content-Type: application/json" -X POST http://localhost:8000/

change2:
	cd tools/cmc && curl -d '{"module":1, "type":1, "param_name":"TBFT_precommit_timeout", "param_value":0.001}' -H "Content-Type: application/json" -X POST http://localhost:8000/

change3:
	cd tools/cmc && curl -d '{"module":1, "type":1, "param_name":"TBFT_precommit_delta_timeout", "param_value":1}' -H "Content-Type: application/json" -X POST http://localhost:8000/

total1: deploy update invoke stop calculate savelog

total2: start update invoke stop calculate testsavelog

total3: start change1 update invoke query stop calculate savelog

#total4: start update invoke sleep1 invoke sleep2 invoke stop calculate savelog

#total5: start change1 sleep1 update invoke invoke invoke stop calculate savelog

sleep1:
	sleep 1s


calTps:
	@echo $(logName)
	# rm ./k8s/log/$(logName)
	python sorting.py $(dateNow)

# ./cmc client contract user invoke \
# --contract-name=fact \
# --method=save \
# --sdk-conf-path=./testdata/sdk_config.yml \
# --params="{\"file_name\":\"name007\",\"file_hash\":\"ab3456df5799b87c77e7f88\",\"time\":\"6543234\"}" \
# --sync-result=false \
# --concurrency=1 \
# --total-count-per-goroutine=1000