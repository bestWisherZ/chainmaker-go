#
# Copyright (C) BABEC. All rights reserved.
# Copyright (C) THL A29 Limited, a Tencent company. All rights reserved.
#
# SPDX-License-Identifier: Apache-2.0
#

# This file is used to generate genesis block.
# The content should be consistent across all nodes in this chain.

# chain id
chain_id: {chain_id}

# chain maker version
version: {version}

# chain config sequence
sequence: 0

# The blockchain auth type, shoudle be consistent with auth type in node config (e.g., chainmaker.yml)
# The auth type can be permissionedWithCert, permissionedWithKey, public.
# By default it is permissionedWithCert.
# permissionedWithCert: permissioned blockchain, using x.509 certificate to identify members.
# permissionedWithKey: permissioned blockchain, using public key to identify members.
# public: public blockchain, using public key to identify members.
auth_type: "permissionedWithCert"

# Crypto settings
crypto:
  # Hash algorithm, can be SHA256, SHA3_256 and SM3
  hash: SHA256

# User contract related settings
contract:
  # If the sql support contract is enabled or not.
  # If it is true, storage.statedb_config.provider in chainmaker.yml should be sql.
  enable_sql_support: false

# Virtual machine related settings
vm:
  # Address type
  # 0-chainmaker, 1-zxl, 2-ethereum
  addr_type: 2
  # Virtual machine support list, In the current version, there are wasmer, gasm, evm and dockergo
  # virtual machines to choose from. One or more virtual machines can be configured to be started
  support_list:
    - "wasmer"
    - "gasm"
    - "evm"
    - "dockergo"
    - "wxvm"

# Block proposing related settings
block:
  # To enable this attribute, ensure that the clock of the node is consistent
  # Verify the transaction timestamp or not
  tx_timestamp_verify: true

  # Transaction timeout, in second.
  # if abs(now - tx_timestamp) > tx_timeout, the transaction is invalid.
  tx_timeout: 600

  # Max transaction count in a block.
  block_tx_capacity: 100

  # Max block size, in MB
  block_size: 10

  # The interval of block proposing attempts, in millisecond
  block_interval: 10

# Core settings
core:
  # Max scheduling time of a block, in second.
  # [0, 60]
  tx_scheduler_timeout: 10

  # Max validating time of a block, in second.
  # [0, 60]
  tx_scheduler_validate_timeout: 10

  # Used for handling txs with sender conflicts efficiently
  enable_sender_group: false

  # Used for dynamic tuning the capacity of tx execution goroutine pool
  enable_conflicts_bit_window: true

  # Consensus message compression related settings
  # consensus_turbo_config:
    # If consensus message compression is enabled or not(solo could not use consensus message turbo).
    # consensus_message_turbo: false

    # Max retry count of fetching transaction in txpool by txid.
    # retry_time: 500

    # Retry interval of fetching transaction in txpool by txid, in ms.
    # retry_interval: 20

# gas account config
account_config:
  enable_gas: false
  gas_count: 0
  default_gas: 0

# snapshot settings
# snapshot:
  # Enable the evidence snapshot or not.
  # enable_evidence: false

# scheduler settings
# scheduler:
  # Enable the evidence scheduler or not.
  # enable_evidence: false

# Consensus settings
consensus:
  # Consensus type
  # 0-SOLO, 1-TBFT, 3-MAXBFT, 4-RAFT, 5-DPOS, 6-ABFT
  type: {consensus_type}

  # Consensus node list
  nodes:
    # Each org has one or more consensus nodes.
    # We use p2p node id to represent nodes here.
    - org_id: {org1_id}
      node_id:
        - {org1_peerid}
    - org_id: {org2_id}
      node_id:
        - {org2_peerid}
    - org_id: {org3_id}
      node_id:
        - {org3_peerid}
    - org_id: {org4_id}
      node_id:
        - {org4_peerid}
    - org_id: {org5_id}
      node_id:
        - {org5_peerid}
    - org_id: {org6_id}
      node_id:
        - {org6_peerid}
    - org_id: {org7_id}
      node_id:
        - {org7_peerid}
    - org_id: {org8_id}
      node_id:
        - {org8_peerid}
    - org_id: {org9_id}
      node_id:
        - {org9_peerid}
    - org_id: {org10_id}
      node_id:
        - {org10_peerid}
    - org_id: {org11_id}
      node_id:
        - {org11_peerid}
    - org_id: {org12_id}
      node_id:
        - {org12_peerid}
    - org_id: {org13_id}
      node_id:
        - {org13_peerid}
    - org_id: {org14_id}
      node_id:
        - {org14_peerid}
    - org_id: {org15_id}
      node_id:
        - {org15_peerid}
    - org_id: {org16_id}
      node_id:
        - {org16_peerid}
    - org_id: {org17_id}
      node_id:
        - {org17_peerid}
    - org_id: {org18_id}
      node_id:
        - {org18_peerid}
    - org_id: {org19_id}
      node_id:
        - {org19_peerid}
    - org_id: {org20_id}
      node_id:
        - {org20_peerid}
    - org_id: {org21_id}
      node_id:
        - {org21_peerid}
    - org_id: {org22_id}
      node_id:
        - {org22_peerid}
    - org_id: {org23_id}
      node_id:
        - {org23_peerid}
    - org_id: {org24_id}
      node_id:
        - {org24_peerid}
    - org_id: {org25_id}
      node_id:
        - {org25_peerid}
    - org_id: {org26_id}
      node_id:
        - {org26_peerid}
    - org_id: {org27_id}
      node_id:
        - {org27_peerid}
    - org_id: {org28_id}
      node_id:
        - {org28_peerid}
    - org_id: {org29_id}
      node_id:
        - {org29_peerid}
    - org_id: {org30_id}
      node_id:
        - {org30_peerid}
    - org_id: {org31_id}
      node_id:
        - {org31_peerid}
    - org_id: {org32_id}
      node_id:
        - {org32_peerid}
    - org_id: {org33_id}
      node_id:
        - {org33_peerid}
    - org_id: {org34_id}
      node_id:
        - {org34_peerid}
    - org_id: {org35_id}
      node_id:
        - {org35_peerid}
    - org_id: {org36_id}
      node_id:
        - {org36_peerid}
    - org_id: {org37_id}
      node_id:
        - {org37_peerid}
    - org_id: {org38_id}
      node_id:
        - {org38_peerid}
    - org_id: {org39_id}
      node_id:
        - {org39_peerid}
    - org_id: {org40_id}
      node_id:
        - {org40_peerid}
    - org_id: {org41_id}
      node_id:
        - {org41_peerid}
    - org_id: {org42_id}
      node_id:
        - {org42_peerid}
    - org_id: {org43_id}
      node_id:
        - {org43_peerid}
    - org_id: {org44_id}
      node_id:
        - {org44_peerid}
    - org_id: {org45_id}
      node_id:
        - {org45_peerid}
    - org_id: {org46_id}
      node_id:
        - {org46_peerid}
    - org_id: {org47_id}
      node_id:
        - {org47_peerid}
    - org_id: {org48_id}
      node_id:
        - {org48_peerid}
    - org_id: {org49_id}
      node_id:
        - {org49_peerid}
    - org_id: {org50_id}
      node_id:
        - {org50_peerid}
    - org_id: {org51_id}
      node_id:
        - {org51_peerid}
    - org_id: {org52_id}
      node_id:
        - {org52_peerid}
    - org_id: {org53_id}
      node_id:
        - {org53_peerid}
    - org_id: {org54_id}
      node_id:
        - {org54_peerid}
    - org_id: {org55_id}
      node_id:
        - {org55_peerid}
    - org_id: {org56_id}
      node_id:
        - {org56_peerid}
    - org_id: {org57_id}
      node_id:
        - {org57_peerid}
    - org_id: {org58_id}
      node_id:
        - {org58_peerid}
    - org_id: {org59_id}
      node_id:
        - {org59_peerid}
    - org_id: {org60_id}
      node_id:
        - {org60_peerid}
    - org_id: {org61_id}
      node_id:
        - {org61_peerid}
    - org_id: {org62_id}
      node_id:
        - {org62_peerid}
    - org_id: {org63_id}
      node_id:
        - {org63_peerid}
    - org_id: {org64_id}
      node_id:
        - {org64_peerid}
    - org_id: {org65_id}
      node_id:
        - {org65_peerid}
    - org_id: {org66_id}
      node_id:
        - {org66_peerid}
    - org_id: {org67_id}
      node_id:
        - {org67_peerid}
    - org_id: {org68_id}
      node_id:
        - {org68_peerid}
    - org_id: {org69_id}
      node_id:
        - {org69_peerid}
    - org_id: {org70_id}
      node_id:
        - {org70_peerid}
    - org_id: {org71_id}
      node_id:
        - {org71_peerid}
    - org_id: {org72_id}
      node_id:
        - {org72_peerid}
    - org_id: {org73_id}
      node_id:
        - {org73_peerid}
    - org_id: {org74_id}
      node_id:
        - {org74_peerid}
    - org_id: {org75_id}
      node_id:
        - {org75_peerid}
    - org_id: {org76_id}
      node_id:
        - {org76_peerid}
    - org_id: {org77_id}
      node_id:
        - {org77_peerid}
    - org_id: {org78_id}
      node_id:
        - {org78_peerid}
    - org_id: {org79_id}
      node_id:
        - {org79_peerid}
    - org_id: {org80_id}
      node_id:
        - {org80_peerid}
    - org_id: {org81_id}
      node_id:
        - {org81_peerid}
    - org_id: {org82_id}
      node_id:
        - {org82_peerid}
    - org_id: {org83_id}
      node_id:
        - {org83_peerid}
    - org_id: {org84_id}
      node_id:
        - {org84_peerid}
    - org_id: {org85_id}
      node_id:
        - {org85_peerid}
    - org_id: {org86_id}
      node_id:
        - {org86_peerid}
    - org_id: {org87_id}
      node_id:
        - {org87_peerid}
    - org_id: {org88_id}
      node_id:
        - {org88_peerid}
    - org_id: {org89_id}
      node_id:
        - {org89_peerid}
    - org_id: {org90_id}
      node_id:
        - {org90_peerid}
    - org_id: {org91_id}
      node_id:
        - {org91_peerid}
    - org_id: {org92_id}
      node_id:
        - {org92_peerid}
    - org_id: {org93_id}
      node_id:
        - {org93_peerid}
    - org_id: {org94_id}
      node_id:
        - {org94_peerid}
    - org_id: {org95_id}
      node_id:
        - {org95_peerid}
    - org_id: {org96_id}
      node_id:
        - {org96_peerid}
    - org_id: {org97_id}
      node_id:
        - {org97_peerid}
    - org_id: {org98_id}
      node_id:
        - {org98_peerid}
    - org_id: {org99_id}
      node_id:
        - {org99_peerid}
    - org_id: {org100_id}
      node_id:
        - {org100_peerid}
    - org_id: {org101_id}
      node_id:
        - {org101_peerid}
    - org_id: {org102_id}
      node_id:
        - {org102_peerid}
    - org_id: {org103_id}
      node_id:
        - {org103_peerid}
    - org_id: {org104_id}
      node_id:
        - {org104_peerid}
    - org_id: {org105_id}
      node_id:
        - {org105_peerid}
    - org_id: {org106_id}
      node_id:
        - {org106_peerid}
    - org_id: {org107_id}
      node_id:
        - {org107_peerid}
    - org_id: {org108_id}
      node_id:
        - {org108_peerid}
    - org_id: {org109_id}
      node_id:
        - {org109_peerid}
    - org_id: {org110_id}
      node_id:
        - {org110_peerid}
    - org_id: {org111_id}
      node_id:
        - {org111_peerid}
    - org_id: {org112_id}
      node_id:
        - {org112_peerid}
    - org_id: {org113_id}
      node_id:
        - {org113_peerid}
    - org_id: {org114_id}
      node_id:
        - {org114_peerid}
    - org_id: {org115_id}
      node_id:
        - {org115_peerid}
    - org_id: {org116_id}
      node_id:
        - {org116_peerid}
    - org_id: {org117_id}
      node_id:
        - {org117_peerid}
    - org_id: {org118_id}
      node_id:
        - {org118_peerid}
    - org_id: {org119_id}
      node_id:
        - {org119_peerid}
    - org_id: {org120_id}
      node_id:
        - {org120_peerid}
    - org_id: {org121_id}
      node_id:
        - {org121_peerid}
    - org_id: {org122_id}
      node_id:
        - {org122_peerid}
    - org_id: {org123_id}
      node_id:
        - {org123_peerid}
    - org_id: {org124_id}
      node_id:
        - {org124_peerid}
    - org_id: {org125_id}
      node_id:
        - {org125_peerid}
    - org_id: {org126_id}
      node_id:
        - {org126_peerid}
    - org_id: {org127_id}
      node_id:
        - {org127_peerid}
    - org_id: {org128_id}
      node_id:
        - {org128_peerid}
    - org_id: {org129_id}
      node_id:
        - {org129_peerid}
    - org_id: {org130_id}
      node_id:
        - {org130_peerid}
    - org_id: {org131_id}
      node_id:
        - {org131_peerid}
    - org_id: {org132_id}
      node_id:
        - {org132_peerid}
    - org_id: {org133_id}
      node_id:
        - {org133_peerid}
    - org_id: {org134_id}
      node_id:
        - {org134_peerid}
    - org_id: {org135_id}
      node_id:
        - {org135_peerid}
    - org_id: {org136_id}
      node_id:
        - {org136_peerid}
    - org_id: {org137_id}
      node_id:
        - {org137_peerid}
    - org_id: {org138_id}
      node_id:
        - {org138_peerid}
    - org_id: {org139_id}
      node_id:
        - {org139_peerid}
    - org_id: {org140_id}
      node_id:
        - {org140_peerid}
    - org_id: {org141_id}
      node_id:
        - {org141_peerid}
    - org_id: {org142_id}
      node_id:
        - {org142_peerid}
    - org_id: {org143_id}
      node_id:
        - {org143_peerid}
    - org_id: {org144_id}
      node_id:
        - {org144_peerid}
    - org_id: {org145_id}
      node_id:
        - {org145_peerid}
    - org_id: {org146_id}
      node_id:
        - {org146_peerid}
    - org_id: {org147_id}
      node_id:
        - {org147_peerid}
    - org_id: {org148_id}
      node_id:
        - {org148_peerid}
    - org_id: {org149_id}
      node_id:
        - {org149_peerid}
    - org_id: {org150_id}
      node_id:
        - {org150_peerid}
    - org_id: {org151_id}
      node_id:
        - {org151_peerid}
    - org_id: {org152_id}
      node_id:
        - {org152_peerid}
    - org_id: {org153_id}
      node_id:
        - {org153_peerid}
    - org_id: {org154_id}
      node_id:
        - {org154_peerid}
    - org_id: {org155_id}
      node_id:
        - {org155_peerid}
    - org_id: {org156_id}
      node_id:
        - {org156_peerid}
    - org_id: {org157_id}
      node_id:
        - {org157_peerid}
    - org_id: {org158_id}
      node_id:
        - {org158_peerid}
    - org_id: {org159_id}
      node_id:
        - {org159_peerid}
    - org_id: {org160_id}
      node_id:
        - {org160_peerid}
    - org_id: {org161_id}
      node_id:
        - {org161_peerid}
    - org_id: {org162_id}
      node_id:
        - {org162_peerid}
    - org_id: {org163_id}
      node_id:
        - {org163_peerid}
    - org_id: {org164_id}
      node_id:
        - {org164_peerid}
    - org_id: {org165_id}
      node_id:
        - {org165_peerid}
    - org_id: {org166_id}
      node_id:
        - {org166_peerid}
    - org_id: {org167_id}
      node_id:
        - {org167_peerid}
    - org_id: {org168_id}
      node_id:
        - {org168_peerid}
    - org_id: {org169_id}
      node_id:
        - {org169_peerid}
    - org_id: {org170_id}
      node_id:
        - {org170_peerid}
    - org_id: {org171_id}
      node_id:
        - {org171_peerid}
    - org_id: {org172_id}
      node_id:
        - {org172_peerid}
    - org_id: {org173_id}
      node_id:
        - {org173_peerid}
    - org_id: {org174_id}
      node_id:
        - {org174_peerid}
    - org_id: {org175_id}
      node_id:
        - {org175_peerid}
    - org_id: {org176_id}
      node_id:
        - {org176_peerid}
    - org_id: {org177_id}
      node_id:
        - {org177_peerid}
    - org_id: {org178_id}
      node_id:
        - {org178_peerid}
    - org_id: {org179_id}
      node_id:
        - {org179_peerid}
    - org_id: {org180_id}
      node_id:
        - {org180_peerid}
    - org_id: {org181_id}
      node_id:
        - {org181_peerid}
    - org_id: {org182_id}
      node_id:
        - {org182_peerid}
    - org_id: {org183_id}
      node_id:
        - {org183_peerid}
    - org_id: {org184_id}
      node_id:
        - {org184_peerid}
    - org_id: {org185_id}
      node_id:
        - {org185_peerid}
    - org_id: {org186_id}
      node_id:
        - {org186_peerid}
    - org_id: {org187_id}
      node_id:
        - {org187_peerid}
    - org_id: {org188_id}
      node_id:
        - {org188_peerid}
    - org_id: {org189_id}
      node_id:
        - {org189_peerid}
    - org_id: {org190_id}
      node_id:
        - {org190_peerid}
    - org_id: {org191_id}
      node_id:
        - {org191_peerid}
    - org_id: {org192_id}
      node_id:
        - {org192_peerid}
    - org_id: {org193_id}
      node_id:
        - {org193_peerid}
    - org_id: {org194_id}
      node_id:
        - {org194_peerid}
    - org_id: {org195_id}
      node_id:
        - {org195_peerid}
    - org_id: {org196_id}
      node_id:
        - {org196_peerid}
    - org_id: {org197_id}
      node_id:
        - {org197_peerid}
    - org_id: {org198_id}
      node_id:
        - {org198_peerid}
    - org_id: {org199_id}
      node_id:
        - {org199_peerid}
    - org_id: {org200_id}
      node_id:
        - {org200_peerid}
  # We can specify other consensus config here in key-value format.
  ext_config:
    # - key: aa
    #   value: chain01_ext11

# Trust roots is used to specify the organizations' root certificates in permessionedWithCert mode.
# When in permessionedWithKey mode or public mode, it represents the admin users.
trust_roots:
  # org id and root file path list.
  - org_id: {org1_id}
    root:
      - ../config/{org_path}/certs/ca/{org1_id}/ca.crt
  - org_id: {org2_id}
    root:
      - ../config/{org_path}/certs/ca/{org2_id}/ca.crt
  - org_id: {org3_id}
    root:
      - ../config/{org_path}/certs/ca/{org3_id}/ca.crt
  - org_id: {org4_id}
    root:
      - ../config/{org_path}/certs/ca/{org4_id}/ca.crt
  - org_id: {org5_id}
    root:
      - ../config/{org_path}/certs/ca/{org5_id}/ca.crt
  - org_id: {org6_id}
    root:
      - ../config/{org_path}/certs/ca/{org6_id}/ca.crt
  - org_id: {org7_id}
    root:
      - ../config/{org_path}/certs/ca/{org7_id}/ca.crt
  - org_id: {org8_id}
    root:
      - ../config/{org_path}/certs/ca/{org8_id}/ca.crt
  - org_id: {org9_id}
    root:
      - ../config/{org_path}/certs/ca/{org9_id}/ca.crt
  - org_id: {org10_id}
    root:
      - ../config/{org_path}/certs/ca/{org10_id}/ca.crt
  - org_id: {org11_id}
    root:
      - ../config/{org_path}/certs/ca/{org11_id}/ca.crt
  - org_id: {org12_id}
    root:
      - ../config/{org_path}/certs/ca/{org12_id}/ca.crt
  - org_id: {org13_id}
    root:
      - ../config/{org_path}/certs/ca/{org13_id}/ca.crt
  - org_id: {org14_id}
    root:
      - ../config/{org_path}/certs/ca/{org14_id}/ca.crt
  - org_id: {org15_id}
    root:
      - ../config/{org_path}/certs/ca/{org15_id}/ca.crt
  - org_id: {org16_id}
    root:
      - ../config/{org_path}/certs/ca/{org16_id}/ca.crt
  - org_id: {org17_id}
    root:
      - ../config/{org_path}/certs/ca/{org17_id}/ca.crt
  - org_id: {org18_id}
    root:
      - ../config/{org_path}/certs/ca/{org18_id}/ca.crt
  - org_id: {org19_id}
    root:
      - ../config/{org_path}/certs/ca/{org19_id}/ca.crt
  - org_id: {org20_id}
    root:
      - ../config/{org_path}/certs/ca/{org20_id}/ca.crt
  - org_id: {org21_id}
    root:
      - ../config/{org_path}/certs/ca/{org21_id}/ca.crt
  - org_id: {org22_id}
    root:
      - ../config/{org_path}/certs/ca/{org22_id}/ca.crt
  - org_id: {org23_id}
    root:
      - ../config/{org_path}/certs/ca/{org23_id}/ca.crt
  - org_id: {org24_id}
    root:
      - ../config/{org_path}/certs/ca/{org24_id}/ca.crt
  - org_id: {org25_id}
    root:
      - ../config/{org_path}/certs/ca/{org25_id}/ca.crt
  - org_id: {org26_id}
    root:
      - ../config/{org_path}/certs/ca/{org26_id}/ca.crt
  - org_id: {org27_id}
    root:
      - ../config/{org_path}/certs/ca/{org27_id}/ca.crt
  - org_id: {org28_id}
    root:
      - ../config/{org_path}/certs/ca/{org28_id}/ca.crt
  - org_id: {org29_id}
    root:
      - ../config/{org_path}/certs/ca/{org29_id}/ca.crt
  - org_id: {org30_id}
    root:
      - ../config/{org_path}/certs/ca/{org30_id}/ca.crt
  - org_id: {org31_id}
    root:
      - ../config/{org_path}/certs/ca/{org31_id}/ca.crt
  - org_id: {org32_id}
    root:
      - ../config/{org_path}/certs/ca/{org32_id}/ca.crt
  - org_id: {org33_id}
    root:
      - ../config/{org_path}/certs/ca/{org33_id}/ca.crt
  - org_id: {org34_id}
    root:
      - ../config/{org_path}/certs/ca/{org34_id}/ca.crt
  - org_id: {org35_id}
    root:
      - ../config/{org_path}/certs/ca/{org35_id}/ca.crt
  - org_id: {org36_id}
    root:
      - ../config/{org_path}/certs/ca/{org36_id}/ca.crt
  - org_id: {org37_id}
    root:
      - ../config/{org_path}/certs/ca/{org37_id}/ca.crt
  - org_id: {org38_id}
    root:
      - ../config/{org_path}/certs/ca/{org38_id}/ca.crt
  - org_id: {org39_id}
    root:
      - ../config/{org_path}/certs/ca/{org39_id}/ca.crt
  - org_id: {org40_id}
    root:
      - ../config/{org_path}/certs/ca/{org40_id}/ca.crt
  - org_id: {org41_id}
    root:
      - ../config/{org_path}/certs/ca/{org41_id}/ca.crt
  - org_id: {org42_id}
    root:
      - ../config/{org_path}/certs/ca/{org42_id}/ca.crt
  - org_id: {org43_id}
    root:
      - ../config/{org_path}/certs/ca/{org43_id}/ca.crt
  - org_id: {org44_id}
    root:
      - ../config/{org_path}/certs/ca/{org44_id}/ca.crt
  - org_id: {org45_id}
    root:
      - ../config/{org_path}/certs/ca/{org45_id}/ca.crt
  - org_id: {org46_id}
    root:
      - ../config/{org_path}/certs/ca/{org46_id}/ca.crt
  - org_id: {org47_id}
    root:
      - ../config/{org_path}/certs/ca/{org47_id}/ca.crt
  - org_id: {org48_id}
    root:
      - ../config/{org_path}/certs/ca/{org48_id}/ca.crt
  - org_id: {org49_id}
    root:
      - ../config/{org_path}/certs/ca/{org49_id}/ca.crt
  - org_id: {org50_id}
    root:
      - ../config/{org_path}/certs/ca/{org50_id}/ca.crt
  - org_id: {org51_id}
    root:
      - ../config/{org_path}/certs/ca/{org51_id}/ca.crt
  - org_id: {org52_id}
    root:
      - ../config/{org_path}/certs/ca/{org52_id}/ca.crt
  - org_id: {org53_id}
    root:
      - ../config/{org_path}/certs/ca/{org53_id}/ca.crt
  - org_id: {org54_id}
    root:
      - ../config/{org_path}/certs/ca/{org54_id}/ca.crt
  - org_id: {org55_id}
    root:
      - ../config/{org_path}/certs/ca/{org55_id}/ca.crt
  - org_id: {org56_id}
    root:
      - ../config/{org_path}/certs/ca/{org56_id}/ca.crt
  - org_id: {org57_id}
    root:
      - ../config/{org_path}/certs/ca/{org57_id}/ca.crt
  - org_id: {org58_id}
    root:
      - ../config/{org_path}/certs/ca/{org58_id}/ca.crt
  - org_id: {org59_id}
    root:
      - ../config/{org_path}/certs/ca/{org59_id}/ca.crt
  - org_id: {org60_id}
    root:
      - ../config/{org_path}/certs/ca/{org60_id}/ca.crt
  - org_id: {org61_id}
    root:
      - ../config/{org_path}/certs/ca/{org61_id}/ca.crt
  - org_id: {org62_id}
    root:
      - ../config/{org_path}/certs/ca/{org62_id}/ca.crt
  - org_id: {org63_id}
    root:
      - ../config/{org_path}/certs/ca/{org63_id}/ca.crt
  - org_id: {org64_id}
    root:
      - ../config/{org_path}/certs/ca/{org64_id}/ca.crt
  - org_id: {org65_id}
    root:
      - ../config/{org_path}/certs/ca/{org65_id}/ca.crt
  - org_id: {org66_id}
    root:
      - ../config/{org_path}/certs/ca/{org66_id}/ca.crt
  - org_id: {org67_id}
    root:
      - ../config/{org_path}/certs/ca/{org67_id}/ca.crt
  - org_id: {org68_id}
    root:
      - ../config/{org_path}/certs/ca/{org68_id}/ca.crt
  - org_id: {org69_id}
    root:
      - ../config/{org_path}/certs/ca/{org69_id}/ca.crt
  - org_id: {org70_id}
    root:
      - ../config/{org_path}/certs/ca/{org70_id}/ca.crt
  - org_id: {org71_id}
    root:
      - ../config/{org_path}/certs/ca/{org71_id}/ca.crt
  - org_id: {org72_id}
    root:
      - ../config/{org_path}/certs/ca/{org72_id}/ca.crt
  - org_id: {org73_id}
    root:
      - ../config/{org_path}/certs/ca/{org73_id}/ca.crt
  - org_id: {org74_id}
    root:
      - ../config/{org_path}/certs/ca/{org74_id}/ca.crt
  - org_id: {org75_id}
    root:
      - ../config/{org_path}/certs/ca/{org75_id}/ca.crt
  - org_id: {org76_id}
    root:
      - ../config/{org_path}/certs/ca/{org76_id}/ca.crt
  - org_id: {org77_id}
    root:
      - ../config/{org_path}/certs/ca/{org77_id}/ca.crt
  - org_id: {org78_id}
    root:
      - ../config/{org_path}/certs/ca/{org78_id}/ca.crt
  - org_id: {org79_id}
    root:
      - ../config/{org_path}/certs/ca/{org79_id}/ca.crt
  - org_id: {org80_id}
    root:
      - ../config/{org_path}/certs/ca/{org80_id}/ca.crt
  - org_id: {org81_id}
    root:
      - ../config/{org_path}/certs/ca/{org81_id}/ca.crt
  - org_id: {org82_id}
    root:
      - ../config/{org_path}/certs/ca/{org82_id}/ca.crt
  - org_id: {org83_id}
    root:
      - ../config/{org_path}/certs/ca/{org83_id}/ca.crt
  - org_id: {org84_id}
    root:
      - ../config/{org_path}/certs/ca/{org84_id}/ca.crt
  - org_id: {org85_id}
    root:
      - ../config/{org_path}/certs/ca/{org85_id}/ca.crt
  - org_id: {org86_id}
    root:
      - ../config/{org_path}/certs/ca/{org86_id}/ca.crt
  - org_id: {org87_id}
    root:
      - ../config/{org_path}/certs/ca/{org87_id}/ca.crt
  - org_id: {org88_id}
    root:
      - ../config/{org_path}/certs/ca/{org88_id}/ca.crt
  - org_id: {org89_id}
    root:
      - ../config/{org_path}/certs/ca/{org89_id}/ca.crt
  - org_id: {org90_id}
    root:
      - ../config/{org_path}/certs/ca/{org90_id}/ca.crt
  - org_id: {org91_id}
    root:
      - ../config/{org_path}/certs/ca/{org91_id}/ca.crt
  - org_id: {org92_id}
    root:
      - ../config/{org_path}/certs/ca/{org92_id}/ca.crt
  - org_id: {org93_id}
    root:
      - ../config/{org_path}/certs/ca/{org93_id}/ca.crt
  - org_id: {org94_id}
    root:
      - ../config/{org_path}/certs/ca/{org94_id}/ca.crt
  - org_id: {org95_id}
    root:
      - ../config/{org_path}/certs/ca/{org95_id}/ca.crt
  - org_id: {org96_id}
    root:
      - ../config/{org_path}/certs/ca/{org96_id}/ca.crt
  - org_id: {org97_id}
    root:
      - ../config/{org_path}/certs/ca/{org97_id}/ca.crt
  - org_id: {org98_id}
    root:
      - ../config/{org_path}/certs/ca/{org98_id}/ca.crt
  - org_id: {org99_id}
    root:
      - ../config/{org_path}/certs/ca/{org99_id}/ca.crt
  - org_id: {org100_id}
    root:
      - ../config/{org_path}/certs/ca/{org100_id}/ca.crt
  - org_id: {org101_id}
    root:
      - ../config/{org_path}/certs/ca/{org101_id}/ca.crt
  - org_id: {org102_id}
    root:
      - ../config/{org_path}/certs/ca/{org102_id}/ca.crt
  - org_id: {org103_id}
    root:
      - ../config/{org_path}/certs/ca/{org103_id}/ca.crt
  - org_id: {org104_id}
    root:
      - ../config/{org_path}/certs/ca/{org104_id}/ca.crt
  - org_id: {org105_id}
    root:
      - ../config/{org_path}/certs/ca/{org105_id}/ca.crt
  - org_id: {org106_id}
    root:
      - ../config/{org_path}/certs/ca/{org106_id}/ca.crt
  - org_id: {org107_id}
    root:
      - ../config/{org_path}/certs/ca/{org107_id}/ca.crt
  - org_id: {org108_id}
    root:
      - ../config/{org_path}/certs/ca/{org108_id}/ca.crt
  - org_id: {org109_id}
    root:
      - ../config/{org_path}/certs/ca/{org109_id}/ca.crt
  - org_id: {org110_id}
    root:
      - ../config/{org_path}/certs/ca/{org110_id}/ca.crt
  - org_id: {org111_id}
    root:
      - ../config/{org_path}/certs/ca/{org111_id}/ca.crt
  - org_id: {org112_id}
    root:
      - ../config/{org_path}/certs/ca/{org112_id}/ca.crt
  - org_id: {org113_id}
    root:
      - ../config/{org_path}/certs/ca/{org113_id}/ca.crt
  - org_id: {org114_id}
    root:
      - ../config/{org_path}/certs/ca/{org114_id}/ca.crt
  - org_id: {org115_id}
    root:
      - ../config/{org_path}/certs/ca/{org115_id}/ca.crt
  - org_id: {org116_id}
    root:
      - ../config/{org_path}/certs/ca/{org116_id}/ca.crt
  - org_id: {org117_id}
    root:
      - ../config/{org_path}/certs/ca/{org117_id}/ca.crt
  - org_id: {org118_id}
    root:
      - ../config/{org_path}/certs/ca/{org118_id}/ca.crt
  - org_id: {org119_id}
    root:
      - ../config/{org_path}/certs/ca/{org119_id}/ca.crt
  - org_id: {org120_id}
    root:
      - ../config/{org_path}/certs/ca/{org120_id}/ca.crt
  - org_id: {org121_id}
    root:
      - ../config/{org_path}/certs/ca/{org121_id}/ca.crt
  - org_id: {org122_id}
    root:
      - ../config/{org_path}/certs/ca/{org122_id}/ca.crt
  - org_id: {org123_id}
    root:
      - ../config/{org_path}/certs/ca/{org123_id}/ca.crt
  - org_id: {org124_id}
    root:
      - ../config/{org_path}/certs/ca/{org124_id}/ca.crt
  - org_id: {org125_id}
    root:
      - ../config/{org_path}/certs/ca/{org125_id}/ca.crt
  - org_id: {org126_id}
    root:
      - ../config/{org_path}/certs/ca/{org126_id}/ca.crt
  - org_id: {org127_id}
    root:
      - ../config/{org_path}/certs/ca/{org127_id}/ca.crt
  - org_id: {org128_id}
    root:
      - ../config/{org_path}/certs/ca/{org128_id}/ca.crt
  - org_id: {org129_id}
    root:
      - ../config/{org_path}/certs/ca/{org129_id}/ca.crt
  - org_id: {org130_id}
    root:
      - ../config/{org_path}/certs/ca/{org130_id}/ca.crt
  - org_id: {org131_id}
    root:
      - ../config/{org_path}/certs/ca/{org131_id}/ca.crt
  - org_id: {org132_id}
    root:
      - ../config/{org_path}/certs/ca/{org132_id}/ca.crt
  - org_id: {org133_id}
    root:
      - ../config/{org_path}/certs/ca/{org133_id}/ca.crt
  - org_id: {org134_id}
    root:
      - ../config/{org_path}/certs/ca/{org134_id}/ca.crt
  - org_id: {org135_id}
    root:
      - ../config/{org_path}/certs/ca/{org135_id}/ca.crt
  - org_id: {org136_id}
    root:
      - ../config/{org_path}/certs/ca/{org136_id}/ca.crt
  - org_id: {org137_id}
    root:
      - ../config/{org_path}/certs/ca/{org137_id}/ca.crt
  - org_id: {org138_id}
    root:
      - ../config/{org_path}/certs/ca/{org138_id}/ca.crt
  - org_id: {org139_id}
    root:
      - ../config/{org_path}/certs/ca/{org139_id}/ca.crt
  - org_id: {org140_id}
    root:
      - ../config/{org_path}/certs/ca/{org140_id}/ca.crt
  - org_id: {org141_id}
    root:
      - ../config/{org_path}/certs/ca/{org141_id}/ca.crt
  - org_id: {org142_id}
    root:
      - ../config/{org_path}/certs/ca/{org142_id}/ca.crt
  - org_id: {org143_id}
    root:
      - ../config/{org_path}/certs/ca/{org143_id}/ca.crt
  - org_id: {org144_id}
    root:
      - ../config/{org_path}/certs/ca/{org144_id}/ca.crt
  - org_id: {org145_id}
    root:
      - ../config/{org_path}/certs/ca/{org145_id}/ca.crt
  - org_id: {org146_id}
    root:
      - ../config/{org_path}/certs/ca/{org146_id}/ca.crt
  - org_id: {org147_id}
    root:
      - ../config/{org_path}/certs/ca/{org147_id}/ca.crt
  - org_id: {org148_id}
    root:
      - ../config/{org_path}/certs/ca/{org148_id}/ca.crt
  - org_id: {org149_id}
    root:
      - ../config/{org_path}/certs/ca/{org149_id}/ca.crt
  - org_id: {org150_id}
    root:
      - ../config/{org_path}/certs/ca/{org150_id}/ca.crt
  - org_id: {org151_id}
    root:
      - ../config/{org_path}/certs/ca/{org151_id}/ca.crt
  - org_id: {org152_id}
    root:
      - ../config/{org_path}/certs/ca/{org152_id}/ca.crt
  - org_id: {org153_id}
    root:
      - ../config/{org_path}/certs/ca/{org153_id}/ca.crt
  - org_id: {org154_id}
    root:
      - ../config/{org_path}/certs/ca/{org154_id}/ca.crt
  - org_id: {org155_id}
    root:
      - ../config/{org_path}/certs/ca/{org155_id}/ca.crt
  - org_id: {org156_id}
    root:
      - ../config/{org_path}/certs/ca/{org156_id}/ca.crt
  - org_id: {org157_id}
    root:
      - ../config/{org_path}/certs/ca/{org157_id}/ca.crt
  - org_id: {org158_id}
    root:
      - ../config/{org_path}/certs/ca/{org158_id}/ca.crt
  - org_id: {org159_id}
    root:
      - ../config/{org_path}/certs/ca/{org159_id}/ca.crt
  - org_id: {org160_id}
    root:
      - ../config/{org_path}/certs/ca/{org160_id}/ca.crt
  - org_id: {org161_id}
    root:
      - ../config/{org_path}/certs/ca/{org161_id}/ca.crt
  - org_id: {org162_id}
    root:
      - ../config/{org_path}/certs/ca/{org162_id}/ca.crt
  - org_id: {org163_id}
    root:
      - ../config/{org_path}/certs/ca/{org163_id}/ca.crt
  - org_id: {org164_id}
    root:
      - ../config/{org_path}/certs/ca/{org164_id}/ca.crt
  - org_id: {org165_id}
    root:
      - ../config/{org_path}/certs/ca/{org165_id}/ca.crt
  - org_id: {org166_id}
    root:
      - ../config/{org_path}/certs/ca/{org166_id}/ca.crt
  - org_id: {org167_id}
    root:
      - ../config/{org_path}/certs/ca/{org167_id}/ca.crt
  - org_id: {org168_id}
    root:
      - ../config/{org_path}/certs/ca/{org168_id}/ca.crt
  - org_id: {org169_id}
    root:
      - ../config/{org_path}/certs/ca/{org169_id}/ca.crt
  - org_id: {org170_id}
    root:
      - ../config/{org_path}/certs/ca/{org170_id}/ca.crt
  - org_id: {org171_id}
    root:
      - ../config/{org_path}/certs/ca/{org171_id}/ca.crt
  - org_id: {org172_id}
    root:
      - ../config/{org_path}/certs/ca/{org172_id}/ca.crt
  - org_id: {org173_id}
    root:
      - ../config/{org_path}/certs/ca/{org173_id}/ca.crt
  - org_id: {org174_id}
    root:
      - ../config/{org_path}/certs/ca/{org174_id}/ca.crt
  - org_id: {org175_id}
    root:
      - ../config/{org_path}/certs/ca/{org175_id}/ca.crt
  - org_id: {org176_id}
    root:
      - ../config/{org_path}/certs/ca/{org176_id}/ca.crt
  - org_id: {org177_id}
    root:
      - ../config/{org_path}/certs/ca/{org177_id}/ca.crt
  - org_id: {org178_id}
    root:
      - ../config/{org_path}/certs/ca/{org178_id}/ca.crt
  - org_id: {org179_id}
    root:
      - ../config/{org_path}/certs/ca/{org179_id}/ca.crt
  - org_id: {org180_id}
    root:
      - ../config/{org_path}/certs/ca/{org180_id}/ca.crt
  - org_id: {org181_id}
    root:
      - ../config/{org_path}/certs/ca/{org181_id}/ca.crt
  - org_id: {org182_id}
    root:
      - ../config/{org_path}/certs/ca/{org182_id}/ca.crt
  - org_id: {org183_id}
    root:
      - ../config/{org_path}/certs/ca/{org183_id}/ca.crt
  - org_id: {org184_id}
    root:
      - ../config/{org_path}/certs/ca/{org184_id}/ca.crt
  - org_id: {org185_id}
    root:
      - ../config/{org_path}/certs/ca/{org185_id}/ca.crt
  - org_id: {org186_id}
    root:
      - ../config/{org_path}/certs/ca/{org186_id}/ca.crt
  - org_id: {org187_id}
    root:
      - ../config/{org_path}/certs/ca/{org187_id}/ca.crt
  - org_id: {org188_id}
    root:
      - ../config/{org_path}/certs/ca/{org188_id}/ca.crt
  - org_id: {org189_id}
    root:
      - ../config/{org_path}/certs/ca/{org189_id}/ca.crt
  - org_id: {org190_id}
    root:
      - ../config/{org_path}/certs/ca/{org190_id}/ca.crt
  - org_id: {org191_id}
    root:
      - ../config/{org_path}/certs/ca/{org191_id}/ca.crt
  - org_id: {org192_id}
    root:
      - ../config/{org_path}/certs/ca/{org192_id}/ca.crt
  - org_id: {org193_id}
    root:
      - ../config/{org_path}/certs/ca/{org193_id}/ca.crt
  - org_id: {org194_id}
    root:
      - ../config/{org_path}/certs/ca/{org194_id}/ca.crt
  - org_id: {org195_id}
    root:
      - ../config/{org_path}/certs/ca/{org195_id}/ca.crt
  - org_id: {org196_id}
    root:
      - ../config/{org_path}/certs/ca/{org196_id}/ca.crt
  - org_id: {org197_id}
    root:
      - ../config/{org_path}/certs/ca/{org197_id}/ca.crt
  - org_id: {org198_id}
    root:
      - ../config/{org_path}/certs/ca/{org198_id}/ca.crt
  - org_id: {org199_id}
    root:
      - ../config/{org_path}/certs/ca/{org199_id}/ca.crt
  - org_id: {org200_id}
    root:
      - ../config/{org_path}/certs/ca/{org200_id}/ca.crt

# Trust members are members that do not need to be verified against trust roots.
# trust_members:
# Each trust member should specify: member info file path, org id, role, and tls node id if any.
# - member_info: ""
#   org_id: ""
#   role: "consensus"
##   node_id:  ""

# Resource policies settings
resource_policies:
  - resource_name: CHAIN_CONFIG-NODE_ID_UPDATE
    policy:
      # Rule can be Any, All, Majority, Self...
      rule: SELF
      # The org id list, all organizations are need if here is null.
      org_list:
      # The role list
      role_list:
        - admin
  - resource_name: CHAIN_CONFIG-TRUST_ROOT_ADD
    policy:
      rule: MAJORITY
      org_list:
      role_list:
        - admin
  - resource_name: CHAIN_CONFIG-CERTS_FREEZE
    policy:
      rule: ANY
      org_list:
      role_list:
        - admin
  - resource_name: CONTRACT_MANAGE-INIT_CONTRACT
    policy:
      rule: ANY
      org_list:
      role_list:

# The disabled native contract list
# Disable the system contract by specifying the system contract name
# Can disabled native contract name contains CHAIN_CONFIG, CHAIN_QUERY, CERT_MANAGE, GOVERNANCE, MULTI_SIGN, PRIVATE_COMPUTE, DPOS_ERC20, DPOS_STAKE, CROSS_TRANSACTION, PUBKEY_MANAGE
disabled_native_contract:
# - CONTRACT_NAME
