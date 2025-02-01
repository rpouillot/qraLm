# Declare 'cfu' as a global variable to avoid the warning
utils::globalVariables("cfu")

plotLotsECDF.qraLm <- function(x, ...) {
  # if (class(x)!= "qraLm")
  #   stop("object is not of class 'qraLm'")
  
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
