##POR AHORA EXACTAS FUNCIONA, PERO LOS PROBLEMAS SIGUEN!
##GRILLA SALARIAL DOCENTE ABRIL 2025: https://aduba.org.ar/wp-content/uploads/2025/05/Instructivo-de-liquidacion..pdf

# Ejercicio 1
#
#  problema ultima_aparicion (s: seq⟨Z⟩, e: Z) : Z {
#    requiere: {e pertenece a s }
#    asegura: {res es la posición de la última aparición de e en s}
#  }

# Por ejemplo, dados
#   s = [-1,4,0,4,100,0,100,0,-1,-1]
#   e = 0
# se debería devolver res=7

#recorro la lista de atras para adelante para asegurarme de que la aparicion del elemento que busco sea la ultima en la lista

def ultima_aparicion(s: list, e: int) -> int:
    indice:int = 0
    longitud = len(s)
    while indice < longitud:
        if e == s[longitud - 1 - indice]:
            return longitud - 1 - indice
        indice += 1

# Ejercicio 2
#
#  problema elementos_exclusivos (s: seq⟨Z⟩, t: seq⟨Z⟩) : seq⟨Z⟩ {
#    requiere: -
#    asegura: {Los elementos de res pertenecen o bien a s o bien a t, pero no a ambas }
#    asegura: {res no tiene elementos repetidos }
#  }

# Por ejemplo, dados
#   s = [-1,4,0,4,3,0,100,0,-1,-1]
#   t = [0,100,5,0,100,-1,5]
# se debería devolver res = [3,4,5] ó res = [3,5,4] ó res = [4,3,5] ó res = [4,5,3] 
# ó res = [5,3,4] ó res = [5,4,3]

#defino una funcion auxiliar que me dice si un elemento pertenece o no a una lista

def pertenece(n, l: list) -> bool:
    pertenece = False
    for e in l:
        if n == e:
            pertenece = True
    return pertenece

#defino una funcion auxiliar que me dice si un elemento pertenece o no dos listas

def pertenece_a_ambas(e:int, l1:list, l2:list) -> bool:
    return pertenece(e,l1) and pertenece(e,l2)

#con estas funciones auxiliares ya puedo definir elementos_exclusivos 

def elementos_exclusivos(s: list, t: list) -> list:
    res:list = []
    syt:list = s + t 
    for e in syt:
        if not pertenece_a_ambas(e,s,t):
            if not pertenece(e,res):
                res.append(e)
    return res

# Ejercicio 3
#
# Se cuenta con un diccionario que contiene traducciones de palabras del idioma castellano (claves) a palabras
# en inglés (valores), y otro diccionario que contiene traducciones de palabras en castellano (claves) a palabras
# en alemán (valores). Se pide escribir un programa que dados estos dos diccionarios devuelva la cantidad de 
# palabras que tienen la misma traducción en inglés y en alemán.

#  problema contar_traducciones_iguales (ing: dicc⟨String,String⟩, ale: dicc⟨String,String⟩) : Z {
#    requiere: -
#    asegura: {res = cantidad de palabras que están en ambos diccionarios y además tienen igual valor en ambos}
#  }

#  Por ejemplo, dados los diccionarios
#    aleman = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
#    inglés = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}
#  se debería devolver res=2

# recorro las keys (claves) de ingles y me fijo a la vez si pertenece a la lista de keys (claves) de aleman Y si 
# el valor de la clave en ambas listas es igual. OJO: si pongo los dos operadores logicos en orden inverso (o sea
# digamos si pongo primero la igualdad y luego el pertenece), como no me estoy asegurando de que la clave EXISTE
# en el diccionario de palabras en aleman, el programa SE ROMPE o algo asi en realidad no se bien que pasa pero
#  no esta bueno.

def contar_traducciones_iguales(ingles: dict, aleman: dict) -> int:
    res:int = 0
    for palabra in ingles.keys():
        if pertenece(palabra,aleman.keys()) and ingles[palabra] == aleman[palabra]:
            res += 1
    return res

# Ejercicio 4
#
# Dada una lista de enteros s, se desea devolver un diccionario cuyas claves sean los valores presentes en s, 
# y sus valores la cantidad de veces que cada uno de esos números aparece en s

#  problema convertir_a_diccionario (lista: seq⟨Z⟩) : dicc⟨Z,Z⟩) {
#    requiere: -
#    asegura: {res tiene como claves los elementos de lista y res[n] = cantidad de veces que aparece n en lista}
#  }

#  Por ejemplo, dada la lista
#  lista = [-1,0,4,100,100,-1,-1]
#  se debería devolver res={-1:3, 0:1, 4:1, 100:2}
#  
# RECORDAR QUE NO IMPORTA EL ORDEN DE LAS CLAVES EN UN DICCIONARIO

# primero defino una funcion auxiliar que me dice cuantas veces aparece un elemento en una lista

def cuantas_veces_aparece(n:int,l:list) -> int:
    res:int = 0
    for e in l:
        if e == n:
            res += 1
    return res

# ahora defino mi diccionario recorriendo la lista y preguntandole a cada elemento cuantas veces aparece 

def convertir_a_diccionario(lista: list) -> dict:
    diccionario:dict = {}
    for e in lista:
        diccionario[e] = cuantas_veces_aparece(e,lista)
    return diccionario
