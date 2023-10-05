--simulacro parcial 18 de septiembre 2023

--ejercicio 1

--problema relacionesValidas (relaciones: seq⟨String × String⟩) : Bool {
--requiere: {True}
--asegura: {(res = true) ↔ no hay tuplas en relaciones con ambas componentes iguales ni tuplas repetidas (sin considerar
--el orden)}

--defino una función auxiliar que me dice si dos relaciones son iguales

iguales :: (String, String) -> [(String, String)] -> Bool
iguales (x1,x2) [] = True
iguales (x1,x2) ((y1,y2):xs) | x1 == y1 && x2 == y2 = True
                             | x1 == y2 && x2 == y1 = True
                             | otherwise = iguales (x1,x2) xs

--con la función iguales ya definida, defino mi función relacionesValidas

relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas [(x1,x2)] | x1 == x2 = False
                            | otherwise = True
relacionesValidas [(x1,x2),(y1,y2)] | x1 == x2 = False
                                    | y1 == y2 = False
                                    | x1 == y1 && x2 == y2 = False
                                    | x1 == y2 && x2 == y1 = False
                                    | otherwise = True
relacionesValidas ((a,b):(v,w):xs) | iguales (a,b) ((v,w):xs) = False
                                   | otherwise = relacionesValidas xs

--ejercicio 2

--problema personas (relaciones: seq⟨String × String⟩) : seq⟨String⟩ {
--requiere: {relacionesValidas(relaciones)}
--asegura: {resu tiene exactamente los elementos que figuran en alguna tupla de relaciones en cualquiera de las dos
--posiciones, sin repetir}

--defino una función pertenece para cualquier tipo

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece n (x:xs) | n == x = True
                   | otherwise = pertenece n xs

--defino una función que toma una lista de relaciones y devuelve una lista de strings (personas)

listaPersonas :: [(String, String)] -> [String]
listaPersonas [] = []
listaPersonas ((x,y):xs) = x : y : listaPersonas xs 

--de esta lista de strings, saco las personas repetidas

sacarRepetidos :: (Eq t) => [t] -> [t]
sacarRepetidos [] = []
sacarRepetidos (x:xs) | pertenece x xs = pasoRecursivo
                      | otherwise = x : pasoRecursivo
                      where pasoRecursivo = sacarRepetidos xs

--ya con estas funciones auxiliares puedo definir mi función personas

personas :: [(String,String)] -> [String]
personas [] = []
personas xs = sacarRepetidos (listaPersonas xs)

--ejercicio 3

--problema amigosDe (personas: String, relaciones: seqhStringxStringi) :seqhStringi {
--requiere: { relacionesValidas(relaciones) }
--asegura: { res tiene exactamente los elementos que figuran en las tuplas de relaciones en las que una de sus componentes es persona} 

--mi función amigosDe toma un string (n, el nombre de la persona que quiero saber cuántos amigos tiene), una lista de tuplas (relaciones)
--y devueve una lista de strings (los amigos de n). Para esto, primero compara si n es igual a a (el primer elemento de la tupla). Si es
--igual, o sea que n es parte de la relación, devuelve b (el segundo elemento de la tupla) ya que este es su amigo y lo añade a la lista 
--que devuelve mi función al terminar de ejecutarse. Si n no es igual a a, compara n con b y hace lo mismo que cuando comparó con a. Si
--n no es igual a a y tampoco a b (o sea, que n no pertenece en la primera tupla de la lista de tuplas), entonces mi función hace recursión
--para seguir comparando con el resto de las tuplas.

amigosDe :: String -> [(String, String)] -> [String]
amigosDe n [] = []
amigosDe n ((a,b):xs) | n == a = b : pasoRecursivo
                      | n == b = a : pasoRecursivo
                      | otherwise = []
                      where pasoRecursivo = amigosDe n xs

--ejercicio 4

--problema personaConMasAmigos (relaciones: seqhStringxStringi) : String {
--requiere: { relaciones no vacía }
--requiere: { relacionesValidas(relaciones) }
--asegura: { res es el Strings que aparece más veces en las tuplas de relaciones (o alguno de ellos si hay empate)}

--IMPORTANTEEEEEEEEEEEE LEER LA ACLARACIÓN AL FINAL DE ESTE EJERCICIOOOOOOOOOOOOOOO GRACIAS. EL QUE AVISAAAAA NO TRAICIONAAAAAA

--primero defino una función que me dice cuántas veces aparece una persona en una lista de strings (personas)

cuantasVecesAparece :: String -> [String] -> Int
cuantasVecesAparece n [] = 0 
cuantasVecesAparece n (x:xs) | pertenece n (x:xs) = 1 + pasoRecursivo
                             | otherwise = pasoRecursivo
                             where pasoRecursivo = cuantasVecesAparece x xs

--luego, mi función cantidadApariciones toma la lista de strings (personas) y me devuelve una lista de NÚMEROS. Los elementos de 
--esta lista de números son la cantidad de apariciones que tiene cada elemento de la lista de personas. O SEA QUE si yo tengo una
--lista de PERSONAS (lista de strings) esta función me devuelve una lista de NÚMEROS con la MISMA CANTIDAD DE ELEMENTOS que la lista
--de personas y cada elemento de esta lista es la cantidad de veces que aparece una persona en la lista de personas, EN EL MISMO ORDEN.
--Si se ponen a testear esta función individualmente van a ver que no funciona del todo bien pero SÍ ANDA PARA EL USO QUE LE DOY EN 
--LA FUNCIÓN FINAL ASÍ QUE QUE NO CUNDA EL PÁNICO.

cantidadApariciones :: [String] -> [Int]
cantidadApariciones [] = []
cantidadApariciones (x:xs) = [cuantasVecesAparece x (x:xs)] ++ cantidadApariciones xs 

--ahora defino una función que me dice en qué posicion de la lista de números está el número más grande

enQuePosicionMaximo :: [Int] -> Int
enQuePosicionMaximo [] = 0
enQuePosicionMaximo (x:xs) | maximum (x:xs) == x = 1 
                           | otherwise = 1 + enQuePosicionMaximo xs

--ahora ya con todas estas funciones definidas puedo definir personaConMasAmigos. lo que hago acá (es medio falopero pero funciona...)
--es: PRIMERO transformo la lista de tuplas en una lista de strings (personas). ahora, con la función !! que viene en el preludio de
--haskell (está en la bibliografía de la materia no lo voy a explicar) busco EN QUÉ POSICIÓN APARECE EN LA LISTA DE PERSONAS la persona
--que tiene más amigos. y por qué hay un -1? porque la computadora empieza a contar en 0 pero mis funciones empiezan a contar en 1 y me 
--daba fiaca reescribir mis funciones así que lo solucioné así.

personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos xs = listaPersonas xs !! ((enQuePosicionMaximo (cantidadApariciones (listaPersonas xs))) - 1)


------------------ACLARACIÓN MUY MUY MUY IMPORTANTE------------------
--EN EL PARCIAL DE HASKELL NNNNOOOO NOS DEJARON USAR (PARA RESOLVER UN
--EJERCICIO MUY SIMILAR AL 4 DEL SIMULACRO) LA FUNCIÓN QUE VIENE EN EL
--PRELUDIO DE HASKELL QUE USÉ PARA RESOLVER EL PROBLEMA 4 (O SEA LA 
--FUNCIÓN !!). NO SE SUICIDEN, SE PUEDE RESOLVER DE OTRA FORMA, NO LO
--HAGO AHORA PORQUE TENGO QUE ESTUDIAR PARA ÁLGEBRA PERO LES JURO QUE 
--SE PUEDE.
