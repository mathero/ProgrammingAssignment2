##The following code is based off the example in the assignment.

## The below functions allow you to calculate the inverse of a matrix. 
## When the inverse is calculated the function will cache the inverse. 
## If the inverse is called again, but has already been calculated,
## the cached value will be retrived.

## The following function stores the data of the matrix as well as sub functions to
## set the matrix (set function) and inverse (setinverse function), and retrieve 
## the corresponding data (get and getinverse function).
makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y = matrix()) {
    browser()
    x <<- y
    inverse <<- NULL
  }
  
  get <- function() x
  setinverse <- function(z) inverse <<- z
  getinverse <- function() inverse
  
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## The following function is called when you wish to calculate the inverse. Using data
## from the above function the inverse is calculated and stored in the makeCacheMatrix function. 
## If the inverse has already been calculated the function will show you the 
## cached version.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getinverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  data <- x$get()
  inverse <- solve(data)
  x$setinverse(inverse)
  inverse
  
  
}
