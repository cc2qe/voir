#!/usr/bin/env Rscript

# print usage
usage <- function() {
	cat(
'usage: scatter.R <file>

scatter.R
author: Colby Chiang (cc2qe@virginia.edu)
description: Plot a scatter plot from two columns of numbers

positional arguments:
  file               File with two columns of numerical values,
                       tab-delimited.
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

x <- matrix(scan(file, what='raw', sep='\t'), byrow=TRUE, ncol=2)

# pdf(paste0(basename(args[1]), '.pdf'), height=5, width=5)
png(paste0(basename(args[1]), '.png'), height=5, width=5, units='in', res=150)
par(mar=c(4,4,1,1))
plot(x[,1], x[,2], xlab=paste(filename, 1), ylab=paste(filename, 2))
dev.off()