#Esta tarea trato sobre la resolución de una matriz inversa 
#alamcenando en el caché el resultado dentro de una función 
#"makeCacheMatrix" y también "Cache Solve", esto para evitar 
#realizar demasidos cálculos 

#Primero creamos un objeto, en esta caso una matriz para almacenar en cache su inverso
makeCacheMatrix <- function(m = matrix()) {
        #Damos inicio a la propiedad inversa
        i<-NULL #asigna NULL a una variable dentro del entorno actual


        #configuramos la matriz
        setmatrix <- function(matrix) {
                m <<- matrix
                i <<- NULL
        }
          
        #Obtenemos la matriz
        getmatrix <- function() {
                #Devolvemos la matriz
                m
        }
        
        #Ahora, obtenemos la inversa de la matriz
        # Establecemos la inversa de la matriz
        setinverse <- function(inverse) {
                i <<- inverse
        }
        
        #Obtebemos la inversa de la matriz 
        getinverse <- function() {
                #Devuelve a la propiedad inversa 
                i
                }
        
        list(setmatrix = setmatrix, getmatrix = getmatrix, # creamos una lista para guardad las funciones
              setinverse = setinverse,
              getinverse = getinverse)

}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse() #si ya se calculo un inverso, esta función lo obtiene
        if(!is.null(m)){
        message("getting cached data")
        return(m)       
        }
        #Obtenemos la matriz de nuestro objeto
        y <- x$getmatrix()

        #Calculamos la inversa
        m <- solve(y)
        
        #Establecemos su inversa
        x$setinverse(m)
        
        #Devolvemos la matriz
        m
}
