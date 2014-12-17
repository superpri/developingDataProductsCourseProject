l <- list("oh plz choose me"= "", 
          "US spending on science, space, and technology" = "science", 
          "Suicides by hanging, strangulation and suffocation" = "deaths", 
          "Number of films Nicolas Cage appeared in" = "nicholasCage",
          "Per capita consumption of cheese" = "cheese",
          "Divorce rate in Maine" = "divorces",
          "Per capita consumption of margarine" = "margarine")

coolWords <- c("Nifty!", "Great!", "*thumbs up*", "Are you sure?", "Sweet!", "Alright!",
            "YES", "NOOOOO", "That's what he said", "Yeth, mathter.")

time <- c(1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009)

#US spending on science, space, and technology
#Millions of todays dollars (US OMB)
science <- c(18.079,18.594,19.753,20.734,20.831,23.029,23.597,23.584,25.525,27.731,29.449)

#Suicides by hanging, strangulation and suffocation
#Deaths (US) (CDC)    
deaths <- c(5.427,5.688,6.198,6.462,6.635,7.336,7.248,7.491,8.161,8.578,9.000)

#Number of films Nicolas Cage appeared in
nicholasCage <- c(2,2,2,3,1,1,2,3,4,1,4)

#Per capita consumption of cheese (US)
cheese <- c(29.8,30.1,30.5,30.6,31.3,31.7,32.6,33.1,32.7,32.8,NA)

#Divorce rate in Maine
#Divorces per 1000 people (US Census)    
divorces <- c(5,4.7,4.6,4.4,4.3,4.1,4.2,4.2,4.2,4.1,NA)

#Per capita consumption of margarine (US)
#Pounds (USDA)	
margarine <- c(8.2,7,6.5,5.3,5.2,4,4.6,4.5,4.2,3.7,NA)

#data frame with all data to analyze
df <- data.frame(time=time,
                 science=science, 
                 deaths=deaths, 
                 nicholasCage=nicholasCage, 
                 cheese=cheese, 
                 divorces=divorces, 
                 margarine=margarine)

#silly function to give a random cool word to put
#at the end of the text output thing
randomCoolWord <- function(){
    coolWords[runif(1,1,10)]   
}