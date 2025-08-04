from collections import Counter
import pandas as pd


def contar_votos(votos):

    qtde_votos = Counter(votos)
    qtde_votos = qtde_votos.items()
    
    total_votos = len(votos)

    print(f'Total de votos: {total_votos}')
    print(f'----------------------------------------')
    
    for linguagem, votos_recebido in qtde_votos:
        
        percentual_votos = (votos_recebido/len(votos))*100 
        print(f'{linguagem}: {votos_recebido} votos ({percentual_votos:.2f}%)') 
    
    print(f'----------------------------------------')

    df = pd.DataFrame(qtde_votos)
    df.columns = ['linguagem','total_votos']
    max_votos = df['total_votos'].max()
    linguagem_vencedora = df.loc[df['total_votos']==max_votos, 'linguagem'].values[0]
    return print(f'Linguagem vencedora: {linguagem_vencedora}')


votos = [
    'Python', 'JavaScript', 'Python', 'C#', 'Java', 'Python', 'JavaScript', 'C++', 'Python', 'Java', 'C#', 'Python', 'C#', 'C++', 'Java', 'Python', 'JavaScript', 'JavaScript', 'Python', 'Java', 'C++', 'Python'
]
contar_votos(votos)