##POR AHORA EXACTAS FUNCIONA, PERO LOS PROBLEMAS SIGUEN!
##GRILLA SALARIAL DOCENTE ABRIL 2025: https://aduba.org.ar/wp-content/uploads/2025/05/Instructivo-de-liquidacion..pdf


## PRIMERA PARTE
#EJERCICIO 1
#1
def pertenece(s: [int], e: int) -> bool:
    indice_actual: int = 0
    longitud: int = len(s)
    pertenece: bool = False

    while (indice_actual < longitud):
        if (e == s[indice_actual]):
            pertenece = True
        indice_actual = indice_actual + 1

    return pertenece

#2
def divideATodos(s: [int], e: int) -> bool: 
    indice_actual: int = 0
    longitud: int = len(s)
    divideATodos: bool = True

    while (indice_actual < longitud):
        if (s[indice_actual] % e != 0):
            divideATodos = False
        indice_actual = indice_actual + 1

    return divideATodos 

#3 
def suma_total(s: [int]) -> int:
    total: int = 0
    indice_actual: int = 0
    longitud: int = len(s)

    while (indice_actual < longitud):
        valor_actual: int = s[indice_actual]
        total = total + valor_actual
        indice_actual += 1
    
    return total

#4
def ordenados(s:[int]) -> bool:
    ordenados: bool = True
    indice: int = 0
    longitud: int = len(s)

    while (indice + 1 < longitud):
        for numero in s:
            if (s[indice] > s[indice + 1]):
                ordenados = False
        indice = indice + 1
    
    return ordenados

#5
def palabra_mas_de_7(s:[str]) -> bool:
    palabra_mas_de_7: bool = False
    
    for palabra in s:
        if (len(palabra) > 7):
            palabra_mas_de_7 = True
    
    return palabra_mas_de_7

#6
def palindromo(palabra: str) -> bool:
    palindromo: bool = True
    
    for i in range(0,len(palabra),1):
        if palabra[i] != palabra[len(palabra)-1-i]:
            palindromo = False
    
    return palindromo
        
#7
def tiene_minuscula(c: str) -> bool:
    indice_actual: int = 0
    longitud: int = len(c)
    tiene_minuscula: bool = False

    while (indice_actual < longitud):
        if ((c[indice_actual] <= "z") and (c[indice_actual]>= "a")):
            tiene_minuscula = True
        indice_actual = indice_actual + 1
    
    return tiene_minuscula
        
def tiene_mayuscula(c: str) -> bool:
    indice_actual: int = 0
    longitud: int = len(c)
    tiene_mayuscula: bool = False

    while (indice_actual < longitud):
        if ((c[indice_actual] <= "Z")  and (c[indice_actual]>= "A")):
            tiene_mayuscula = True
        indice_actual = indice_actual + 1
    
    return tiene_mayuscula

def tiene_numero(c: str) -> bool:
    indice_actual: int = 0
    longitud: int = len(c)
    tiene_numero: bool = False

    while (indice_actual < longitud):
        if ((c[indice_actual] <= "9") and (c[indice_actual]>= "0")):
            tiene_numero = True
        indice_actual = indice_actual + 1
    
    return tiene_numero

def fortaleza_contraseña(c: str) -> str:
    longitud: int = len(c)
    
    if (longitud < 5):
        return "ROJO"
    
    if ((tiene_numero(c)) and (tiene_mayuscula(c)) and (tiene_minuscula(c)) and (len(c) > 8)):
        return "VERDE"
    
    return "AMARILLO"

#8
def cuentabancaria(s:[(str, int)]) -> int:
    res: int = 0

    for tupla in s:
        if(tupla[0] == "I"):
            res = res + tupla[1]
        else:
            res = res - tupla[1]

    return res

#9
def cuantas_vocales(palabra: str) -> int:
    vocales = 0
    if palabra.count("a") >= 1:
        vocales += 1
    if palabra.count("e") >= 1:
        vocales += 1
    if palabra.count("i") >= 1:
        vocales += 1   
    if palabra.count("o") >= 1:
        vocales += 1
    if palabra.count("u") >= 1:
        vocales += 1
    return vocales 

def al_menos_tres_vocales(palabra:str) -> bool:
    return cuantas_vocales(palabra) >= 3

##SEGUNDA PARTE
#EJERCICIO 2
#1
def pares_ceros(lista:[int]) -> [int]:
    indice: int = 0
    
    for i in lista:
        if (i % 2 == 0):
            lista[indice] = 0
        indice += 1
    
    return lista

#2
def pares_ceros_in(lista:[int]) -> [int]:
    nueva:[int] = []
    
    for i in lista:
        if (i % 2 == 0):
            nueva.append(0)
        else: nueva.append(i)
        
    return nueva
        
#3 
def sacar_vocales(cadena:str) -> str:
    nuevo:str = ""

    for letra in cadena:
        if not (letra == "a" or letra == "e" or letra == "i" or letra == "o" or letra == "u"):
            nuevo += letra

    return nuevo

#4
def reemplaza_vocales(cadena:str) -> str:
    nuevo:str = ""

    for letra in cadena:
        if not (letra == "a" or letra == "e" or letra == "i" or letra == "o" or letra == "u"):
           nuevo += letra
        else: nuevo += "_"

    return nuevo

#5
def dar_vuelta_str(cadena:str) -> str:
    nuevo:str = ""

    for letra in cadena:
        nuevo = letra + nuevo 
    
    return nuevo 

#6
def pertenece_str(caracter:str, cadena:str) -> bool:
    pertenece_str:bool = False

    for letra in cadena: 
        if letra == caracter:
            pertenece_str = True

    return pertenece_str

def eliminar_repetidos(cadena:str) -> str:
    nuevo:str = ""

    for letra in cadena: 
        if not pertenece_str(letra, nuevo):
            nuevo += letra
    
    return nuevo

#EJERCICIO 3
def todas_mayores_a(minimo, notas:[int]) -> bool:
    todas_mayores_a = True

    for nota in notas:
        if nota < minimo:
            todas_mayores_a = False
    
    return todas_mayores_a

def aprobado(notas:[int]) -> int :
    nota:int = 0
    promedio:int = suma_total(notas) // len(notas)

    if not todas_mayores_a(4,notas):
        nota = 0

    elif promedio >= 7:
        nota = 1

    elif  7 > promedio:
        nota = 2

    return nota

#EJERCICIO 4
#1
def estudiantes() -> [str]:
    lista:[str] = []
    nombre = input("introduzca los nombres de los estudiantes \n")

    while nombre != "listo":
        nombre = input()
        lista.append(nombre)
    
    return lista

#2
def monedero() -> ([(str, int)]):
    carga_inicial:int = 0
    lista:[(str,int)] = []

    instruccion = input("introduzca C para cargar creditos, D para descontarlos o X para finalizar.\n")


    while not pertenece_str(instruccion,["X","x"]):
         if instruccion == "C" or instruccion == "c":
            carga = input("introduzca el monto a cargar:\n")
            carga_inicial += int(carga)
            tupla = (instruccion, int(carga))
            lista.append(tupla)
            instruccion = input("introduzca C para cargar creditos, D para descontarlos o X para finalizar.\n")

         elif instruccion == "D" or instruccion == "d":
            carga = input("introduzca el monto a descontar:\n")
            carga_inicial -= int(carga)
            tupla = (instruccion, int(carga))
            lista.append(tupla)
            instruccion = input("introduzca C para cargar creditos, D para descontarlos o X para finalizar.\n")

                   
    print("\nadios.\n")
    return lista

#3

#EJERCICIO 5
#1 
def perteneceACadaUno(s:[[int]], e:int) -> [bool]:
    res = []
    indice:int = 0
    longitud:int = len(s)

    for lista in s:
        res.append(pertenece (lista, e))

    return res

#2


#3

#4
