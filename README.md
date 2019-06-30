# Stochastic Lower Bound Optimization

[Algorithmic Framework for Model-based Deep Reinforcement Learning with Theoretical Guarantees](https://arxiv.org/abs/1807.03858).
We modified the repo to perform benchmarking as part of the [Model Based Reinforcement Learning Benchmarking Library (MBBL)](https://github.com/WilsonWangTHU/mbbl).
Please refer to the project page for more information.

This is the implementation built on top of the [official repo](https://github.com/facebookresearch/slbo) by the authors.

## Installation
Requires [`mujoco131`](https://www.roboti.us/index.html).

Install required packages using:
```
pip install -r requirements.txt
```
Then please go to [MBBL](https://github.com/WilsonWangTHU/mbbl) to install the mbbl package for the environments.

## Run
To do the benchmarking, please refer to `./example_script/run_experiments.sh`
First copy the script under the root directory, i. e. `cp ./example_script/run_experiments.sh ./`
Then run the benchmarking for example as
```
bash run_experiments.sh gym_cheetah
```

Before running, please make sure that `rllab` and `baselines` are available 

```bash
python main.py -c configs/algos/slbo.yml configs/envs/half_cheetah.yml -s log_dir=/tmp
```
Environments are modified to use the gym environments for the benchmarking project. Supported environments are:
```
Environment         |   Max timesteps
---------------------------------------
reacher             |   50
half_cheetah        |   1000
walker              |   1000
hopper              |   1000
swimmer             |   1000
ant                 |   1000
                    |
pendulum            |   200
inverted_pendulum   |   100
acrobot             |   200
cartpole            |   200
mountain            |   200
```

If you want to change hyper-parameters, you can either modify a corresponding `yml` file or 
change it temporarily by appending `model.hidden_sizes='[1000,1000]'` in the command line.

## License

See [LICENSE](LICENSE) for additional details.
