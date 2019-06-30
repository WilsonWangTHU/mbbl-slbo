#!/usr/bin/env bash

for env_name in $1; do
    echo "=> Running environment ${env_name}"
    for random_seed in 1234 2314 2345 1235; do
        python main.py -c configs/algos/slbo_bm_1m.yml configs/env_tingwu/${env_name}.yml \
	    -s log_dir=experiments/1m_${env_name}_${random_seed} seed=${random_seed}
    done
done
