% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/caRetRTE.R
\name{caRetRTE}
\alias{caRetRTE}
\title{Display of RTE diced cantaloupe packs at retail}
\usage{
caRetRTE(
  data = list(),
  MPD = NULL,
  Tmin = -2.0196,
  tempMin,
  tempMode,
  tempMax,
  timeMin,
  timeMode,
  timeMax
)
}
\arguments{
\item{data}{a list of:
\describe{
\item{N}{(\code{CFU}) A matrix containing the numbers of \emph{L. monocytogenes} in packs of RTE diced cantaloupe at the start of retail, from contaminated lots;}
\item{P}{Prevalence of contaminated lots (scalar);}
\item{lnQt}{Natural log of the \code{Q} parameter at the start of retail (matrix);}
\item{lotEGR5}{(\eqn{h^{-1}}) Growth rate of \emph{L. monocytogenes} in cantaloupe flesh specific to every lot (vector);}
\item{unitSize}{(\code{g}) Weight of a pack of cantaloupe dices.}
}}

\item{MPD}{(log10 CFU/g) Maximum population density of \emph{L. monocytogenes} in cantaloupe flesh (scalar).}

\item{Tmin}{(\eqn{^\circ} C) Nominal minimum temperature for growth of \emph{L. monocytogenes} in cantaloupe flesh (suggested \eqn{default=-2.0196\ ^\circ C}) (scalar).}

\item{tempMin}{(\eqn{^\circ} C) Minimum retail temperature (scalar).}

\item{tempMode}{(\eqn{^\circ} C) Mode of the retail temperature (scalar).}

\item{tempMax}{(\eqn{^\circ} C) Maximum retail temperature (scalar).}

\item{timeMin}{(\code{h}) Minimum retail time (scalar).}

\item{timeMode}{(\code{h}) Mode of the retail time (scalar).}

\item{timeMax}{(\code{h}) Maximum retail time (scalar).}
}
\value{
A list of five elements:
\describe{
\item{N}{(\code{CFU}) A matrix containing the numbers of \emph{L. monocytogenes} in packs of RTE diced cantaloupe
at the end of retail, from contaminated lots;}
\item{P}{Prevalence of RTE diced cantaloupe lots contaminated with \emph{L. monocytogenes} (scalar);}
\item{lnQt}{Natural log of the \code{Q} parameter at the end of retail (matrix);}
\item{lotEGR5}{(\eqn{h^{-1}}) Growth rate of \emph{L. monocytogenes} in cantaloupe flesh specific to every lot (vector);}
\item{unitSize}{(\code{g}) Weight of a pack of cantaloupe dices.}
}
}
\description{
The function \code{\link[=caRetRTE]{caRetRTE()}} simulates the growth of \emph{L. monocytogenes} in RTE diced cantaloupe during display
at retail, and is based on the function \code{\link[=caGrowthBaranyi]{caGrowthBaranyi()}} The algorithm considers that RTE diced cantaloupe packs
from every lot are subjected to the same \code{lnQt} (passed from the previous logistic stage) and the same retail temperature (\code{Temp}).
Retail time is sampled at the unit level.
The input \code{data} provides the algorithm with the lot-specific values of \code{EGR5} and the. Pert distributions
represent the variability in transport time and temperature.
}
\note{
The suggested parameters for the Pert distribution of retail temperature are taken from \insertCite{Derens2015;textual}{qraLm}:
\eqn{Temp\_min=1.4\ ^\circ C}, \eqn{Temp\_mode=5.6\ ^\circ C} and \eqn{Temp\_max=9.8\ ^\circ C}. The parameter \eqn{Tmin=-2.0196\ ^\circ C} was determined from fitting
a square-root model to data extracted from multiple sources (refer to the function \code{\link[=caGrowthBaranyi]{caGrowthBaranyi()}}).
Parameters for the retail time distribution should be defined by the user and/or tested in scenarios. In addition to the
final \emph{L. monocytogenes} numbers, the function also returns the values of \code{lotEGR5} and \code{lnQt}
so that the \emph{L. monocytogenes} growth could be followed up in subsequent logistics stages.
}
\examples{
library(extraDistr)
dat <- caPrimaryProduction(
                           nLots = 100,
                           sizeLot = 100)
                           dat$unitSize = 900
                           dat$lotEGR5 = 0.3
                           dat$lnQt = 0.2
str(dat)
EndRetail <- caRetRTE(dat,
                      MPD = 10,
                      Tmin = -2.0196,
                      tempMin = 1.4, 
                      tempMode = 5.6, 
                      tempMax = 9.8,
                      timeMin = 2,
                      timeMode = 5,
                      timeMax = 9
                      )
str(EndRetail)
str(EndRetail$lnQt)

}
\references{
\insertRef{Derens2015}{qraLm}

\insertRef{mc2d}{qraLm}
}
\author{
Ursula Gonzales-Barron \email{ubarron@ipb.pt}
}
\keyword{Baranyi}
\keyword{growth}
\keyword{lag-phase}
\keyword{logistics}
\keyword{stochastic}
