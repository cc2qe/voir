voir
====

Tools for viewing data

## Table of contents
* [histogram.R](#histogramr)
* [scatter.R](#scatterr)

### histogram.R

Plot a histogram from a column of numbers

#### Usage
```
usage: histogram.R <file>

positional arguments:
  file               File of numerical values, one per line.
```

#### Example
```
histogram.R insert_size.txt
```
![Example histogram](examples/figures/insert_size.txt.png?raw=true "Example histogram")

### scatter.R

Plot a scatter plot from two columns of numbers

#### Usage
```
usage: scatter.R <file>

positional arguments:
  file               File with two columns of numerical values,
                       tab-delimited.
```

#### Example
```
scatter.R two_col.txt
```
![Example scatter plot](examples/figures/two_col.txt.png?raw=true "Example scatter plot")