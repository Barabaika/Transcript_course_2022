params.results_dir = "results/"
SRA_list = params.SRA.split(",")

log.info ""
log.info "  Q U A L I T Y   C O N T R O L  "
log.info "================================="
log.info "SRA number         : ${SRA_list}"
log.info "Results location   : ${params.results_dir}"

process DownloadFastQ {
  publishDir "${params.results_dir}"

  input:
    val sra

  output:
    path "${sra}/*"

  script:
    """
    /content/sratoolkit.3.0.0-ubuntu64/bin/fasterq-dump ${sra} -O ${sra}/
    """
}

process QC {
  input:
    path x

  output:
    path "qc/*"

  script:
    """
    mkdir qc
    /content/FastQC/fastqc -o qc $x
    """
}

process MultiQC {
  publishDir "${params.results_dir}"

  input:
    path x

  output:
    path "multiqc_report.html"

  script:
    """
    multiqc $x
    """
}

workflow {
  data = Channel.of( SRA_list )
  DownloadFastQ(data)
  QC( DownloadFastQ.out )
  MultiQC( QC.out.collect() )
}