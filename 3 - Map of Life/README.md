# Map of Life

## Functions
* `parsedna()`: Pases fasta file and returns a string which is the DNA sequence
* `cgr()`: Returns a (n + 1) by 2 matrix that contains the coordinates of each CGR point
* `processdata()`: Creates image from results from `cgr()`
* `main()`: Function that calls previous functions in the order they are supposed to be executed

## Scripts
This is the order in which the scripts should be run to replicate results
* `load_all.m`: Creates the corresponding CGR images for each of the Fasta files
* `dissimilarity_matrix.m`: Creates the structural dissimilarity index measure matrix
* `multidimensional_scaling.m`: Calculates the classical multidimensional scaling and plots the results according to the class of each species

## Additional Data Files
* `dsim.mat`: Results from calculating the structural dissimilarity index measure matrix
* `MDM.mat`: Results from calculating the classical multidimensional scaling
