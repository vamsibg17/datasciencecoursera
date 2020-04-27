## Put comments here that give an overall description of what your
## functions do

## This function is used to create a matrix object that can cache its inverse.
# Argument parameter: Matrix, Output: List
makeCacheMatrix <- function(x = matrix()) {
  # Initialize the inverse value
      inv=NULL
      
      # Method to set the matrix
      set=function(y){
        x<<-y
        inv<<-NULL
      }
      # Method to get the matrix
      get=function()x
      # Method to set the inverse of the matrix
      setinverse=function(inverse) inv<<-inverse
      # Method to set the inverse of the matrix
      getinverse=function()inv
      # Output list
      list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## this function is used to compute the inverse of the matrix returned by the above function.
# Argument parameter: Matrix, Output: Inverse Matrix
cacheSolve <- function(x, ...) {
  # Initialize a matrix that is the inverse of x matrix
  inv=x$getinverse()
  
  # Return a matrix if it is the inverse of x matrix
  if(!is.null(inv)){
    message("getting cache data")
    retunr(inv)
  }
  # Get the matrix from the object
data=x$get()
# Method to solve the inverse using matrix multiplication
inv=solve(data,...)
# Set the inverse of inverse matrix
x$setinverse(inv)
# Return the matrix
inv
}
