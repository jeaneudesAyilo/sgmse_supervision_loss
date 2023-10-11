#!/bin/bash
# # This should not be changed
#OAR -q production
# # Remove `!` for CPUs only
#OAR -p cluster='grue'
# # Adapt as desired
#OAR -l host=1/gpu=4,walltime=24:00:00

source ~/.bashrc
conda activate newenv
cd /srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/sgmse

# Now you can do the job e.g.

python train.py --batch_size 1 --dataset tcd --base_dir /srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo --additional_loss --weight_add_loss convex_normalized_sigma --no_2_form --flogging audio_only_tcd_addloss_convex_normalized_sigma_no_2_form --resume_from_checkpoint ./logs/audio_only_tcd_addloss_convex_normalized_sigma_no_2_form/3ryesy7w/last.ckpt