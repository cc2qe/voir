#!/usr/bin/env Rscript

# print usage
usage <- function() {
	cat(
'usage: histogram.R <file>

histogram.R
author: Colby Chiang (cc2qe@virginia.edu)
description: Plot a histogram from a column of numbers

positional arguments:
  file               File of numerical values, one per line.
')
}

# Draw a histogram from a text file
args <- commandArgs(trailingOnly=TRUE)
file <- args[1]

# Check input args
if (is.na(file)) {
	usage()
	quit(save='no', status=1)
}

x <- as.numeric(scan(file))

pdf(paste0(basename(args[1]), '.pdf'), height=4, width=5)
hist(x, col='steelblue3', breaks=50, main=paste0('Histogram of ', args[1]), xlab=args[1])
dev.off()