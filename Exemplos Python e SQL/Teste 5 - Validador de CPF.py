import pandas as pd

def validar_cpf(cpf):

    cpf_att = cpf.replace('.','')
    cpf_att = cpf_att.replace('-','')
    cpf_att = list(cpf_att)

    df_cpf_att = pd.DataFrame({'numeros':cpf_att})
    df_cpf_att['numeros'] = df_cpf_att['numeros'].astype(int)
    
    soma = df_cpf_att['numeros'].sum()

    numero_repetido = df_cpf_att['numeros'].values[0]
    
    validador = soma/numero_repetido

    if validador == 11:
        print(f'O CPF {cpf} não é válido.')
    else: 
        print("CPF válido")


cpf = input(f'Insira seu CPF: ')
validar_cpf(cpf)

