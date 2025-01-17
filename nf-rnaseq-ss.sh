#!/usr/bin/env bash

PIPE="<path>/nf-rnaseq-sagc"

nextflow run ${PIPE}/main.nf \
    -profile conda,slurm \
    --library_type single \
    --path_bcl '<path/to/bcl/dir>' \
    --index single \
    --genome HG38 \
    --outdir output-single-end \
    --email daniel.thomson@sahmri.com \
    --partition sahmri_prod_hpc \
    --node_list edp-prd-lin-hpc05,edp-prd-lin-hpc06 \
    -resume
