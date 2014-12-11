l <- list("oh plz choose me"= "", 
          "Science" = "science", 
          "Transmission" = "am", 
          "Gears" = "gear")

#US spending on science, space, and technology
#Millions of todays dollars (US OMB)
science <- data.frame(c(1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009),
                      c(18.079,18.594,19.753,20.734,20.831,23.029,23.597,23.584,25.525,27.731,29.449))


getVariable <- function(v){
    i <- which(v == l)[[1]]
    l[v]
}