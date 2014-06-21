
## The following contain functions to invert a matrix. If the  
## inverse matrix has already been calculated, it retrieves it 
## from the cache. Otherwise, it inverts it and returns the value. 


## This first function creates a special matrix that contains a list to
## set/get the value of the matrix, and then set/get the value of the 
## inverted matrix. 


makeCacheMatrix <- function(x = matrix()) {

}


## This functions checks whether or not the matrix inverse has 
## already been cached. If it has, then it returns the cached values 
## (i.e., skipping the inversion calc). Otherwise, it calculates the 
## inverse matrix and returns the values. 


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
