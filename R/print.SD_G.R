#' Print SD_G objects
#'
#' S3 method to print SD_G objects.
#'
#' @param x A SD_G object
#' @param ... Optional parameters.
#'
#' @return The sdg ranks
#'
#' @rdname print
#' @export
print.SD_G <- function(x, ...){
  cat("\nGroups:\n")
  print(x$groups)
}
