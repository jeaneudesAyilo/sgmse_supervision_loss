#!/bin/bash

# This is to activate a python environment with conda
source ~/.bashrc

conda activate newenv

# Set variables
ENHANCED_DIR=""

#DATA_DIR="/srv/storage/talc@storage4.nancy.grid5000.fr/multispeech/corpus/audio_visual/TCD-TIMIT/test_data_NTCD/test_data_5.pkl"

DATA_DIR=""
SAVE_DIR=""

#DATASET="TCD-TIMIT" or "WSJ0"
DATASET=""

# Run command
python objective_evaluation.py \
    --enhanced_dir "$ENHANCED_DIR" \
    --data_dir "$DATA_DIR" \
    --save_dir "$SAVE_DIR" \
    --dataset  "$DATASET" \
    --dnn_mos    