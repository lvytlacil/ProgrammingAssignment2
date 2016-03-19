## ~~~~~~~~~~~~~~~~~~~~~~~~~FROM THE ORIGINAL FILE ~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#makeCacheMatrix <- function(x = matrix()) {
#}
## Write a short comment describing this function
#cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
#}
##~~~~~HERE IS MY CODE~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## this is making a fumnction for the cached matrix x
## it sets the function and then calls the inverse

makeCacheMatrix <- function(x = matrix()) {
        v <- NULL
        set <- function(y) {
                x <<- y
                v <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) v <<- inverse
        getinverse <- function() v
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## this is making a fumnction to solve for the inverse -- if the inverse was already in the cache, then
## this just grabs the inverse from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        v <- x$getinverse()
        if (!is.null(v)) {
                 message("getting cached data")
                 return(v)
        }
        matx <- x$get()
        v <- solve(matx, ...)
        x$setinverse(v)
        v
}
## ~~~~~TESTING MY WORK
testmymatrix <- makeCacheMatrix(matrix(1:4, 2, 2))
testmymatrix$get()
testmymatrix$getinverse()
cacheSolve(testmymatrix)
##do it again to show that it's alread inversed from last statement, so it's getting from cache
cacheSolve(testmymatrix)
testmymatrix$getinverse()



