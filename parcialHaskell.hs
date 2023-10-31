--1
division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b) 

sumaVotosAfirmativos :: [Int] -> Int
sumaVotosAfirmativos [] = 0
sumaVotosAfirmativos (x:xs) = x + sumaVotosAfirmativos xs

porcentajeDeVotosAfirmativos :: [(String, String)] -> [Int] -> Int -> Float
porcentajeDeVotosAfirmativos xs ns v = (division (sumaVotosAfirmativos ns) v) * 100

--2
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece n (x:xs) | n == x = True
                   | otherwise = pertenece n xs

listaFormulas :: [(String, String)] -> [String]
listaFormulas [] = []
listaFormulas ((x,y):xs) = x : y : listaFormulas xs

formulasInvalidas :: [(String, String)] -> Bool
formulasInvalidas [] = False
formulasInvalidas ((x,y):xs) | x == y || pertenece x (listaFormulas xs) || pertenece y (listaFormulas xs) = True
                             | otherwise = formulasInvalidas xs

--3
candidatoVice :: String -> (String, String) -> Bool
candidatoVice n (x,y) = n == y 

cuantosVotosTuvo :: String -> [(String, String)] -> [Int] -> Int
cuantosVotosTuvo vice ((x,y):xs) ns | candidatoVice vice (x,y) = head ns
                                    | otherwise = cuantosVotosTuvo vice xs (tail ns)

porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeVotos vice xs ns = (division (cuantosVotosTuvo vice xs ns) (sumaVotosAfirmativos ns)) * 100

--4
menosVotos :: [Int] -> Int
menosVotos [x] = x
menosVotos (x:y:xs) | x <= y = menosVotos (x:xs)
                    | otherwise = menosVotos (y:xs)

menosVotado :: [(String, String)] -> [Int] -> String
menosVotado ((x,y):xs) (n:ns) | (menosVotos (n:ns) == n) = x
                              | otherwise = menosVotado xs ns