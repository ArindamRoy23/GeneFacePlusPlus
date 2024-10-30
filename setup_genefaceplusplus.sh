#!/bin/bash

# Navigate to the GeneFacePlusPlus directory
cd /home/roy/GeneFacePlusPlus

# Activate conda
source /opt/conda/bin/activate

# Create and activate the conda environment
conda create -n geneface python=3.9 -y
conda activate geneface

# Install ffmpeg with the libx264 codec for video processing
conda install -c conda-forge ffmpeg -y

# Install PyTorch, TorchVision, Torchaudio, PyTorch3D, and other required packages
conda install pytorch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2 pytorch-cuda=11.8 pytorch3d -c pytorch -c nvidia -c pytorch3d -y
conda install mkl==2024.0

# Install Lightning from conda-forge
conda install -c conda-forge lightning -y

# Install MMCV and other dependencies
pip install cython
pip install openmim==0.3.9
mim install mmcv==2.1.0

# Install additional dependencies for audio support
sudo apt-get install -y libasound2-dev portaudio19-dev

# Install remaining Python dependencies from requirements file
pip install -r docs/prepare_env/requirements.txt -v

# Build torch-ngp
bash docs/prepare_env/install_ext.sh