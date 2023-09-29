<h5>Obs:. Esse Git so contém as Querys SQL e PL/SQL do projeto</h5>
<h5>Para acessar o back-end do projeto, acesse git: https://github.com/MaateusMDS/Hlera.git</h5><br><br>
<h5></h5>



# Hlera do Bem

[Clique aqui para ver o vídeo Pitch!](https://www.youtube.com/watch?v=np_dhF9D3os&ab_channel=MateusMendes)

## Diagrama de classe
![Logo](https://media.discordapp.net/attachments/319622027675828231/1116171962935423076/Diagrama_de_classe.png?width=1049&height=671)


## Instalação

Dependências: 
- Java 17 
- MariaDB | Porta 3306 

**Baixe a última release do projeto**

Execute o .jar
```bash
  java -jar hlera.jar
```
    
## Documentação da API
**Altere o {{baseURl}} para seu endereço.**

## Pessoa

### Inserir pessoa

- Método: POST
- Autenticação: Basic Auth
    - Usuário: admin
    - Senha: 123
- URL: {{baseUrl}}/pessoa
- Tipos de grupo: DOADOR & BENEFICIARIO
- Body:
    ```json
    {
      "nome": "Amorim Luiza",
      "cpf": "332.714.808-50",
      "rg": "13.345.618-1",
      "dataNascimento": "24/07/2004",
      "numeroCelular": "1146274861",
      "dados": {
        "email": "luiza@gmail.com",
        "grupo": "DOADOR",
        "senha": "luiza123"
      },
      "endereco": {
        "logradouro": "Rua das Flores",
        "numero": "123",
        "bairro": "Centro",
        "cidade": "São Paulo",
        "estado": "SP",
        "cep": "01121-010"
      }
    }
    ```

### Encontrar pessoa pelo ID

- Método: GET
- Autenticação: Basic Auth
    - Usuário: admin
    - Senha: 123
- URL: {{baseUrl}}/pessoa/{idUser}

### Listar todas pessoas

- Método: GET
- Autenticação: Basic Auth
    - Usuário: admin
    - Senha: 123
- URL: {{baseUrl}}/pessoa

### Apagar pessoa pelo ID

- Método: DELETE
- Autenticação: Basic Auth
    - Usuário: admin
    - Senha: 123
- URL: {{baseUrl}}/pessoa/{idUser}

### Editar pessoa

- Método: PUT
- Autenticação: Basic Auth
    - Usuário: admin
    - Senha: 123
- URL: {{baseUrl}}/pessoa/{idUser}
- Body:
    ```json
    {
      "dados": {
          "grupo":"BENEFICIARIO"
      }
    }
    ```

## Campanha

### Inserir campanha

- Método: POST
- Autenticação: Basic Auth
    - Usuário: admin
    - Senha: 123
- URL: {{baseUrl}}/campanha
- Body:
    ```json
    {
        "nome": "Campanha de alimento",
        "tipoCampanha": "ALIMENTO",
        "itensDisponiveis": 2,
        "descricao":"Essa doação irá ocorrer em São Paulo"
    }
    ```

### Encontrar campanha pelo ID

- Método: GET
- Autenticação: Basic Auth
    - Usuário: admin
    - Senha: 123
- URL: {{baseUrl}}/campanha/{idCampanha}

### Encontrar campanha do usuário

- Método: GET
- Autenticação: Basic Auth
    - Usuário: admin
    - Senha: 123
- URL: {{baseUrl}}/campanha/user/{idUser}

### Listar todas campanhas

- Método: GET
- Autenticação: Basic Auth
    - Usuário: admin
    - Senha: 123
- URL: {{baseUrl}}/campanha

### Apagar campanha pelo ID

- Método: DELETE
- Autenticação: Basic Auth
    - Usuário: admin
    - Senha: 123
- URL: {{baseUrl}}/campanha/{idCampanha}

### Editar campanha

- Método: PUT
- Autenticação: Basic Auth
    - Usuário: admin
    - Senha: 123
- URL: {{baseUrl}}/campanha/{idCampanha}
- Body:
    ```json
    {
        "descricao":"Essa doação irá ocorrer em São Paulo, dia 20/06"
    }
    ```

## Inscrição

### Inserir inscrição

- Método: POST
- Autenticação: Basic Auth
    - Usuário: admin
    - Senha: 123
- URL: {{baseUrl}}/campanha/{idCampanha}/inscritos/{idUser}

### Listar inscritos

- Método: GET
- Autenticação: Basic Auth
    - Usuário: admin
    - Senha: 123
- URL: {{baseUrl}}/campanha/{idCampanha}/inscritos

### Deletar inscrição

- Método: DELETE
- Autenticação: Basic Auth
    - Usuário: admin
    - Senha: 123
- URL: {{baseUrl}}/campanha/{idCampanha}/inscritos/{idUser}

## Login

### Validar Login

- Método: GET
- Autenticação: Basic Auth
    - Usuário: admin
    - Senha: 123
- URL: {{baseUrl}}/login/user?user={user}?senha={senha}

### Existência de usuário

- Método: GET
- Autenticação: Basic Auth
    - Usuário: admin
    - Senha: 123
- URL: {{baseUrl}}/login/user?user={user}



