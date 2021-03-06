#' Calculation of the first and third quantile
#'
#' It calculate the first an third quantil of continuous variables.
#'
#' @param x
#' Vector of continuous cariables.
#' @param k
#' Optional. The number of decimal places.
#' If not specified, the number of decimal places is 1 or 2.
#'
#'@param q.type
#' Optional. Integer between 1 and 9 that selects a quantile algorithm.
#'
#' @return
#' The first and third quantil is returned.
#'
#' @author
#' Lorenz Uhlmann, Csilla van Lunteren
#' seealso
#' \code{\link{formatr}}
#'
#' @examples
#' \dontrun{
#' set.seed(12345)
#' x<-rnorm(100)
#'
#' inqur(x, k = c(3), 4)
#' }
#'
inqur <- function(x, k = c(), q.type=2) {
  if (length(x) > 1){
    x.q1 <- stats::quantile(x, type = q.type)[2]
    x.q3 <- stats::quantile(x, type = q.type)[4]
    if (is.null(k)) {
      if (as.integer(x.q1 / 0.25 / 2) == (x.q1 / 0.25 / 2) | (as.integer(x.q1 / 0.25) != (x.q1 / 0.25))) {
        x.q1 <- round(x.q1, 1)
      } else {
        x.q1 <- round(x.q1, 2)
      }
      if (as.integer(x.q3 / 0.25 / 2) == (x.q3 / 0.25 / 2) | (as.integer(x.q3 / 0.25) != (x.q3 / 0.25))) {
        x.q3 <- round(x.q3, 1)
      } else {
        x.q3 <- round(x.q3, 2)
      }
    }else {
      x.q1 <- formatr(x.q1, k)
      x.q3 <- formatr(x.q3, k)
    }
    paste(x.q1, " -- ", x.q3, sep = "")
  }else{
    paste("-")
  }

}
