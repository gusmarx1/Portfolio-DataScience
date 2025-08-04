import pandas as pd

def sistema_caixa(compras):

    produtos = []
    valores = []

    for produto, valor in compras.items():
        
        produtos.append(produto)
        valores.append(valor)

    df_compra = pd.DataFrame({'produtos': produtos, 'preco': valores})

    total_compra = df_compra['preco'].sum()
    max_valor = df_compra['preco'].max()
    min_valor = df_compra['preco'].min()
    media_compra = df_compra['preco'].mean()
    quantidade_itens = len(df_compra['preco']) 

    max_produto = df_compra.loc[df_compra['preco']==max_valor, 'produtos'].values[0]
    min_produto = df_compra.loc[df_compra['preco']==min_valor, 'produtos'].values[0]

    print(f'Total da compra: R${total_compra}')
    print(f'Valor máximo da compra: {max_produto} - R${max_valor}')
    print(f'Menor valor da compra: {min_produto} - R${min_valor}')
    print(f'Valor médio da compra: R${media_compra}')
    print(f'Quantidade de produtos: {quantidade_itens}')


compras = {
    'Arroz': 22.50,
    'Feijão': 9.90,
    'Azeite': 28.40,
    'Chocolate': 5.50,
    'Refrigerante': 7.00
}

sistema_caixa(compras)
