imenuj <- function(x) {
  ifelse(x > 999999,
         paste(comma(x * 0.000001), "M"),
         ifelse(x > 999,
                paste(x * 0.001, "K"),
                paste(x)
                )
         )
}