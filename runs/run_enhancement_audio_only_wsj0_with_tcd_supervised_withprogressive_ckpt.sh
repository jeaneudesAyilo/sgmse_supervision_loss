#!/bin/bash
# # This should not be changed
#OAR -q production
# # Remove `!` for CPUs only
#OAR -p cluster='grue'
# # Adapt as desired
#OAR -l host=1,walltime=15:00:00

source ~/.bashrc
conda activate newenv
cd /srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/sgmse

json_path="/srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/sgmse/wsj_test.json"

enhanced_dir="/srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/enhanced_audio_only/audio_only_wsj0_with_tcd_supervised_withprogressive_ckpt"

ckpt_path="/srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/sgmse/logs/supervised/audio_only_tcd_supervised_withprogressive/2opmoxvz/epoch=67-si_sdr=13.80.ckpt"

noisy_dir="/srv/storage/talc@storage4.nancy.grid5000.fr/multispeech/corpus/source_separation/QUT_WSJ0/test"

clean_dir="/srv/storage/talc@storage4.nancy.grid5000.fr/multispeech/corpus/source_separation/WSJ0_SE/wsj0_si_et_05"

python enhancement_wsj0.py --json_path ${json_path} --enhanced_dir ${enhanced_dir} --noisy_test_dir ${noisy_dir} --ckpt ${ckpt_path} --supervised --no_gpu
#--audio_only

cd /srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/avdiffusion

python calc_metrics_wsj0.py --json_path ${json_path} --enhanced_dir ${enhanced_dir} --noisy_test_dir ${noisy_dir} --clean_test_dir ${clean_dir}

echo "sucess"