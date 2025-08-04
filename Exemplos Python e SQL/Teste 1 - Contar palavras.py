from collections import Counter

def limpar_texto(texto):

    texto = texto.replace(',','')
    texto = texto.replace('.','')
    texto = texto.replace(';','')
    texto = texto.replace(':','')
    texto = texto.replace('?','')
    texto = texto.replace('!','')
    texto = texto.replace('-','')

    print(texto.lower())

    return texto.lower()

def contar_texto(texto):

    contar_palavras = Counter(texto.split())
    print("Palavras mais frequentes:")
    
    for palavra, freq in contar_palavras.most_common(5):
        print(f'{palavra}:{freq}')

texto = """
A análise de dados é uma etapa crucial em qualquer processo de tomada de decisão.
Ela permite extrair informações úteis e transformar dados brutos em conhecimento.
Conhecimento é poder — especialmente quando se trata de negócios.
"""

limpar_texto(texto)
contar_texto(texto)


# 1° - Faça uma função que tire as ',-.;' dos textos
# 2° - Conte o número de palavras 