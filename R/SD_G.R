#' @name SD_G
#' @title The SDG
#'
#' @description   The Statistical Difference based Grouping Test (SD-G) fixing the limitation of non-parametric Scott-Knott ESD
#' @param x A wide-format data frame.
#' @param alpha The significance level.
#'
#' @param ... Optional parameters.
#'
#' @return A SD_G object.
#'
#' @examples
#' data <- read.csv("/Users/hlp/R Project/SDG/example.csv", encoding="UTF-8")
#' sdg <- SD_G(data)
#' print(sdg)
#' plot(sdg)
#'
#' @import reshape2
#' @importFrom graphics axis mtext segments
#' @rdname SD_G
#' @aliases SD.G
#' @export

SD_G <- function(x, alpha=0.05, ...){
  x <- data.frame(x)
  av <- aov(value ~ variable, data=reshape2::melt(x, id.vars=0 ))
  sdg <- scottknottSDG(av, which='variable',  dispersion='s', sig.level=alpha)
  names(sdg$groups) <- rownames(sdg$m.inf)
  class(sdg) <- c(class(sdg),"SD_G")
  return(sdg)
}
