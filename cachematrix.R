## Put comments here that give an overall description of what your
## functions do

## Caching the Matrix Inverse
## Matrix inversion is a time consuming computation
## Caching the inverse of a matrix would rather be beneficial and save time
## Below are a pair of functions that are used to create a special object that 
## stores a matrix and caches its inverse.

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  ## Initialize the inverse property
  i <- NULL
  
  ## Method to set the matrix
  set <- function( matrix ) {
    m <<- matrix
    i <<- NULL
  }
  
  ## Method the get the matrix
  get <- function() {
    ## Return the matrix
    m
  }
  
  ## Method to set the inverse of the matrix
  setInverse <- function(inverse) {
    i <<- inverse
  }
  
  ## Method to get the inverse of the matrix
  getInverse <- function() {
    ## Return the inverse property
    i
  }
  
  ## Return a list of the methods
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Compute the inverse of a special matrix returned by "makeCacheMatrix"
## above. If the inverse is already calculated (and the matrix has not
## changed), then the "cachesolve" should retrieve the inverse from the cache.

my_matrix <- makeCacheMatrix(matrix(1:4, 2, 2))
## Write a short comment describing this function
cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  
## Just return the inverse if its already set
  if( !is.null(m) ) {
    message("getting cached data")
    return(m)
  }
  
## Get the matrix from our object
  data <- x$get()
  
## Calculate the inverse using matrix multiplication
  m <- solve(data) %*% data
  
## Set the inverse to the object
  x$setInverse(m)
  
## Return the matrix
  m
}
