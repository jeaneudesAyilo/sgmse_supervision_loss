#!/bin/bash
# # This should not be changed
#OAR -q production
# # Remove `!` for CPUs only
#OAR -p cluster='gruss'
# # Adapt as desired
#OAR -l host=1/gpu=1,walltime=12:00:00

source ~/.bashrc
conda activate newenv
cd /srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/sgmse

json_path="/srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/sgmse/wsj_test.json"

enhanced_dir="/srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/enhanced_audio_only/audio_only_wsj0_addloss_convex_normalized_sigma"

ckpt_path="/srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/sgmse/logs/audio_only_wsj0_addloss_convex_normalized_sigma/wlfmteon/epoch=191-si_sdr=11.13.ckpt"


noisy_dir="/srv/storage/talc@storage4.nancy.grid5000.fr/multispeech/corpus/source_separation/QUT_WSJ0/test"

clean_dir="/srv/storage/talc@storage4.nancy.grid5000.fr/multispeech/corpus/source_separation/WSJ0_SE/wsj0_si_et_05"

python enhancement_wsj0.py --json_path ${json_path} --enhanced_dir ${enhanced_dir} --noisy_test_dir ${noisy_dir} --ckpt ${ckpt_path}
#--audio_only

cd /srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/avdiffusion

python calc_metrics_wsj0.py --json_path ${json_path} --enhanced_dir ${enhanced_dir} --noisy_test_dir ${noisy_dir} --clean_test_dir ${clean_dir}

echo "sucess"