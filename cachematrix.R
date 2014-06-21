
## The following contain functions to invert a matrix. If the  
## inverse matrix has already been calculated, it retrieves it 
## from the cache. Otherwise, it inverts it and returns the value. 


## This first function contains a list of four sub-functions that 
## create a special matrix. These assign/retrieve the values of the 
## input matrix, and then assign/retrieve the value of the inverted 
## matrix. 

makeCacheMatrix <- function(x = matrix()) {

        mat  = NULL # initialize empty object "mat"
        
        # assigns "y" object to caches
        set <- function(y) {
                x <<- y # caches "y" value
                mat <<- NULL # resets/caches mat to NULL
        }
        
        # retrieves values from matrix
        get <- function() x 
        
        
        # calculate inverse matrix
        set.invmat <- function(solve) mat <<- solve 
        
        # retrieve inverse matrix
        get.invmat <- function() mat
        
        # return list of functions
        list(set = set, get = get, 
             set.invmat = set.invmat,
             get.invmat = get.invmat)
                
}


## This functions checks whether or not the matrix inverse has 
## already been cached. If it has, then it returns the cached values 
## (i.e., skipping the inversion calc). Otherwise, it calculates the 
## inverse matrix and returns the values. 


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
