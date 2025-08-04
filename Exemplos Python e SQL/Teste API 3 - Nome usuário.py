import requests

url = 'https://jsonplaceholder.typicode.com/users'

response = requests.get(url)
dados = response.json()

print('----------------------')

for usuario in dados:
    print(usuario['name'])
    print(usuario['email'])
    print('----------------------')
