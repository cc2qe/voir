#!/usr/bin/env Rscript

# print usage
usage <- function() {
	cat(
'usage: rcorr.R <file>

rcorr.R
author: Colby Chiang (cc2qe@virginia.edu)
description: calculate R and R^2 values from two columns of numbers
             outputs two tab-delimited columns: R and R^2

positional arguments:
  file               File with two columns of numerical values,
                       tab-delimited.
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
x <- matrix(scan(file, what='raw', sep='\t', quiet=TRUE), byrow=TRUE, ncol=2)
class(x) <- 'numeric'

# calculate linear regression
reg <- lm(x[,2]~x[,1])

r2 <- summary(reg)$r.squared
r <- sqrt(r2)
if (reg$coefficients[2] < 0) {
   r <- -r
}

cat(r, r2, sep='\t')
cat('\n')

