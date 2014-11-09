voir
====

Scripts for quickly generating standard plots from the command line.

## Table of contents
* [histogram.R](#histogramr)
* [scatter.R](#scatterr)
* [heatscatter.R](#heatscatterr)
* [heatcontour.R](#heatcontourr)

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

### heatscatter.R

Plot a heat scatter plot from two columns of numbers

#### Usage
```
usage: heatscatter.R <file>

positional arguments:
  file               File with two columns of numerical values,
                       tab-delimited.
```

#### Example
```
heatscatter.R two_col.txt
```
![Example heat scatter plot](examples/figures/two_col.txt.heatscatter.png?raw=true "Example heat scatter plot")

### heatcontour.R

Plot a heat contour plot from two columns of numbers

#### Usage
```
usage: heatcontour.R <file>

positional arguments:
  file               File with two columns of numerical values,
                       tab-delimited.
```

#### Example
```
heatcontour.R two_col.txt
```
![Example heat contour plot](examples/figures/two_col.txt.heatcontour.png?raw=true "Example heat contour plot")