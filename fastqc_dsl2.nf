nextflow.preview.dsl = 2

params.fastq = "$baseDir/data/lung_{1,2}.fq"
params.outdir = "/data/storage/anu/nf_out/fastqc/"


//Channel
//	.fromFilePairs(params.fastq)
//	.ifEmpty {error "Cannot find FASTQ fies matching ${params.fastq}"}
//	.set {read_pairs_ch}

process fastqc_dsl2{
	tag "FASTQC on $sample_id"
	publishDir params.outdir, mode:'copy'
	
	input:
	tuple sample, path(reads)

	output:
	path "fastqc_${sample}"

	script:
	"""
	mkdir -p fastqc_${sample}
	fastqc -o fastqc_${sample} -f fastq -q ${reads}
	"""
}

Channel .fromFilePairs( params.fastq ) .view()

workflow {
	Channel
        .fromFilePairs(params.fastq)
        .ifEmpty {error "Cannot find FASTQ fies matching ${params.fastq}"}
        .set {read_pairs_ch}

	fastqc_dsl2(read_pairs_ch)

}

workflow.onComplete {
	log.info( workflow.success ? "Done! FASTQC report is here: $params.outdir\n" : "Oops something went wrong" )
}

