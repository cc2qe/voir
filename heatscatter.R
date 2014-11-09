#!/usr/bin/env Rscript

# print usage
usage <- function() {
	cat(
'usage: heatscatter.R <file>

heatscatter.R
author: Colby Chiang (cc2qe@virginia.edu)
description: Plot a heat scatter plot from two columns of numbers

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

# Read data into data.fram
df <- read.table(file, sep='\t', col.names=(c('x1', 'x2')))
x1 <- df$x1
x2 <- df$x2

## Use densCols() output to get density at each point
x <- densCols(x1, x2, colramp=colorRampPalette(c("black", "white")))
df$dens <- col2rgb(x)[1,] + 1L

## Map densities to colors
cols <-  colorRampPalette(c("#000099", "#00FEFF", "#45FE4F", 
                            "#FCFF00", "#FF9400", "#FF3100", "#9B0000"))(256)
df$col <- cols[df$dens]

## Plot it, reordering rows so that densest points are plotted on top
# pdf(paste0(basename(args[1]), '.pdf'), height=5, width=5)
png(paste0(basename(args[1]), '.png'), height=5, width=5, units='in', res=150)
par(mar=c(4,4,1,1))
plot(x1~x2, data=df[order(df$dens),], pch=20, col=col, cex=1.5, xlab=paste(filename, 1), ylab=paste(filename, 2))
dev.off()