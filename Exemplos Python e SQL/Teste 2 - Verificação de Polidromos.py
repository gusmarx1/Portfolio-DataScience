def palindromos(palavras):

    for palavra in palavras:

        palavra_invertida = palavra[::-1]

        if palavra_invertida==palavra:
            palindromo_lista(palavra)            
            
def palindromo_lista(palavra):

    lista_palindromos.append(palavra)
    
    return(lista_palindromos)

palavras = ['radar', 'python', 'ana', 'level', 'mundo', 'arara', 'gugu']
lista_palindromos = [] #errado, passar isso pra função palindromos e reduzir tudo pra uma função

palindromos(palavras)

print(f'Palindromos encontrados: {len(lista_palindromos)}')

#Tarefas
#Crie uma função eh_palindromo(palavra) que verifica se uma palavra é palíndromo.
#Crie uma função palindromos_lista(lista) que retorna uma nova lista contendo apenas os palíndromos da lista original.
#Imprima o total de palíndromos encontrados e a lista.

