#!/usr/bin/env bash

source /scripts/utils.sh

DATA_DIR=/root/.ethereum

account_cnt=$(ls ${DATA_DIR}/keystore | wc -l)
i=1
unlock_sequences="0"
while [ "$i" -lt ${account_cnt} ]; do
    unlock_sequences="${unlock_sequences},${i}"
    i=$(( i + 1 ))
done

geth --config ${DATA_DIR}/config.toml --datadir ${DATA_DIR} --netrestrict ${CLUSTER_CIDR} \
    --verbosity ${VERBOSE} --nousb --ethstats ${NODE_ID}:${NETSTATS_URL} \
    --unlock ${unlock_sequences} --password /dev/null --http --http.addr=0.0.0.0 --http.vhosts=* --http.corsdomain=* --http.api=net,web3,eth,debug,txpool \
    --ws --ws.addr=0.0.0.0 --ws.api=net,web3,eth,shh,txpool,debug,db,admin,miner,personal --ws.origins=* --syncmode=full --gcmode=archive --ws.port=8546

