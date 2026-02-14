process PTM_REMAP {
    label 'process_medium'

    container "${ workflow.containerEngine == 'singularity' ?
        'docker://cauldron/ptm-remap:1.0.0' :
        'cauldron/ptm-remap:1.0.0' }"

    input:
    path input_file
    val peptide_column
    val position_in_peptide_column
    val uniprot_acc_column
    path fasta_file

    output:
    
    path "remapped_peptides.txt", emit: remapped_peptides_txt, optional: true
    path "versions.yml", emit: versions

    script:
    def args = task.ext.args ?: ''
    """
    # Build arguments dynamically to match CauldronGO PluginExecutor logic
    ARG_LIST=()

    
    # Mapping for input_file
    VAL="$input_file"
    if [ -n "\$VAL" ] && [ "\$VAL" != "null" ] && [ "\$VAL" != "[]" ]; then
        ARG_LIST+=("--input" "\$VAL")
    fi
    
    # Mapping for peptide_column
    VAL="$peptide_column"
    if [ -n "\$VAL" ] && [ "\$VAL" != "null" ] && [ "\$VAL" != "[]" ]; then
        ARG_LIST+=("--peptide-col" "\$VAL")
    fi
    
    # Mapping for position_in_peptide_column
    VAL="$position_in_peptide_column"
    if [ -n "\$VAL" ] && [ "\$VAL" != "null" ] && [ "\$VAL" != "[]" ]; then
        ARG_LIST+=("--position-col" "\$VAL")
    fi
    
    # Mapping for uniprot_acc_column
    VAL="$uniprot_acc_column"
    if [ -n "\$VAL" ] && [ "\$VAL" != "null" ] && [ "\$VAL" != "[]" ]; then
        ARG_LIST+=("--uniprot-col" "\$VAL")
    fi
    
    # Mapping for fasta_file
    VAL="$fasta_file"
    if [ -n "\$VAL" ] && [ "\$VAL" != "null" ] && [ "\$VAL" != "[]" ]; then
        ARG_LIST+=("--fasta" "\$VAL")
    fi
    
    python /app/remap_ptm.py \
        "\${ARG_LIST[@]}" \
        --output-dir . \
        \${args:-}

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        PTM Position Remapping: 1.0.0
    END_VERSIONS
    """
}
