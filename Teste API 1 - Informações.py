import requests
import pandas as pd

url = "https://jsonplaceholder.typicode.com/users/1"

response = requests.get(url)
user = response.json()

print('Nome do usuário:', user['name'])
print('Email do usuário:', user['email'])
print('Cidade:', user['address']['city'])









#response = requests.get(url)
#dados = response.json()

#print(f'Titulo do post:', dados["title"])
#print(dados["body"])

