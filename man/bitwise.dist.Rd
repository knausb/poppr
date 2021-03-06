% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bitwise.r
\name{bitwise.dist}
\alias{bitwise.dist}
\title{Calculate a dissimilarity distance matrix for SNP data.}
\usage{
bitwise.dist(x, percent = TRUE, mat = FALSE, missing_match = TRUE,
  differences_only = FALSE, threads = 0)
}
\arguments{
\item{x}{a \code{\link{genlight}}, \code{\link{genind}},
\code{\link{genclone}}, or \code{\link{snpclone}} object.}

\item{percent}{\code{logical}. Should the distance be represented from 0 to 
1? Default set to \code{TRUE}. \code{FALSE} will return the distance 
represented as integers from 1 to n where n is the number of loci.}

\item{mat}{\code{logical}. Return a matrix object. Default set to 
\code{FALSE}, returning a dist object. \code{TRUE} returns a matrix object.}

\item{missing_match}{\code{logical}. Determines whether two samples differing
by missing data in a location should be counted as matching at that 
location. Default set to \code{TRUE}, which forces missing data to match 
with anything. \code{FALSE} forces missing data to not match with any other
information.}

\item{differences_only}{\code{logical}. Determines whether the matrix should 
count differences or distances. For instance, 0 to 2 would be a distance of
2 but a difference of 1.}

\item{threads}{The maximum number of parallel threads to be used within this 
function. A value of 0 (default) will attempt to use as many threads as 
there are available cores/CPUs. In most cases this is ideal. A value of 1 
will force the function to run serially, which may increase stability on 
some systems. Other values may be specified, but should be used with 
caution.}
}
\value{
A dist object containing pairwise distances between samples.
}
\description{
This function performs the same task as \code{\link{diss.dist}}, calculating 
the number of allelic differences between two samples.
}
\details{
The distance calculated here is quite simple and goes by many names,
  depending on its application. The most familiar name might be the Hamming 
  distance, or the number of differences between two strings.
}
\examples{
set.seed(999)
x <- glSim(n.ind = 10, n.snp.nonstruc = 5e2, n.snp.struc = 5e2, ploidy = 2)
x
system.time(xd <- bitwise.dist(x))
xd
}
\author{
Zhian N. Kamvar, Jonah C. Brooks
}
\seealso{
\code{\link{diss.dist}},
   \code{\link{snpclone}},
   \code{\link[adegenet]{genlight}},
   \code{\link{win.ia}}, 
   \code{\link{samp.ia}}
}

