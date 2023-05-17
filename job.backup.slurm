#!/bin/bash
#SBATCH --job-name=hotdog    # create a short name for your job
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --cpus-per-task=1        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem=16G                 # total memory per node (4 GB per cpu-core is default)
#SBATCH --gres=gpu:1             # number of gpus per node
#SBATCH --time=05:00:00          # total run time limit (HH:MM:SS)
#SBATCH --mail-type=begin        # send email when job begins
#SBATCH --mail-type=end          # send email when job ends
#SBATCH --mail-type=fail
#SBATCH --mail-user=jcyuan@princeton.edu

module purge
module load anaconda3/2022.5
conda activate pytorch3d

python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.015 --basedir ./runs/20230509/hotdog/backup01

python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.015 --basedir ./runs/20230509/hotdog/backup02 --pc_jitter_amount 0.02
python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.015 --basedir ./runs/20230509/hotdog/backup03 --pc_jitter_amount 0.04
python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.015 --basedir ./runs/20230509/hotdog/backup04 --pc_jitter_amount 0.08
python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.015 --basedir ./runs/20230509/hotdog/backup05 --pc_jitter_amount 0.12
python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.015 --basedir ./runs/20230509/hotdog/backup06 --pc_jitter_amount 0.16
python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.015 --basedir ./runs/20230509/hotdog/backup07 --pc_jitter_amount 0.20

python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.015 --basedir ./runs/20230509/hotdog/backup09 --pc_jitter_amount 0.12 --filter_consistency_ratio 0.97
python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.015 --basedir ./runs/20230509/hotdog/backup10 --pc_jitter_amount 0.12 --filter_consistency_ratio 0.94
python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.015 --basedir ./runs/20230509/hotdog/backup11 --pc_jitter_amount 0.12 --filter_consistency_ratio 0.90
python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.010 --basedir ./runs/20230509/hotdog/backup12 --pc_jitter_amount 0.12 --filter_consistency_ratio 0.80
python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.010 --basedir ./runs/20230509/hotdog/backup13 --pc_jitter_amount 0.12 --filter_consistency_ratio 0.70

python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.010 --basedir ./runs/20230509/hotdog/backup15 --pc_jitter_amount 0.12 --filter_consistency_ratio 0.80 --shAlone YES
python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.010 --basedir ./runs/20230509/hotdog/backup16 --pc_jitter_amount 0.12 --filter_consistency_ratio 0.80 --posFirst YES
python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.010 --basedir ./runs/20230509/hotdog/backup17 --pc_jitter_amount 0.12 --filter_consistency_ratio 0.80 --posFirst YES --ridgePosition 0.01
python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.010 --basedir ./runs/20230509/hotdog/backup18 --pc_jitter_amount 0.12 --filter_consistency_ratio 0.80 --posFirst YES --ridgePosition 0.1
python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.010 --basedir ./runs/20230509/hotdog/backup19 --pc_jitter_amount 0.12 --filter_consistency_ratio 0.80 --posFirst YES --ridgePosition 1.00
python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.010 --basedir ./runs/20230509/hotdog/backup20 --pc_jitter_amount 0.12 --filter_consistency_ratio 0.80 --posFirst YES --shAlone YES
python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.010 --basedir ./runs/20230509/hotdog/backup21 --pc_jitter_amount 0.12 --filter_consistency_ratio 0.80 --posFirst YES --ridgePosition 0.01 --shAlone YES
python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.010 --basedir ./runs/20230509/hotdog/backup22 --pc_jitter_amount 0.12 --filter_consistency_ratio 0.80 --posFirst YES --ridgePosition 0.10 --shAlone YES
python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.010 --basedir ./runs/20230509/hotdog/backup23 --pc_jitter_amount 0.12 --filter_consistency_ratio 0.80 --posFirst YES --ridgePosition 1.00 --shAlone YES