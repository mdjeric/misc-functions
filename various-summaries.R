
out.stat <- function(x){
  ######## Vector: basic statistics ###########
  # Basic statistics (min, max, mean, SD)
  cat("Min: ", round(min(as.numeric(x), na.rm = TRUE),2),
      "Max: ", round(max(as.numeric(x), na.rm = TRUE),2),
      "Mean: ", round(mean(as.numeric(x), na.rm = TRUE),2),
      "SD: ", round(sd(as.numeric(x), na.rm = TRUE),2)
  )
}


out.tbls <- function(x){
  ######## Vector: freq, perc, cum. perc. ###########
  # returns frequency, percent, and cumulative percent
  # includes NA
  print(cbind(Freq =table(x, useNA = "ifany"),
              Relative =r ound(100*prop.table(table(x, useNA = "ifany")), 2),
              Cumul = round(100*cumsum(prop.table(table(x, useNA = "ifany"))),2)
  ))
}

out.tbls.wn <- function(x){
  ######## Vector: detailed summary ###########
  # Frequency table, including and excluding NA
  # Also basic statistics (min, max, mean, SD)
  cat("Variable summary:\n")
  a <- cbind(Freq = table(x, useNA = "ifany"),
             Relative = round(100*prop.table(table(x, useNA = "ifany")), 2),
             Cumul = round(100*cumsum(prop.table(table(x, useNA = "ifany"))),2),
             Relative = round(100*prop.table(table(x)), 2),
             Cumul = round(100*cumsum(prop.table(table(x))),2)
  )
  print(a)
  if (!(is.numeric(x))) {cat("Not numeric variable! This may not have meaning:\n")}
  cat("Min: ", round(min(as.numeric(x), na.rm = TRUE),2),
      "Max: ", round(max(as.numeric(x), na.rm = TRUE),2),
      "Mean: ", round(mean(as.numeric(x), na.rm = TRUE),2),
      "SD: ", round(sd(as.numeric(x), na.rm = TRUE),2)
  )
}

out.tbls.nn <- function(x){
  ######## Vector: detailed summary incl NA ###########
  # Frequency table, including NA
  # Also basic statistics (min, max, mean, SD)
  cat("Variable summary:\n")
  a <- cbind(Freq = table(x, useNA = "ifany"),
             Relative = round(100*prop.table(table(x, useNA = "ifany")), 2),
             Cumul = round(100*cumsum(prop.table(table(x, useNA = "ifany"))),2)
  )
  print(a)
  if (!(is.numeric(x))) {cat("Not numeric variable! This may not have meaning:\n")}
  cat("Min: ", round(min(as.numeric(x), na.rm = TRUE),2),
      "Max: ", round(max(as.numeric(x), na.rm = TRUE),2),
      "Mean: ", round(mean(as.numeric(x), na.rm = TRUE),2),
      "SD: ", round(sd(as.numeric(x), na.rm = TRUE),2)
  )
}

info.meansd <- function(DF){
  ######## Dataframe statistics ###########
  # returns basic statustucs for dataframe
  informacije <- sapply(DF, function(x) cbind(min(as.numeric(x), na.rm = TRUE),
                                              max(as.numeric(x), na.rm = TRUE),
                                              mean(as.numeric(x), na.rm = TRUE),
                                              sd(as.numeric(x), na.rm = TRUE),
                                              sum(is.na(x))))
  inform.rounded <- data.frame(
    min = round(informacije[1,],0),
    max = round(informacije[2,],0),
    mean = round(informacije[3,],2),
    SD = round(informacije[4,],2),
    NAs = informacije[5,]
  )
  print(inform.rounded)
  cat("Sample size N: ",nrow(DF))
}

info.detail <- function(DF){
  ######## More detailed df information ###########
  # returns detailed information on dataframe
  informacije <- sapply(DF, function(x) cbind(min(as.numeric(x), na.rm = TRUE),
                                               max(as.numeric(x), na.rm = TRUE),
                                               mean(as.numeric(x), na.rm = TRUE),
                                               sd(as.numeric(x), na.rm = TRUE),
                                               sum(is.na(x))))
  inform.rounded <- data.frame(
    min = round(informacije[1,],0),
    max = round(informacije[2,],0),
    mean = round(informacije[3,],2),
    SD = round(informacije[4,],2),
    NAs = informacije[5,]
  )
  for (i in (1:nrow(inform.rounded))) {
    if (is.numeric(DF[,i])) {
      inform.rounded[i,"type"] <- "numeric"
      inform.rounded[i,"lvl"] <- "."}
    else if (is.factor(DF[,i])) {
      if (is.ordered(DF[,i]))
        inform.rounded[i,"type"] <- "ordered f."
      else {
        inform.rounded[i,"type"] <- "categ. f."
        inform.rounded[i,1] <- "."
        inform.rounded[i,3] <- "."
        inform.rounded[i,4] <- "."
      }
      inform.rounded[i,"lvl"] <- inform.rounded[i,2]
      inform.rounded[i,2] <- "."
    }
    else {
      inform.rounded[i,"type"] <- "something third"
      inform.rounded[i,"lvl"] <- "."
    }
    if (inform.rounded[i,5] == 0) inform.rounded[i,5] <- "."
  }
  print(inform.rounded)
  cat("Sample size N: ",nrow(DF))
}