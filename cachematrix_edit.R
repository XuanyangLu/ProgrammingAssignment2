## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL  # Initialize the cache for the inverse to NULL
  
  # Function to set the matrix
  set <- function(y) {
    x <<- y      # Assign the input matrix y to x in the parent environment
    inv <<- NULL 
  }
  
  # Function to get the matrix
  get <- function() {
    x  # Return the stored matrix
  }
  
  # Function to set the cached inverse
  setInverse <- function(inverse) {
    inv <<- inverse # Store the calculated inverse in the cache
  }
  
  # Function to get the cached inverse
  getInverse <- function() {
    inv # Return the cached inverse
  }
  
  # Return a list of the functions
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse() # Attempt to retrieve the cached inverse
  
  # If the cache is not empty (i.e., inverse is already computed)
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv) # Return the cached inverse
  }
  
  # If the cache is empty, get the matrix, compute inverse, cache it, and return it
  mat_data <- x$get()        # Get the matrix from our special object
  inv <- solve(mat_data, ...) # Compute the inverse
  x$setInverse(inv)          # Cache the computed inverse
  inv    
}
