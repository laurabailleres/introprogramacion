--POR AHORA EXACTAS FUNCIONA, PERO LOS PROBLEMAS SIGUEN!
--GRILLA SALARIAL DOCENTE ABRIL 2025: https://aduba.org.ar/wp-content/uploads/2025/05/Instructivo-de-liquidacion..pdf

-- ejercicio 1 :D 
--a
f :: Integer -> Integer
f 1 = 8
f 4 = 131
f 16 = 16

--b
g :: Integer -> Integer
g 8 = 16
g 16 = 4
g 131 = 1

--c
gof :: Integer -> Integer
gof x = g (f x)


fog :: Integer -> Integer
fog x = f (g x)



-- ejercicio 2 <3
--a
absoluto :: Integer -> Integer
absoluto x | x < 0 = (-1)*x 
           | x > 0 = x

--b
maximoAbsoluto :: Integer -> Integer -> Integer
maximoAbsoluto x y | x > y = x
                   | x < y = y

--c
maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 x y z | x > y && x > z = x
              | y > x && y > z = y
              | z > y && z > x = z

--d
algunoEs0 :: Integer -> Integer -> Bool
algunoEs0 x y = x == 0 || y == 0

--e
ambosSon0 :: Integer -> Integer -> Bool
ambosSon0 x y = x == 0 && y == 0

--f
mismoIntervalo :: Integer -> Integer -> Bool
mismoIntervalo x y = (x <= 3 && y <= 3) || (x > 3 && x <= 7 && y > 3 && y <= 7) || (x > 7 && y > 7)

--g
sumaDistinto :: Integer -> Integer -> Integer -> Integer
sumaDistinto x y z | x /= y && y /= z && x /= z = x + y + z
                   | y /= z && x == z = x + y
                   | y == z && x /= z = x + y
                   | x == y && y /= z = x + z
                   | x == y && y == z = x

--h
esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe x y = mod x y == 0

--i
digitoUnidades :: Integer -> Integer
digitoUnidades x = mod x 10

--j
digitoDecenas :: Integer -> Integer
digitoDecenas x = mod x 100



--ejercicio 3 :)
estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados x y = mod x y == 0



--ejercicio 4 :O
--a
--problema prodInt (t1, t2: RxR) :  Bool
--requiere: {True}
--asegura: {result = True <-> todos los pares (t1, t2) pertenece a RxR}

--prodInt :: (Float, Float) -> (Float, Float) -> Integer 
--prodInt v w =  (((fst v) * (fst w)) + ((snd v) * (snd w)))



--b
--problema todoMenor (t1, t2 : RxR) : Bool
--requiere: {True}
--asegura: {result = True <-> la primera componente  de t1 es menor que la primera componente de t2, 
--la segunda componente  de t1 es menor que la segunda componente de t2,} 

todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor v w | ((fst v) < (fst w) && (snd v) < (snd w)) = True
              | otherwise = False  

--c
--problema distanciaPuntos Int : Int
--requiere: {True}
--asegura: {resulte = True <-> devuelve la distancia entre dos puntos}

distanciaPuntos :: Float -> Float -> Float
distanciaPuntos x y = x - y

--d
--problema sumaTerna 
--requiere: {}
--asegura: {}

--g
--problema crearPar () : ()
--requiere: {True}
--asegura: {}

--h
--problema invertir (t1, t2 : RXR): (v1, v2)
--requiere: {True}
--asegura: {el primer elemento de t es el segundo elemento de v, y el segundo elemento de t es el primer elemento de v}

invertir :: (Int, Int) -> (Int, Int)
invertir v = (snd v, fst v)

--ejercicio 6 :p

bisiesto :: Integer -> Bool  
bisiesto x | mod x 4 == 0 = True        
           | otherwise = False



--ejercicio 9 :O
--a
--esta función devuelve 1 si n es igual a 0 y devuelve 0 si n es distinto a 0
---problema 9a (n : Z) : Int
----requiere: {True}
----asegura: {Si n==0, entonces res=1, en caso contrario res=0}
igualA0 :: Integer -> Integer
igualA0 n | n == 0 = 1
          | otherwise = 0 

--b
--esta función devuelve 1 si n es igual a 15 y -1 si n es igual a -15
---problema 9b (n : Z) : Int
----requiere: {True}
----asegura: {Si n==15, entonces res=1, si n==(-15), entonces res=(-1)}
igualA15 :: Integer -> Integer
igualA15 n | n == 15 = 1
           | n == -15 = -1 

--c
--esta función devuelve 7 si n es menor o igual a 9 y devuelve 5 si n es mayor o igual a 3
---problema 9c (n : Z) : Int
----requiere: {True}
----asegura: {Si n<=9, entonces res=7, si n>=3, entonces res=5}
funcionC :: Integer -> Integer
funcionC n | n < 10 = 7
           | n > 2 = 5 

--d
--esta función calcula el promedio de x e y
---problema 9d (Int -> Int : Z) : Int
----requiere: {True}
----asegura: {res = (x + y)/2}

--e
--esta función calcula el promedio de los dos elementos de una dupla
---problema 9e (Int, Int : Z) -> Int
----requiere: {True}
----asegura: {res = suma de ambos elementos de la dupla dividido por dos}

--f
--esta función nos dice si el resultado de redondear a para abajo resulta en que a sea igual a b
---problema 9f (Int -> Int : R) : Bool
----requiere: {True}
----asegura: {res = true <-> la parte entera de a es igual a b}
