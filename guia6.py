import math

#ejercicio 1
##1
def imprimir_hola_mundo() -> None:
    print('Hola Mundo')

##2
def imprimir_un_verso():
    print('hsadhsa \nfjdfj')

##3
def raizDe2():
    return round(math.sqrt(2), 4)

##4
def factorial_de_dos():
    return 2 * 1

##5
def perimetro() -> float:
    return 2 * math.pi 

#ejercicio 2
##1
def imprimir_saludo(n:str):
    print('Hola ' + n)

##2
def raiz_cuadrada_de(n:int):
    return math.sqrt(n)

##3
def fahrenheit_a_celsius(n):
    return ((n-32)*5)/9

##4
def imprimir_dos_veces(n):
    print(n * 2) 

##5
def es_multiplo_de(n:int,m:int):
    return n % m == 0

##6
def es_par(n):
    return es_multiplo_de(n,2)

##7
def cantidad_de_pizzas(n,m):
    return math.ceil((n*m)/8) 

#ejercicio 3
##1
def alguno_es_0(n,m):
    return n == 0 or m == 0

##2
def ambos_son_0(n,m):
    return n == 0 and m == 0

##3
def es_nombre_largo(n:str):
    return len(n) >= 3 and len(n) <= 8

##4
def es_bisiesto(n):
    return n % 4 == 0 and not n % 100 == 0

#ejercicio 4
def peso_pino(n):
    return min(n,300)*3 + max(0,n-300)* 2 
    
def es_peso_util(n):
    return n >= 400 and n <= 1000

def sirve_pino(n): 
    return es_peso_util(peso_pino(n))

#ejercicio 5
##1
def devolver_el_doble_si_es_par(n):
    if n % 2 == 0:
        return 2 * n

##2
def devolver_valor_si_es_par_sino_el_que_sigue(n):
    if es_par(n):
        print(n)
    else:
        print(n+1)

##3
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(n):
    if es_multiplo_de(n,3) and not es_multiplo_de(n,9):
        return n * 2
    if es_multiplo_de(n,9):
        return n * 3
    else: 
        return n 

##4
def lindo_nombre(n:str):
    if len(n) >= 5:
        print('Tu nombre tiene muchas letras!')
    else: 
        print('Tu nombre tiene menos de 5 caracteres')

##5
def elRango(n):
    if n < 5:
        print('Menor a 5')
    if n >= 10 and n <= 20:
        print('Entre 10 y 20')
    if n > 20:
        print('Mayor a 20')

##6
def vacaciones(s:str,n:int):
    if n < 18 or (s == 'F' and n >= 60) or (s=='M' and n >= 65):
        print('Andá de vacaciones')
    else:
        print('Te toca trabajar')

#ejercicio 6
##1
def numeros_sub_10():
    x: int = 1
    while x <= 10:
        print(x)
        x += 1
    
##2
def pares_10_40():
    x: int = 10
    while x <= 40:
        print(x)
        x += 2

##3
def eco_10():
    x:int = 0
    while x < 10:
        print('eco')
        x += 1

##4
def cuenta_regresiva(n):
    while n >= 1:
        print(n)
        n -= 1
    else:
        print('Despegue')

##5
def volver_al_futuro(n:int,m:int):
    while n > m:
        n -= 1
        print('Viajó un año al pasado, estamos en el año: ' + str(n))
        
##6
def visita_aristoteles(n:int):
    while n > (-364):
        n -= 20
        print('Viajó 20 años al pasado, estamos en el año: ' + str(n))

#ejercicio 7
##1
def numeros_sub_10_piola():
    for x in range(1,10+1,1):
        print(x)

##2
def pares_10_40_piola():
    for x in range(10,40+1,2):
        print(x)

##3
def eco_10_piola():
    for x in range(1,10+1,1):
        print('eco')

##4
def cuenta_regresiva_piola(n):
    for x in range(n,1-1,-1):
        print(x)
    else: 
        print('Despegue')
##5
def volver_al_futuro_piola(n:int,m:int):
    for x in range(n-1,m-1,-1):
        print('Viajó un año al pasado, estamos en el año: ' + str(x))

##6
def visita_aristoteles_piola(n:int):
    for x in range(n-20,-384,-20):
        print('Viajó 20 años al pasado, estamos en el año: ' + str(x))

#ejercicio 8

def rt(x: int, g: int) -> int:
    g = g + 1
    return x + g

g: int = 0
def ro(x: int) -> int:
    global g
    g = g + 1
    return x + g

#1. ¿Cuál es el resultado de evaluar tres veces seguidas ro(1)?

## 3 + 1 = 4

#2. ¿Cuál es el resultado de evaluar tres veces seguidas rt(1, 0)?

## 1 + 1 = 2

#3. Dar la especificación en lenguaje natural para cada función, rt y ro.

## rt : (x:int, g:int) -> Int
### requiere:{True}
### asegura: {le sumo 1 a g y a ese resultado le sumo x}

## ro : (x:int) -> Int
### requiere:{True}
### asegura: {llamo a una variable global g. a esa variable global la reescribo como g + 1. luego, a la variable global g reescrita le sumo x}
