--POR AHORA EXACTAS FUNCIONA, PERO LOS PROBLEMAS SIGUEN!
--GRILLA SALARIAL DOCENTE ABRIL 2025: https://aduba.org.ar/wp-content/uploads/2025/05/Instructivo-de-liquidacion..pdf

--ejercicio 1

fibonacci :: Integer -> Integer
fibonacci n | n == 0 = 0
            | n == 1 = 1
            | n >= 2 = (fibonacci (n-1)) + (fibonacci (n-2))


--ejercicio 2 

parteEntera :: Float -> Integer
parteEntera n | n >= 0 && n < 1 = 0
              | otherwise = parteEntera (n - 1) + 1

--ejercicio 3

--esDivisible :: Integer -> Integer -> Bool 
--esDivisible n m | 

--ejercicio 4

sumaImpares :: Integer -> Integer
sumaImpares n | n == 1 = 1
              | ((mod n 2) == 1) = n + (sumaImpares(n - 2))
              | otherwise = sumaImpares(n - 1)

--ejercicio 5

--

--ejercicio 6

sumaDigitos :: Integer -> Integer
sumaDigitos n | n < 10 = n
              | otherwise = sumaDigitos(div n 10) + (mod n 10)

--ejercicio 7

todosIguales :: Integer -> Bool
todosIguales n | n < 10 = True
               | n < 100 = mod n 10 == (div n 10)
               | otherwise = todosIguales(div n 10) && (mod n 10) == mod (div n 10) 10


--ejercicio 8

--defino función aux cantidadDigitos
cantidadDigitos :: Integer -> Integer
cantidadDigitos n | n < 10 = 1
                  | otherwise = cantidadDigitos (div n 10) + 1

--ahora la uso en iesimoDigito 
iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i | (i == 1) && (n < 100) = mod n 10 
                 | cantidadDigitos n >= i = iesimoDigito (div n 10) (i-1)


--ejercicio 9

esCapicua :: Integer -> Bool
esCapicua n | n < 10 = True
            | todosIguales n = True
            | (iesimoDigito n (cantidadDigitos n) == mod n (10 ^ (cantidadDigitos n - 1))) = True
            | otherwise = iesimoDigito n (cantidadDigitos n) - 1 ==  mod n (10 ^ ((cantidadDigitos n) - 1))



--ejercicio 10

--a
--f1 :: Integer -> Integer
--f1 n | n == 1 = 3
--     | otherwise = f1(n-1) + (2 ^ n)
      
--b
--f2 :: Integer -> Integer -> Integer
--f2 n q | n == 1 = 1 + q
--       | otherwise = f2(n-1) + (q ^ n)

--c
--f3 :: Integer -> Integer -> Integer
--f3 n q | n == 1 = 1 + q
--       | otherwise = f3(2n-1) + (q ^ 2n)

--d


--ejercicio 11

--eAprox :: Integer -> Integer
--eAprox n | n == 0 = 1
--         | otherwise = eAprox (n - 1) + div 1 (n !)

--ejercicio 12

--ejercicio 18

--función aux. último dígito
ultimoDigito :: Integer -> Integer
ultimoDigito n = mod n 10

--función aux. sacar último dígito
sacarUltimoDigito :: Integer -> Integer
sacarUltimoDigito n = div n 10

mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n | n < 10 && mod n 2 == 0 = n
                 | n < 10 = -1
                 | mod (ultimoDigito n) 2 == 1 = mayorDigitoPar (sacarUltimoDigito n)
                 | (ultimoDigito n >=  mayorDigitoPar (sacarUltimoDigito n)) = ultimoDigito n
                 | otherwise = -1
