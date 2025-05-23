% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sfSmearingCC.R
\name{sfSmearingCC}
\alias{sfSmearingCC}
\title{External cross-contamination of fish fillets during smearing with salt, sugar or spices}
\usage{
sfSmearingCC(
  data = list(),
  pccSmearing,
  trSmearingMean,
  trSmearingSd,
  nSurface
)
}
\arguments{
\item{data}{a list of
\describe{
\item{\code{N}}{(\code{CFU}) A matrix of size \code{nLots} lots by \code{sizeLot} units containing the numbers of \emph{L. monocytogenes} on fish fillets;}
\item{\code{P}}{Mean prevalence of contaminated lots (scalar);}
\item{\code{ProbUnitPos}}{Probability of individual lots being contaminated (vector).}
}}

\item{pccSmearing}{Probability that cross-contamination with \emph{L. monocytogenes} occurs during dry salting,
or smearing the fillets with sugar/spices, through tables or other surfaces (scalar).}

\item{trSmearingMean}{Mean parameter of the normal distribution representing the variability in the log 10
of the transfer coefficient of \emph{L. monocytogenes} cells from surfaces to fish fillets (scalar or vector).}

\item{trSmearingSd}{Standard deviation parameter of the normal distribution representing the variability in the
log 10 of the transfer coefficient of \emph{L. monocytogenes} from surfaces to fish fillets (scalar or vector).}

\item{nSurface}{(\code{CFU}) Numbers of \emph{L. monocytogenes} cells on environmental elements in contact with fish
fillets while dry salting (or while smearing the fillets with sugar/spices) (scalar or vector).}
}
\value{
A list of three elements:
\describe{
\item{\code{N}}{(\code{CFU}) A matrix of size \code{nLots} lots by \code{sizeLot} units containing the numbers of \emph{L. monocytogenes}
in (dry-salted) fish;}
\item{\code{ProbUnitPos}}{Probability of individual lots being contaminated after smearing with ingredients (vector);}
\item{\code{P}}{Mean prevalence of contaminated lots after smearing with ingredients (scalar).}
}
}
\description{
The function \code{\link[=sfSmearingCC]{sfSmearingCC()}} simulates the potential external contamination of fish fillets during the process of
dry-salting when producing smoked salmon, or during smearing the fish fillets with salt, sugar and spices when producing
gravad or any macerated fish. The algorithm evaluates the cross-contamination event at fish fillet level (and not at lot level),
assuming that every fish fillet has the same probability \code{pccSmearing} of being contaminated when in contact
with contaminated environmental elements during the process of smearing with salt, sugar and/or spices.
}
\note{
The suggested parameters \code{trSmearingMean=-0.29} and \code{trSmearingSd=0.31} for the normal distribution about the
variability in the log 10 of the transfer coefficient of \emph{L. monocytogenes} were taken from \insertCite{Hoelzer2012;textual}{qraLm}, to
represent cross-contamination from board to meat. The values of \code{pccSmearing} and \code{nSurface} must be defined by the
user and/or assessed in scenarios.
}
\examples{

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
Nf <- sfSmearingCC(
                   dat,
                   pccSmearing = 0.05,
                   trSmearingMean = -0.29,
                   trSmearingSd = 0.31,
                   nSurface = 200
                   )
str(Nf)                    
Nf$P
mean(Nf$ProbUnitPos)
hist(Nf$N)

}
\references{
\insertRef{Hoelzer2012}{qraLm}
\insertRef{extraDistr}{qraLm}
\insertRef{stats}{qraLm}
\insertRef{iRisk2021}{qraLm}
}
\author{
Ursula Gonzales-Barron \email{ubarron@ipb.pt} and Regis Pouillot \email{rpouillot.work@gmail.com}
}
\keyword{contamination}
\keyword{external}
\keyword{salt}
\keyword{smearing}
\keyword{spices}
\keyword{sugar}
\keyword{surface}
\keyword{transfer}
