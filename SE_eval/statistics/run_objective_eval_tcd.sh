#!/bin/bash

# This is to activate a python environment with conda
source ~/.bashrc

conda activate newenv

# Set variables
ENHANCED_DIR="/srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/enhanced_audio_only/audio_only_tcd"

#DATA_DIR="/srv/storage/talc@storage4.nancy.grid5000.fr/multispeech/corpus/audio_visual/TCD-TIMIT/test_data_NTCD/test_data_5.pkl"

DATA_DIR="/srv/storage/talc@storage4.nancy.grid5000.fr/multispeech/corpus/audio_visual/TCD-TIMIT/test_data_NTCD/test_data_5.pkl"

SAVE_DIR="/srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/enhanced_audio_only/audio_only_tcd"

#DATASET="TCD-TIMIT"
DATASET="TCD-TIMIT"


# Run command
python objective_evaluation.py \
    --enhanced_dir "$ENHANCED_DIR" \
    --data_dir "$DATA_DIR" \
    --save_dir "$SAVE_DIR" \
    --dataset  "$DATASET" \
    --dnn_mos \
    #--input_metrics