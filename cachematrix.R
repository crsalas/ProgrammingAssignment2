
## The following script contains functions to invert a matrix. If the  
## inverse matrix has already been calculated, it retrieves it 
## from the cache. Otherwise, it inverts it and returns the value. 


## This first function contains a list of four sub-functions that 
## create a special matrix. These assign/retrieve the values of the 
## input matrix, and then assign/retrieve the value of the inverted 
## matrix. 

makeCacheMatrix <- function(x = matrix()) {
        mat  = NULL # initialize empty object "mat"
        
        # assigns "y" object to caches
        set = function(y) {
                x <<- y # caches "y" value
                mat <<- NULL # resets/caches mat to NULL
        }
        
        # retrieves values from matrix
        get = function() x 
        
        # calculate inverse matrix
        set.invmat = function(solve) mat <<- solve 
        
        # retrieve inverse matrix
        get.invmat = function() mat
        
        # return list of functions
        list(set = set, get = get, 
             set.invmat = set.invmat,
             get.invmat = get.invmat)
                
}


## The cacheSolve function checks whether or not the inverted matrix 
## has already been cached. If it has, then it returns the cached values 
## (i.e., skips the inversion calc). Otherwise, it calculates the 
## inverse matrix and print it. 

cacheSolve <- function(x, ...) {
        mat = x$get.invmat() # retrieves inverted matrix (if available)

        # if "mat" is NOT empty (i.e., value(s) are cached) ...
        if(!is.null(mat)) { 
                message("Retrieving cached matrix") 
                return(mat) # return cached data (i.e.,skip computation)
        }

        # if it's NOT cached... 
        data <- x$get() # retrieve the input matrix 
        mat <- solve(data, ...)  # invert it
        x$set.invmat(mat) # cache it for future use
        mat # print the inverted matrix
}




#######################################################
###                                                 ###
###              FOR FUNCTION TESTING.              ###
###        Coursera evaluators can ignore this.     ###
###                                                 ###
#######################################################

## Scott Francis'example tests (THANKS!!!)
        # create cacheable matrix object
        m <- makeCacheMatrix( )
        
        # initailize with a an easy to inspect matrix 
        m$set( matrix( c(0, 2, 2, 0 ), 2, 2))
        
        # note use of parens to retrieve the matrix part of the object
        m$get()
        
        # test the inverse cacher
        cacheSolve( m )
        
        # and again... should be cached now
        cacheSolve( m )
        
        # product of matrix mult should be identity matrix AND we should get the cached message
        m$get() %*% cacheSolve(m)
        
        # let R test identify for us
        all.equal( diag(2), m$get() %*% cacheSolve(m) )
        
        # save the inverse off and let's see if we can break it...
        m1<- cacheSolve(m)
        
        # set m to some new values
        m$set( matrix( rnorm(4), 2, 2) )
        
        # does fetching the inverse without any pre-caching work?
        all.equal( diag(2), m$get() %*% cacheSolve(m) )
        
        # what about testing m x the inverse we squirreled away in m1?
        all.equal( diag(2), m$get() %*% m1 )

        
        # try a bigger matrix and see if we can notice the caching effects
        m$set( matrix( rnorm( 1000000 ), 1000, 1000 ) )
        system.time(cacheSolve(m)) # benchmarking
        # First run:
        # user  system elapsed 
        # 2.01    0.00    2.03 

        # Now w/ cache
        system.time(cacheSolve(m)) 
        # user  system elapsed 
        # 0       0       0 
        
        # and double check it all still works...
        all.equal( diag( 1000 ), m$get() %*% cacheSolve(m) )
        
        
        
        
        
        
