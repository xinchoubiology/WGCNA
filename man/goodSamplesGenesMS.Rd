\name{goodSamplesGenesMS}
\alias{goodSamplesGenesMS}
\title{  Iterative filtering of samples and genes with too many missing entries across multiple data sets
}
\description{
     This function checks data for missing entries and zero variance across multiple data sets 
and returns a list of samples and genes
that pass criteria maximum number of missing values. If necessary, the filtering is iterated.
}
\usage{
goodSamplesGenesMS(
  multiExpr,
  minFraction = 1/2,
  minNSamples = ..minNSamples,
  minNGenes = ..minNGenes,
  verbose = 2, indent = 0)
}
\arguments{
  \item{multiExpr}{  expression data in the multi-set format (see \code{\link{checkSets}}). A vector of
lists, one per set. Each set must contain a component \code{data} that contains the expression data, with
rows corresponding to samples and columns to genes or probes. }

  \item{minFraction}{ minimum fraction of non-missing samples for a gene to be considered good. }

  \item{minNSamples}{ minimum number of non-missing samples for a gene to be considered good.  }

  \item{minNGenes}{ minimum number of good genes for the data set to be considered fit for analysis. If
the actual number of good genes falls below this threshold, an error will be issued. }

  \item{verbose}{ integer level of verbosity. Zero means silent, higher values make the output
progressively more and more verbose. }

  \item{indent}{ indentation for diagnostic messages. Zero means no indentation, each unit adds
two spaces. }

}
\details{
  This function iteratively identifies samples and genes with too many missing entries, and genes with
zero variance. Iterations may be
required since excluding samples effectively changes criteria on genes and vice versa. The process is
repeated until the lists of good samples and genes are stable.
The constants \code{..minNSamples} and \code{..minNGenes} are both set to the value 4.

}
\value{
A list with the foolowing components:
  \item{goodSamples}{ A list with one component per given set. Each component is a logical vector with
one entry per sample in the corresponding set that is \code{TRUE} if the sample is
considered good and \code{FALSE} otherwise.  }

  \item{goodGenes}{  A logical vector with one entry per gene that is \code{TRUE} if the gene is
considered good and \code{FALSE} otherwise.  }

}
\author{ Peter Langfelder }
\seealso{
\code{\link{goodGenes}}, \code{\link{goodSamples}}, \code{\link{goodSamplesGenes}} for cleaning
individual sets separately;

\code{\link{goodSamplesMS}},  \code{\link{goodGenesMS}} for additional cleaning of multiple data
sets together. }

\keyword{ misc }% __ONLY ONE__ keyword per line

