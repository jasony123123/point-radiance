#!/bin/bash
#SBATCH --job-name=torch3d-test    # create a short name for your job
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --cpus-per-task=1        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem=16G                 # total memory per node (4 GB per cpu-core is default)
#SBATCH --gres=gpu:1             # number of gpus per node
#SBATCH --time=00:15:00          # total run time limit (HH:MM:SS)
#SBATCH --mail-type=begin        # send email when job begins
#SBATCH --mail-type=end          # send email when job ends
#SBATCH --mail-type=fail
#SBATCH --mail-user=jcyuan@princeton.edu

module purge
module load anaconda3/2022.5
conda activate pytorch3d

python main.py --datadir ./nerf_synthetic/ --dataname hotdog --basedir ./ --data_r 0.012 --splatting_r 0.015