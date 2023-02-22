Partition<- function(g,
                     means,
                     mMSE,
                     dfr,
                     sig.level,
                     av,
                     k,
                     group,
                     ngroup,
                     markg,
                     g1=g,
                     sqsum=rep(0, g1))
{

  # Function for comparing all the treatment pairs in the sliding window
  # Return TRUE when each treatment pair in all the treatment pairs has negligible difference, otherwise returns FALSE
  diff <- function(k, g, av, means, windowsize) {

    negligible <- TRUE

    for(i in k:(k+windowsize-2)){
      for(j in (i+1):(k+windowsize-1)){
        a <- av$model[av$model[,2] == names(means[i]),1]
        b <- av$model[av$model[,2] == names(means[j]),1]
        # use the Cliff’s Delta effect size to analyse the difference between two treatments
        # Cliff’s Delta does not require the ANOVA assumptions
        magnitude <- as.character(effsize::cliff.delta(a,b)$magnitude, paired=TRUE)
        if(magnitude != "negligible"){
          negligible <- FALSE
        }
      }
    }
    return(negligible)
  }

  # Function for partitioning
  # Returns the number of treatments grouped by the sliding window
  negligiN <- function(k, g, av, means) {

    # initialize the sliding window size
    windowsize<-2

    # increase window size when the difference of each pair is negligible
    while(diff(k, g, av, means,windowsize)){
      windowsize<-windowsize+1
      if(windowsize>(g-k+1)){
        break
      }
    }
    return (windowsize-1)
  }


  while(k<g) {
    size <- negligiN(k, g, av, means)

    # it marks the groups, the initial value is 0
    ngroup <- ngroup + 1

    # it forms a group of means
    group[k:(k+size-1)] <- ngroup

    k <- (k+size)
  }

  # if there is only one treatment left, then it self forms a group
  if(k==g){
    ngroup <- ngroup + 1
    group[g] <- ngroup
  }
  return(group)
}
