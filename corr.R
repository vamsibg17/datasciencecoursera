corr <- function(directory, threshold=0)
{
  file_names <- list.files(directory, full.names = TRUE)
  dat <- numeric()
  for (i in 1:length(file_names)){
    moni_i <- read.csv(file_names[i])
    nobs <- sum(complete.cases(moni_i))
    if (nobs>threshold){
      dat <- c(dat, cor(moni_i$sulfate, moni_i$nitrate,use="complete.obs")) 
    }
  }
  dat
}

cr <- corr("~/R/datasciencecoursera/specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("~/R/datasciencecoursera/specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("~/R/datasciencecoursera/specdata", 2000)                
n <- length(cr)                
cr <- corr("~/R/datasciencecoursera/specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
