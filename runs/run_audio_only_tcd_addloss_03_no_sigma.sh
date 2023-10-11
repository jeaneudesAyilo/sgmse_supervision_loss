#!/bin/bash
# # This should not be changed
#OAR -q production
# # Remove `!` for CPUs only
#OAR -p cluster='graffiti'
# # Adapt as desired
#OAR -l host=1/gpu=4,walltime=48:00:00

source ~/.bashrc
conda activate newenv
cd /srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/sgmse

# Now you can do the job e.g.

python train.py --batch_size 1 --dataset tcd --base_dir /srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo --additional_loss --cst_add_loss 0.3 --weight_add_loss no_sigma --flogging audio_only_tcd_addloss_0.3_no_sigma --resume_from_checkpoint ./logs/audio_only_tcd_addloss_0.3_no_sigma/cc4ybag0/last.ckpt
