params.fastq = "$baseDir/data/lung_{1,2}.fq"
params.outdir = "/data/storage/anu/nf_out/fastqc/"

Channel 
	.fromFilePairs(params.fastq)
	.ifEmpty {error "Cannot find FASTQ fies matching ${params.fastq}"}
	.set {read_pairs_ch}


process fastq{	
	publishDir params.outdir, mode:'copy'
	input:
	set sample, file(fastq) from read_pairs_ch

	output:
	file("fastqc_${sample}") into fastqc_ch

	script:
	"""
	mkdir -p fastqc_${sample}
	fastqc -o fastqc_${sample} -f fastq -q ${fastq}
	"""
}

//read_pairs_ch = Channel .fromFilePairs( params.fastq )

//read_pairs_ch.println()
