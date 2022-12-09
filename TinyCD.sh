#!/bin/bash
source /home/ubuntu/anaconda3/etc/profile.d/conda.sh
cd ~/Tiny_model_4_CD
conda create -n TinyCD python=3.10.6 -y
conda activate TinyCD

conda install --name TinyCD pip

pip install -r ~/Tiny_model_4_CD/reqs.txt
cd ~/Tiny_model_4_CD
#training
python3 training.py --datapath "~/Tiny_model_4_CD/LEVIR-CD-256" --log-path "~/TinyCD/Log"

#test 1 will fail
python3 test_ondata.py --datapath "~/Tiny_model_4_CD/kubric_change" --modelpath "~/Tiny_model_4_CD/pretrained_models/levir_best.pth"

#test 2 will fail
python3 test_ondata.py --datapath "~/Tiny_model_4_CD/resized_fixed" --modelpath "~/Tiny_model_4_CD/pretrained_models/levir_best.pth"

