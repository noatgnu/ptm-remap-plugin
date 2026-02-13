#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { PTM_REMAP } from './modules/local/ptm-remap/main'

workflow PIPELINE {
    main:
    PTM_REMAP (
        params.input_file ? Channel.fromPath(params.input_file).collect() : Channel.of([]),
        Channel.value(params.peptide_column ?: ''),
        Channel.value(params.position_in_peptide_column ?: ''),
        Channel.value(params.uniprot_acc_column ?: ''),
        params.fasta_file ? Channel.fromPath(params.fasta_file).collect() : Channel.of([]),
    )
}

workflow {
    PIPELINE ()
}
