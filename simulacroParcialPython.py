#1 
def ultima_aparicion(s: list, e: int) -> int:
    indice:int = 0
    longitud = len(s)
    while indice < longitud:
        if e == s[longitud - 1 - indice]:
            return longitud - 1 - indice
        indice += 1

#2
def pertenece(n, l: list) -> bool:
    pertenece = False
    for e in l:
        if n == e:
            pertenece = True
    return pertenece

def pertenece_a_ambas(e:int, l1:list, l2:list) -> bool:
    return pertenece(e,l1) and pertenece(e,l2)

def elementos_exclusivos(s: list, t: list) -> list:
    res:list = []
    syt:list = s + t 
    for e in syt:
        if not pertenece_a_ambas(e,s,t):
            if not pertenece(e,res):
                res.append(e)
    return res

#3
def contar_traducciones_iguales(ingles: dict, aleman: dict) -> int:
    res:int = 0
    for palabra in ingles.keys():
        if pertenece(palabra,aleman.keys()) and ingles[palabra] == aleman[palabra]:
            res += 1
    return res

#4
def cuantas_veces_aparece(n:int,l:list) -> int:
    res:int = 0
    for e in l:
        if e == n:
            res += 1
    return res

def convertir_a_diccionario(lista: list) -> dict:
    diccionario:dict = {}
    for e in lista:
        diccionario[e] = cuantas_veces_aparece(e,lista)
    return diccionario
