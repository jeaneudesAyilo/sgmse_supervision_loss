#!/bin/bash
# # This should not be changed
#OAR -t exotic
# # Remove `!` for CPUs only
#OAR -p cluster='grouille'
# # Adapt as desired
#OAR -l host=1/gpu=1,walltime=6:00:00

source ~/.bashrc
conda activate newenv
cd /srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/sgmse

json_path="/srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/sgmse/wsj_test.json"

enhanced_dir="/srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/enhanced_audio_only/audio_only_wsj0_addloss_convex_normalized_sigma_theoretical_form"

ckpt_path="/srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/sgmse/logs/audio_only_wsj0_addloss_convex_normalized_sigma_theoretical_form/3id7n5uz/epoch=126-si_sdr=10.96.ckpt"


noisy_dir="/srv/storage/talc@storage4.nancy.grid5000.fr/multispeech/corpus/source_separation/QUT_WSJ0/test"

clean_dir="/srv/storage/talc@storage4.nancy.grid5000.fr/multispeech/corpus/source_separation/WSJ0_SE/wsj0_si_et_05"

python enhancement_wsj0.py --json_path ${json_path} --enhanced_dir ${enhanced_dir} --noisy_test_dir ${noisy_dir} --ckpt ${ckpt_path}
#--audio_only

cd /srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/avdiffusion
##in fact, we don't need to cd in avdiffusion, the current folder sgmse can be used. so one can comment out the above line.

python calc_metrics_wsj0.py --json_path ${json_path} --enhanced_dir ${enhanced_dir} --noisy_test_dir ${noisy_dir} --clean_test_dir ${clean_dir}

echo "sucess"