import requests

url = 'https://jsonplaceholder.typicode.com/posts?userId=1'

response = requests.get(url)
dados = response.json()

for post in dados:
    print(post['title'])