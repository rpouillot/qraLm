summaryRiskLot.qraLm <- function(x, ...) {
  # if (class(x)!= "qraLm")
  #   stop("object is not of class 'qraLm'")
  
  lotMeanRisk <- x$lotMeanRisk
  
  log_risk <- function(x) {
    ifelse(x != 0, log10(x), 0)
  }
  
  lotMeanRiskLog <- log_risk(lotMeanRisk)
  
  riskMin <- min(lotMeanRiskLog)
  riskMax <- max(lotMeanRiskLog)
  riskMedian <- stats::quantile(lotMeanRiskLog, probs = c(0.50), na.rm = TRUE)
  riskMean <- mean(lotMeanRiskLog, na.rm = TRUE)
  riskQ2.5 <- stats::quantile(lotMeanRiskLog, probs = c(0.025), na.rm = TRUE)
  riskQ97.5 <- stats::quantile(lotMeanRiskLog, probs = c(0.975), na.rm = TRUE)
  
  risk <- rbind(
    unname(riskMin),
    unname(riskQ2.5),
    unname(riskMean),
    unname(riskMedian),
    unname(riskQ97.5),
    unname(riskMax)
  )
  
  Statistics <- c("Minimum", "pct 2.5th", "Mean", "Median", "pct 97.5th", "Maximum")
  Riskstats <- data.frame(Statistics, risk)
  names(Riskstats) <- c("Statistics", "log10 Risk")
  
  DT::datatable(Riskstats,
                caption = "Summary statistics of mean risk per contaminated lot",
                class = "display",
                fillContainer = FALSE,
                options = list(dom = "t")) |>
    DT::formatSignif(columns = c("log10 Risk"), digits = 4)
}
