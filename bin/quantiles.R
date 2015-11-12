#!/usr/bin/env Rscript

# print usage
usage <- function() {
	cat(
'usage: quantiles.R <file>

quantiles.R
author: Colby Chiang (colbychiang@wustl.edu)
description: convert a column of numbers into quantile values

positional arguments:
  file               File with one column of numerical values [stdin]
')
}

# compute R from linear regression
args <- commandArgs(trailingOnly=TRUE)
file <- args[1]
filename <- basename(file)

# Check input args
# stdin if no file
if (is.na(file)) {
	# print help
	if (isatty(stdin()))  {
		usage()
		quit(save='no', status=1)
	}
	
	else {
		file <- file('stdin')
		filename <- 'stdin'	
	}
}

# read input data
x <- matrix(scan(file, what='raw', sep='\t', quiet=TRUE), byrow=TRUE, ncol=1)
class(x) <- 'numeric'

# calculate mad
q <- ecdf(x)(x)

cat(x, sep='\n')

