average_excluding <- function(G, n) {
  ######## AVERAGE EXCLUDING ###########
  # returns the mean of G variables
  # for cases with more than n missing
  # G is dataframe of desired vars
  apply(G, 1,
        function(x) {
          if (sum(is.na(x)) > n) mean(x)
          else mean(x, na.rm = TRUE)
          }
        )
}