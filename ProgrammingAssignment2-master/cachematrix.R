## Put comments here that give an overall description of what your
## functions do

## This function is used to create a matrix object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
      inv=NULL
      set=function(y){
        x<<-y
        inv<<-NULL
      }
      get=function()x
      setinverse=function(inverse) inv<<-inverse
      getinverse=function()inv
      list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## this function is used to compute the inverse of the matrix returned by the above function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv=x$getinverse()
  if(!is.null(inv)){
    message("getting cache data")
    retunr(inv)
  }
data=x$get()
inv=solve(data,...)
x$setinverse(inv)
inv
}
