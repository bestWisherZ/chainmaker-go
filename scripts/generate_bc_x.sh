#!/usr/bin/env bash
#
# Copyright (C) BABEC. All rights reserved.
# Copyright (C) THL A29 Limited, a Tencent company. All rights reserved.
#
# SPDX-License-Identifier: Apache-2.0
#

NODE_CNT=$1

cp ../config/config_tpl/chainconfig/bc_base.tpl ../config/config_tpl/chainconfig/bc_$NODE_CNT.tpl
echo "begin generate bc_$NODE_CNT.tpl..."
    for ((i = $NODE_CNT; i > 0; i = i - 1)); do
        sed -i "/# We use p2p node id to represent nodes here./a\    - org_id: "{org$i\_id}"\n      node_id:\n        - "{org$i\_peerid}"" ../config/config_tpl/chainconfig/bc_$NODE_CNT.tpl
        sed -i "/# org id and root file path list./a\  - org_id: "{org$i\_id}"\n    root:\n      - "../config/{org_path}/certs/ca/{org$i\_id}/ca.crt"" ../config/config_tpl/chainconfig/bc_$NODE_CNT.tpl
    done
#     for ((j = $NODE_CNT; i > 0; i = i - 1)); do
#         sed -i "/# org id and root file path list./a\  - org_id: "{org$j\_id}"\n    root:\n      - "../config/{org_path}/certs/ca/{org$j\_id}/ca.crt"" ../config/config_tpl/chainconfig/bc_$NODE_CNT.tpl
#     done
