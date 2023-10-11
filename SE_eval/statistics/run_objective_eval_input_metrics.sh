#!/bin/bash

# This is to activate a python environment with conda
source ~/.bashrc

conda activate newenv

# Set variables
ENHANCED_DIR="/srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/enhanced_audio_only/audio_only_wsj0"

#DATA_DIR="/srv/storage/talc@storage4.nancy.grid5000.fr/multispeech/corpus/audio_visual/TCD-TIMIT/test_data_NTCD/test_data_5.pkl"

DATA_DIR="../../wsj_test.json"
SAVE_DIR="/srv/storage/talc3@storage4.nancy.grid5000.fr/multispeech/calcul/users/jayilo/enhanced_audio_only/audio_only_wsj0"

#DATASET="TCD-TIMIT"
DATASET="WSJ0"


# Run command
python objective_evaluation.py \
    --enhanced_dir "$ENHANCED_DIR" \
    --data_dir "$DATA_DIR" \
    --save_dir "$SAVE_DIR" \
    --dataset  "$DATASET" \
    --dnn_mos \
    --input_metrics