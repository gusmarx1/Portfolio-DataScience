def fizzbuzz_test(lista_numeros):

    for numero in lista_numeros:
    
        if (numero % 3) == 0 and (numero % 5) == 1:
            print("Fizzbuzz")
        elif (numero % 3) == 0:
            print("Fizz")
        elif (numero % 5) == 0:
            print("Buzz")
        else:
            print(numero)
            

    return lista_numeros


lista_numeros = range(1,101)
fizzbuzz_test(lista_numeros)
