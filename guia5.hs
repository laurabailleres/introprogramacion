--POR AHORA EXACTAS FUNCIONA, PERO LOS PROBLEMAS SIGUEN!
--GRILLA SALARIAL DOCENTE: https://aduba.org.ar/wp-content/uploads/2024/07/Instructivo-Liquidacion-Salarios-JULIO-2024.pdf





--ejercicio 1

--1 que dada una lista devuelve su cantidad de elementos
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

--2 problema ultimo (s: seq⟨T⟩) : T {requiere: { |s| > 0 } asegura: { resultado = s[|s| − 1] }
ultimo :: [t] -> t
ultimo (x:xs) | longitud xs == 0 = x
              | otherwise = ultimo xs

--3 problema principio (s: seq⟨T⟩) : seq⟨T⟩ { requiere: { |s| > 0 } asegura: { resultado = subseq(s, 0, |s| − 1) }
principio::[t]->[t]
principio [x] = []
principio (x:xs) = x : principio xs

--4 problema reverso (s: seq⟨T⟩) : seq⟨T⟩ { requiere: { T rue } asegura: { resultado tiene los mismos elementos que s pero en orden inverso.}
reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]



--ejercicio 2

--1
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece n (x:xs) | n == x = True
                   | otherwise = pertenece n xs

--2
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (y:x:xs) | y /= x = False
                      | otherwise = todosIguales xs

--3
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos [x] = True
todosDistintos (x:xs) | pertenece x xs = False
                      | otherwise = todosDistintos xs

--4
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos [x] = False
hayRepetidos (x:xs) | pertenece x xs = True
                    | otherwise = hayRepetidos xs

--5

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar n (x:xs) | n == x = xs
                | otherwise = [x] ++ quitar n xs

--6
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos n (x:xs) | n == x = quitarTodos n xs
                | otherwise = [x] ++ quitarTodos n xs

--7 
eliminarRepetidos :: (Eq t) => t -> [t] -> [t]
eliminarRepetidos _ [] = []
eliminarRepetidos n (x:xs) | n == x = n : quitarTodos n xs
                           | otherwise = [n] ++ eliminarRepetidos n xs

--8

todosPertenecen :: (Eq t) => [t] -> [t] -> Bool
todosPertenecen [] [] = True
todosPertenecen [n] hs = pertenece n hs
todosPertenecen (x:xs) ys | pertenece x ys = todosPertenecen xs ys
                          | otherwise = False

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True 
mismosElementos [x] [y] = pertenece x [y] && pertenece y [x]
mismosElementos xs ys | todosPertenecen xs ys && todosPertenecen ys xs = True
                      | otherwise = False

--9
capicua :: (Eq t) => [t] -> Bool
capicua t = reverso t == t



--ejercicio 3
