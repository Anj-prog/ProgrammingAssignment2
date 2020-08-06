## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# Here I am writing a function to calculate Inverse of a square matrix
# (we will assume) that the matrix given as input is invertible.
# 
# The first function The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to
# 
# set the value of the matrix
# get the value of the matrix
# set the value of the inverse of the matrix
# get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInv <- function(inverse) inv <<- inverse
  getInv <- function() inv
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}

# The following function calculates the inverse of the matrix
# created by above function
# However, it first checks to see if the inverse has already been calculated.
# If so, it gets the inverse from the cache and skips the computation.
# Otherwise, it calculates the inverse of the matrix and sets the value of the
# inverse in the cache via the setInv function.


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- inv(mat, ...)
  x$setInv(inv)
  inv
}
