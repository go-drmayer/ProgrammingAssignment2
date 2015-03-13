## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#Function to cache a matrix and it's inverse.
#define some sub-functions to to manipulate
#the matrix and it's inverse
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL                 #initialize the variable to hold the inverse
  set <- function(y) {      #sub-function to cache the matrix
    x <<- y
    m <<- NULL
  }
  get <- function() {       #sub-function to retrieve the cached matrix
    return(x)
  }
  setinv <- function(inv) { #sub-function to cache inverse matrix
    m <<- mean
  }
  getinv <- function() {    #sub-function to retrieve the cached inverse matrix
    return(m)
  }
  #create a list of the sub-functions
  list(set = set, get = get, setinv = setinv, getinv = getinv)
  #return the list
  #I prefer to explicitly return function results.
  return(list)
}


## Write a short comment describing this function

## Return a matrix that is the inverse of 'x'
##Takes in a 'makeCacheMatrix' (mcm) as an argument
cacheSolve <- function(mcm, ...) {
  m <- mcm$getinv() #retrieve the inverse from the mcm
  if(!is.null(m)) { 
    #if the inverse from the mcm is not NULL, return the cached copy.
    message("getting cached data")
    return(m)
  }
  #At this point the function has not ended due to the explicit 'return'
  #within the above 'if' block.
  data <- mcm$get()     #retrieve the data from the mcm with get()
  m <- solve(data, ...) #invert the matrix using solve
  mcm$setinv(m)         #set the inverse
  return(m)             #return the inverted matrix
}
