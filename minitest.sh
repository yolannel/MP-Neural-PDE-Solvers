#$ -l tmem=16G
#$ -l h_rt=100:00:00
#$ -S /bin/bash
#$ -j y
#$ -N testingMPGNN
#$ -wd /home/yolanlee/MP-Neural-PDE-Solvers/
#$ -l gpu=true

source /share/apps/source_files/python/python-3.8.3.source
export PATH=/share/apps/miniconda3/etc/profile.d/conda.sh:/share/apps/miniconda3/bin:${PATH}

#source /share/apps/source_files/gcc-9.2.0.source
#source /share/apps/source_files/torch-1.9.source

source /share/apps/source_files/cuda/cuda-11.2.source
#export PATH=/home/yolanlee/.conda/envs/mp-pde-solvers/bin/:${PATH}
#export PATH=/share/apps/cuda-11.1/bin:/usr/local/cuda-11.1/bin:${PATH}
#export LD_LIBRARY_PATH=/share/apps/cuda-11.1/lib64:/usr/local/cuda-11.1/lib:${LD_LIBRARY_PATH}

source activate /home/yolanlee/.conda/envs/mp-pde-solvers/

python3 -c "import torch; print(torch.__version__)"

nvcc --version

nvidia-smi

nvidia-smi --query-gpu=name --format=csv,noheader

hostname
date

python3 experiments/train.py --device=cuda:0 --experiment=E1 --model=GNN --base_resolution=250,100 --time_window=25 --log=False --num_epochs=3 --batch_size=4 --mini=True

date


