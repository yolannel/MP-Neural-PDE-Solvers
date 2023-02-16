#!/bin/bash
source /share/apps/source_files/python/python-3.8.3.source
export PATH=/share/apps/cuda-11.1/bin:/usr/local/cuda-11.1/bin:${PATH}
export LD_LIBRARY_PATH=/share/apps/cuda-11.1/lib64:/usr/local/cuda-11.1/lib:${LD_LIBRARY_PATH}

conda create --yes --name mp-pde-solvers python=3.8 numpy scipy matplotlib scikit-learn
CONDA_PATH=$(conda info | grep -i 'base environment' | awk '{print $4}')
source $CONDA_PATH/etc/profile.d/conda.sh
conda activate mp-pde-solvers
conda install pytorch=1.9 torchvision torchaudio cudatoolkit=11.1 -c pytorch -c conda-forge -y
conda install gcc_linux-64 -y
pip install --no-index torch-scatter -f https://pytorch-geometric.com/whl/torch-1.9.1+cu111.html  
pip install --no-index torch-sparse -f https://pytorch-geometric.com/whl/torch-1.9.1+cu111.html  
pip install --no-index torch-cluster -f https://pytorch-geometric.com/whl/torch-1.9.1+cu111.html  
pip install torch-geometric
conda install -c anaconda h5py -y
pip install -e .
