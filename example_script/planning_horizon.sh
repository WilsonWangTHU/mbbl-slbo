#!/usr/bin/env bash

env_length=$2

for env_name in $1; do
    echo "=> Running environment ${env_name}"
    for plan_length in 100 200 500 800 1000; do
        if [ "$plan_length" -gt "$env_length" ]
        then
            continue      # Skip rest of this particular loop iteration.
        fi


        # modify the config files
        file_name=configs/env_tingwu/${env_name}_depth_search_${env_length}_${plan_length}.yml
        cp ./configs/env_tingwu/${env_name}_depth_search.yml $file_name

        sed -i "s/ENV_LENGTH/${env_length}/g" $file_name
        sed -i "s/PLAN_LENGTH/${plan_length}/g" $file_name

        for random_seed in 1234 2314 2345 1235; do
            python main.py -c configs/algos/slbo_bm_200k.yml $file_name \
                -s log_dir=experiments/${env_name}_${env_length}_${plan_length}_${random_seed} \
                seed=${random_seed}
        done
    done
done
