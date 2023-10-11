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

# Now you can do the job e.g.

python train.py --batch_size 1 --dataset tcd --base_dir /srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo --additional_loss --weight_add_loss convex_normalized_sigma --theoretical_form --flogging audio_only_tcd_addloss_convex_normalized_sigma_theoretical_form --resume_from_checkpoint ./logs/audio_only_tcd_addloss_convex_normalized_sigma_theoretical_form/15306e3l/last.ckpt



