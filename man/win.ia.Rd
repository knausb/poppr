% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bitwise.r
\name{win.ia}
\alias{win.ia}
\title{Calculate windows of the index of association for genlight objects.}
\usage{
win.ia(x, window = 100L, min.snps = 3L, threads = 1L, quiet = FALSE)
}
\arguments{
\item{x}{a \code{\link{genlight}} or \code{\link{snpclone}} object.}

\item{window}{an integer specifying the size of the window.}

\item{min.snps}{an integer specifying the minimum number of snps allowed per 
window. If a window does not meet this criteria, the value will return as
NA.}

\item{threads}{The maximum number of parallel threads to be used within this 
function. A value of 0 (default) will attempt to use as many threads as
there are available cores/CPUs. In most cases this is ideal. A value of 1
will force the function to run serially, which may increase stability on
some systems. Other values may be specified, but should be used with
caution.}

\item{quiet}{if \code{FALSE}, a progress bar will be printed to the screen.}
}
\value{
Index of association representing the samples in this genlight
  object.
}
\description{
Genlight objects can contain millions of loci. Since it does not make much 
sense to calculate the index of association over that many loci, this
function will scan windows across the loci positions and calculate the index
of association.
}
\note{
this will calculate the standardized index of association from Agapow
2001. See \code{\link{ia}} for details.
}
\examples{

# with structured snps assuming 1e4 positions
set.seed(999)
x <- glSim(n.ind = 10, n.snp.nonstruc = 5e2, n.snp.struc = 5e2, ploidy = 2)
position(x) <- sort(sample(1e4, 1e3))
res <- win.ia(x, window = 300L) # Calculate for windows of size 300
plot(res, type = "l")

\dontrun{
# unstructured snps
set.seed(999)
x <- glSim(n.ind = 10, n.snp.nonstruc = 1e3, ploidy = 2)
position(x) <- sort(sample(1e4, 1e3))
res <- win.ia(x, window = 300L) # Calculate for windows of size 300
plot(res, type = "l")
}

}
\author{
Zhian N. Kamvar, Jonah C. Brooks
}
\seealso{
\code{\link[adegenet]{genlight}},
   \code{\link{snpclone}},
   \code{\link{samp.ia}},
   \code{\link{ia}},
   \code{\link{bitwise.dist}}
}

