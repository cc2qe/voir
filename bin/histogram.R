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
filename <- basename(args[1])

# Check input args
if (is.na(file)) {
	usage()
	quit(save='no', status=1)
}

x <- as.numeric(scan(file))

pdf(paste0(filename, '.pdf'), height=4, width=5)
## png(paste0(filename, '.png'), height=4, width=5, units='in', res=150)
par(mar=c(4,4,1,1))
hist(x, col='steelblue3', main='', breaks=50, xlab=filename)
dev.off()
