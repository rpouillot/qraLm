#' Plot the Empirical Cumulative Distribution Function (ECDF) of CFU/g in a contaminated lot
#'
#' @description This function plots the ECDF of CFU/g in a contaminated lot using ggplot2 and plotly.
#'
#' @param x A `qraLm` object containing lotMeans.
#' @param ... Additional arguments (currently unused).
#'
#' @return A `plotly` interactive ECDF plot.
#'
#' @import ggplot2
#' @import plotly
#' @export
#'
#' @examples
#' # Example usage (assuming x is a qraLm object)
#' # plotLotsECDF.qraLm(x)
plotLotsECDF.qraLm <- function(x, ...) {
  lotMeans <- x$lotMeans
  df <- data.frame(cfu = lotMeans) # weighted cels/g per lot
  
  plot <- ggplot2::ggplot(df, ggplot2::aes(x = cfu)) +
    ggplot2::theme_minimal() +
    ggplot2::stat_ecdf() +
    ggplot2::xlab("CFU/g in a contaminated lot") +
    ggplot2::ylab("Probability")
  
  p <- plotly::ggplotly(plot)
  return(p)
}
