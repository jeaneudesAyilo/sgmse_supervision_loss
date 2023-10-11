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

python train.py --batch_size 1 --dataset wsj0 --clean_dir /srv/storage/talc@storage4.nancy.grid5000.fr/multispeech/corpus/source_separation/WSJ0_SE/ --noisy_dir /srv/storage/talc@storage4.nancy.grid5000.fr/multispeech/corpus/source_separation/QUT_WSJ0/ --additional_loss --weight_add_loss convex_normalized_sigma --theoretical_form --flogging audio_only_wsj0_addloss_convex_normalized_sigma_theoretical_form --resume_from_checkpoint ./logs/audio_only_wsj0_addloss_convex_normalized_sigma_theoretical_form/3id7n5uz/last.ckpt
