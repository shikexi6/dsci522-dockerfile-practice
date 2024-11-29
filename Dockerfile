# Step 1: Base image
FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# Step 2: Copy conda lock file
COPY conda-linux-64.lock /tmp/conda-linux-64.lock

# Step 3: Install packages with mamba
RUN mamba update --quiet --file /tmp/conda-linux-64.lock \
    && mamba clean --all -y -f \
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "/home/${NB_USER}"