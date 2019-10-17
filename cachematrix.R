## Put comments here that give an overall description of what your
## functions do
## The functions create a matrix, cache its inverse and retrive it

## Create a 2x2 matrix (x)

x <- matrix(c(1:4),2,2)

## Write a short comment describing this function
## This will create an object that will cache the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
  set <- function(y) {
          x <<- y
          i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

x1 <- makeCacheMatrix(x)


## Write a short comment describing this function
## Make inverse of matrix returned by above command
## If inverse was already computed, this function will return inverse matrix from the cache

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)) {
          message("getting cached data")
          return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}

cacheSolve(x1)