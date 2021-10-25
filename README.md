# Pravaler

## Instruções

Certifique-se de ter o docker e o docker-compose instalados em sua máquina. Para iniciar o projeto basta utilizar o comando `docker-compose up`. Caso ocorra algum erro de permissão de execução, rode o comando `chmod +x entrypoint.sh` e inicie o docker compose novamente.

## Utilizando a API

cURL para cadastrar um novo contato:

```sh
curl --request POST \
  --url http://localhost:4000/api/contacts \
  --header 'Content-Type: application/json' \
  --data '{
	"contact": {
		"name": "Person Name",
		"email": "person@example.com",
		"message": "new message",
		"subject": "A new subject",
		"phone_number": "7499999999"
	}
}'
```

Os e-mails estão sendo enviados para um adaptador local. Para consultá-los acesse a rota `http://localhost:4000/sent_emails`

## Testes automatizados

Para checar os testes, com o docker-compose ainda rodando, execute `mix test --cover --export-coverage default` na raiz do projeto, e para checar a porcentagem de cobertura, basta utilizar o comando `mix test.coverage`
