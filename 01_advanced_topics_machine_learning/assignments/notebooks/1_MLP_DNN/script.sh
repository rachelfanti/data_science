#!/bin/bash

#SBATCH --job-name=tf_jupyter  
#SBATCH --output=tf-%j.out 
#SBATCH --error=tf-%j.err 
#SBATCH --partition gpu 
#SBATCH --ntasks-per-node=2 
#SBATCH --nodes=1 
#SBATCH --gres=gpu:1

module load anaconda3
module load cuda-11.4.0

source /opt/packages/anaconda3/etc/profile.d/conda.sh
conda activate tf

python Keras_FashionMNIST_Classifier.py
# xxx is the directory to  scripts 
#jupyter lab --ip=0.0.0.0 --port=8888 --no-browser # here is to excute  script
