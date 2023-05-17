# Point-radiance w Imperfect Masks

[PDF](latex-writeup/cos526_report_jcyuan.pdf) | **Abstract**: *Differentiable point-based radiance fields is an alternative algorithm to Neural Radiance Fields to perform novel view synthesis. Crucially, this algorithm relies on the use of object-background masks during training. In this work, we empirically demonstrate the negative effect of imperfect masks on this algorithm's render quality through a simulation of mask corruption. We then propose a two part modification to the algorithm to enable it to handle less-than-perfect masks. We demonstrate quantitatively and qualitatively that our proposed solution has high render quality even with imperfect masks.*

## Run

Assuming the conda enviornment is setup, you can simply run

```
python main.py --datadir ./nerf_synthetic/ --dataname hotdog --data_r 0.012 --splatting_r 0.010 --basedir ./runs/20230509/hotdog/TEST --pc_jitter_amount 0.12 --filter_consistency_ratio 0.80 --posFirst YES --ridgePosition 1.00 --shAlone YES
```

Examples of scripts are provided in the slurm jobs.

## Adroit setup

1. Move conda to scratch partition
    ```
    rsync -avu $HOME/.conda /scratch/network/jcyuan/
    rm -Rf $HOME/.conda
    cd $HOME
    ln -s /scratch/network/jcyuan/.conda .conda
    checkquota
    ```
2. Installation
    ```
    module load anaconda3/2022.5
    conda create --name pytorch3d --file conda_env.txt
    conda activate pytorch3d
    pip install -r pip_env.txt
    ```
3. Download nerf_synthetic datatset and unzip into this repo: https://drive.google.com/drive/folders/128yBriW1IG_3NJ5Rp7APSTZsJqdJdfc1
4. Run `sbatch job.slurm` and `squeue --me` to run jobs

---

# Original README

This code release accompanies the following paper:

### Differentiable Point-Based Radiance Fields for Efficient View Synthesis
Qiang Zhang, Seung-Hwan Baek, Szymon Rusinkiweicz, Felix Heide

*Siggraph Asia*, 2022

 [PDF](https://arxiv.org/pdf/2205.14330.pdf) | [arXiv](https://arxiv.org/abs/2205.14330) 
**Abstract:** 
We propose a differentiable rendering algorithm for efficient novel
view synthesis. By departing from volume-based representations
in favor of a learned point representation, we improve on existing
methods more than an order of magnitude in memory and run-
time, both in training and inference. The method begins with a
uniformly-sampled random point cloud and learns per-point posi-
tion and view-dependent appearance, using a differentiable splat-
based renderer to train the model to reproduce a set of input train-
ing images with the given pose. Our method is up to 300 × faster
than NeRF in both training and inference, with only a marginal
sacrifice in quality, while using less than 10 MB of memory for a
static scene. For dynamic scenes, our method trains two orders of
magnitude faster than STNeRF and renders at a near interactive
rate, while maintaining high image quality and temporal coherence
even without imposing any temporal-coherency regularizers.


## Installation

We recommend using a [`conda`](https://docs.conda.io/en/latest/miniconda.html) environment for this codebase. The following commands will set up a new conda environment with the correct requirements:

```bash
# Create and activate new conda env
conda create -n my-conda-env python=3.9
conda activate my-conda-env

# Install pytorch and related libraries
conda install -y pytorch==1.10.1 torchvision==0.11.2 cudatoolkit=11.0 -c pytorch
conda install numpy matplotlib tqdm imageio
```
Then follow the official [INSTALL.md](https://github.com/facebookresearch/pytorch3d/blob/main/INSTALL.md) to install [pytorch3d](https://pytorch3d.org/).

## Reproduce
You can train the model on NeRF synthetic dataset within 3 minutes. Here datadir is the dataset folder path. Dataname is the scene name. Basedir is the log folder path. Data_r is the ratio between the used point number and the initialized point number. Splatting_r is the radius for the splatting.
```bash
python main.py --datadir xxx --dataname hotdog --basedir xxx --data_r 0.012 --splatting_r 0.015
```
After around three minutes, you can see the following output (the example is tested on one A100 GPU):

```
Training time: 148.59 s
Rendering quality: 34.70 dB
Rendering speed: 120.01 fps
Model size: 7.32 MB
```

## Citation

If you find this work useful for your research, please consider citing:
```
@article{zhang2022differentiable,
  title={Differentiable Point-Based Radiance Fields for Efficient View Synthesis},
  author={Zhang, Qiang and Baek, Seung-Hwan and Rusinkiewicz, Szymon and Heide, Felix},
  journal={arXiv preprint arXiv:2205.14330},
  year={2022}
}
```
