#!/bin/bash
# # This should not be changed
#OAR -q production
# # Remove `!` for CPUs only
#OAR -p cluster='gruss'
# # Adapt as desired
#OAR -l host=1/gpu=1,walltime=24:00:00

source ~/.bashrc
conda activate newenv
cd /srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/sgmse

test_dir="/srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/test"

enhanced_dir="/srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/enhanced_audio_only/audio_only_tcd_addloss_0.75"

ckpt_path="/srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/sgmse/logs/audio_only_tcd_addloss_0.75/f4lp5wrd/epoch=10-si_sdr=9.31.ckpt"


python enhancement.py --test_dir ${test_dir} --enhanced_dir ${enhanced_dir} --ckpt ${ckpt_path}
#--audio_only

cd /srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/avdiffusion

python calc_metrics.py --dataset tcd --test_dir ${test_dir} --enhanced_dir ${enhanced_dir}

python summarize_results.py --enhanced_dir ${enhanced_dir}
