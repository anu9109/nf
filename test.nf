params.fastq = "$baseDir/data/lung_{1,2}.fq"

Channel.fromFilePairs(params.fastq).set {read_pairs_ch}
read_pairs_ch.println()

