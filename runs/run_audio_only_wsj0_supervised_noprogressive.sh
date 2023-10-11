#!/bin/bash
# # This should not be changed
#OAR -q production
# # Remove `!` for CPUs only
#OAR -p cluster='grue'
# # Adapt as desired
#OAR -l host=1/gpu=4,walltime=48:00:00

source ~/.bashrc
conda activate newenv
cd /srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/sgmse

python train.py --batch_size 1 --dataset wsj0 --clean_dir /srv/storage/talc@storage4.nancy.grid5000.fr/multispeech/corpus/source_separation/WSJ0_SE/ --noisy_dir /srv/storage/talc@storage4.nancy.grid5000.fr/multispeech/corpus/source_separation/QUT_WSJ0/ --flogging audio_only_wsj0_supervised_noprogressive --supervised --embedding_type none --conditional --progressive none --progressive_input none --resume_from_checkpoint ./logs/supervised/audio_only_wsj0_supervised_noprogressive/hx4ol3ar/last.ckpt