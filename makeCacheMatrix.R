## makeCacheMatrix creates a special matrix object, and then cacheSolve
## calculates the inverse of the matrix.
## If the matrix inverse has already been calculated, it will instead
## find it in the cache and return it, and not calculate it again.

# Example usage:
# > x <- matrix(rnorm(16), nrow = 4) // Create a matrix x
# > cx <- makeCacheMatrix(x) // Create our special matrix
# > cx$get() // Return the matrix
# > cacheSolve(cx) // Return the inverse
# > cacheSolve(cx) // Call the 2nd time, so return
# // the cached inverse


# makeCacheMatrix: return a list of functions to:
# 1. Set the value of the matrix
# 2. Get the value of the matrix
# 3. Set the value of the inverse
# 4. Get the value of the inverse
makeCacheMatrix <- function(x = matrix()) {
    # inv will store the cached inverse matrix
    inv <- NULL

    # Setter for the matrix
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    # Getter for the matrix
    get <- function() x

    # Setter for the inverse
    setinv <- function(inverse) inv <<- inverse
    # Getter for the inverse
    getinv <- function() inv

    # Return the matrix with our newly defined functions
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}
