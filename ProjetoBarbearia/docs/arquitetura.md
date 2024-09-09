# Arquitetura do Projeto (MVC)

Para a Criação do Navalha foi utilizado a arquitettura MVC:

- **Model** : Pasta na qual fica os arquivos de armazenamento de dados do (Usuário, Agendamento, Cadastro).
- **View** : Pasta na qual fica a interface da aplicação. Telas de Cadastros de , Tela de Login, 
- **Control** : Pasta que realiza o processo de intermediação entre **Mpdel** e **View**, sendo responsável pelo gerenciamento dos dados entre telas e banco de dados.


# Fluxo de Dados

- O usuário com tela **(View)** , com por exemplo 'clicar em um botão de salvar cadastro'.
- A classe UserController **(Control)** é acionada, e iniciada o processo de armazenamento de todos os dados do usuário dentro das variaveis de user **(Model)** .
- O user **(Model)** ela envia e/ou recebe os dados do banco de dados SqLite.
- O UserController **(controller)** retorna os dados para a tela **(View)** .

<!-- Código para por imagem dentro da documentação -->
![Diagrama de caso de uso](docs/casodeuso.png)

# Banco de Dados

'Tabela Usuário'
- **id** : idenficador único para o usuário
- **nome** : nome do usuário
- **cpf** : cpf do usuário
- **idusuario** : armazena o identificado do usuário a qual o cadastro pertence.

' 