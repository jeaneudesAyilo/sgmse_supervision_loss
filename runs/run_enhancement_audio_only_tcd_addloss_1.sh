#!/bin/bash
# # This should not be changed
#OAR -q production
# # Remove `!` for CPUs only
#OAR -p cluster='graffiti'
# # Adapt as desired
#OAR -l host=1/gpu=2,walltime=24:00:00

source ~/.bashrc
conda activate newenv
cd /srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/sgmse

test_dir="/srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/test"

enhanced_dir="/srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/enhanced_audio_only/audio_only_tcd_addloss_1.0"

ckpt_path="/srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/sgmse/logs/audio_only_tcd_addloss_1.0/3l7w4m53/epoch=10-si_sdr=8.39.ckpt"


python enhancement.py --test_dir ${test_dir} --enhanced_dir ${enhanced_dir} --ckpt ${ckpt_path}
#--audio_only

cd /srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/avdiffusion

python calc_metrics.py --dataset tcd --test_dir ${test_dir} --enhanced_dir ${enhanced_dir}

python summarize_results.py --enhanced_dir ${enhanced_dir}