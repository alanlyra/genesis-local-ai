#!/bin/bash
set -ex

# Check if environment exist
conda_env_exists(){
    ! conda list --name "${@}" >/dev/null 2>/dev/null
}

if conda_env_exists "diffusers" ; then
    echo "Creating virtual environment..."
    conda env create --name diffusers --file $1
    echo "Virtual environment created."
else 
    echo "Virtual environment already exists."
fi

if [ "$PIP_CACHE_PURGE" = true ] ; then
    export PATH=$PATH:/opt/conda/bin

    # Activate conda environment
    source activate diffusers

    pip cache purge
fi