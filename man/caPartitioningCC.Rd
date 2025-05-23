% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/caPartitioningCC.R
\name{caPartitioningCC}
\alias{caPartitioningCC}
\title{Cross-contamination of cantaloupe during dicing and partitioning into packed units}
\usage{
caPartitioningCC(
  data = list(),
  probCCDice,
  trDicerMean = -1.42,
  trDicerSd = 0.52,
  nDicer,
  b = 1,
  unitSize,
  cantaRindFree = NULL,
  sizeSublot = NULL,
  sizeLot = NULL
)
}
\arguments{
\item{data}{a list of:
\describe{
\item{\code{N}}{(\code{CFU}) A matrix of size \code{newMC} sublots by \code{sizeSublot} portions of dices from one cantaloupe representing the numbers of \emph{L. monocytogenes}
in dices;}
\item{\code{P}}{Prevalence of contaminated sublots (scalar).}
}}

\item{probCCDice}{Probability of cross-contamination from the dicing machine (scalar).}

\item{trDicerMean}{Mean of the transfer coefficient of \emph{L. monocytogenes} from dicing machine to cantaloupe flesh (scalar or vector).}

\item{trDicerSd}{Standard deviation of the transfer coefficient of \emph{L. monocytogenes} from dicing machine to cantaloupe
flesh (scalar or vector).}

\item{nDicer}{(\code{CFU}) Numbers of \emph{L. monocytogenes} on the surface of the dicing machine ready to be transferred (scalar or vector).}

\item{b}{Dispersion factor of the beta distribution representing the degree of heterogeneity in the number of cells between pack units (scalar).}

\item{unitSize}{(\code{g}) Weight of a pack of cantaloupe dices (scalar).}

\item{cantaRindFree}{(\code{g}) Weight of a seedless rind-free cantaloupe (scalar).}

\item{sizeSublot}{Number of cantaloupes processed in a sublot. It should be a multiple of \code{sizeLot} (scalar).}

\item{sizeLot}{Number of cantaloupes from a harvested lot (scalar).}
}
\value{
A list with four elements:
\describe{
\item{\code{N}}{(\code{CFU}) A matrix of size \code{newMC} sublots by Number_packs number of packs containing the numbers of \emph{L. monocytogenes} in a pack,
from contaminated lots;}
\item{\code{P}}{Prevalence of contaminated sublots (scalar);}
\item{\code{sizeSublot}}{Number of cantaloupes processed in a sublot (scalar);}
\item{\code{sizeLot}}{Number of cantaloupes from a harvested lot (scalar).}
}
}
\description{
The \code{\link[=caPartitioningCC]{caPartitioningCC()}} function simulates the potential cross-contamination of cantaloupes, when in direct contact with the dicing machine
or knives, followed by the partitioning of all dices produced in one processing lot (sublot) into packed units.
The cross-contamination algorithm accounts for four possible scenarios:
\enumerate{
\item cross-contamination occurring in sublots already contaminated;
\item contamination occurring in sublots that were not contaminated;
\item no cross-contamination occurring in sublots already contaminated; and
\item no cross-contamination occurring in sublots that were not contaminated. Probabilities of occurrence of every event are computed.
}
The partitioning algorithm randomly distributes the total numbers of cells from a contaminated sublot of dices into packed units. The dispersion factor \code{b},
which is a parameter of the beta distribution, indicates the extent of cell clustering in the bulk of dices in the sublot, and ultimately
the heterogeneity in the number of cells distributed among pack units.
}
\note{
The value of \eqn{beta = 1} represents moderate clustering of cells in the bulk of diced cantaloupe from a
sublot \insertCite{Nauta2005;textual}{qraLm}. \insertCite{Hoelzer2012;textual}{qraLm} established the log 10 of the transfer coefficient
of \emph{L. monocytogenes} from knives to vegetables as a normal distribution with \eqn{TRdicer\_mean = -1.42} and \eqn{TRdicer\_sd = 0.52}.
}
\examples{
library(extraDistr)
library(mc2d)
sizeLot <- 500 # 500 cantaloupes were harvested from a field
sizeSublot <- 50 # sublots of 50 cantaloupes are processed at each time
dat <- Lot2LotGen(
  nLots = 50,
  sizeLot = 100,
  unitSize = 500,
  betaAlpha = 0.5112,
  betaBeta = 9.959,
  C0MeanLog = 1.023,
  C0SdLog = 0.3267,
  propVarInter = 0.7
)
str(dat)
Packs <- caPartitioningCC(dat,
                          probCCDice = 0.08,
                          trDicerMean = -1.42,
                          trDicerSd = 0.52, 
                          nDicer = 280,
                          b = 1,
                          sizeSublot = 50,
                          cantaRindFree = 950, 
                          unitSize = 250
                          )
hist(Packs$N)

}
\references{
\insertRef{Hoelzer2012}{qraLm}
\insertRef{Nauta2005}{qraLm}
\insertRef{extraDistr}{qraLm}
\insertRef{mc2d}{qraLm}
\insertRef{Rdpack}{qraLm}
\insertRef{stats}{qraLm}
\insertRef{iRisk2021}{qraLm}
}
\author{
Ursula Gonzales-Barron \email{ubarron@ipb.pt}
}
\keyword{cross-contamination}
\keyword{portioning}
