# Arquitetura do Projeto (MVC)

Para a criação do *Navalha App*, foi utilizada a arquitetura **MVC** (Model-View-Controller), uma das abordagens mais eficazes para desenvolvimento de aplicativos robustos e bem estruturados. Esta arquitetura promove a separação de responsabilidades em três componentes principais, facilitando a manutenção, a escalabilidade e a organização do código:

1. **Model (Modelo)**: No *Navalha App*, o componente Model é responsável por representar a lógica de negócios e os dados da aplicação. Ele gerencia as informações relacionadas aos usuários, barbearias, serviços, agendamentos e vendas, bem como a interação com o banco de dados SQLite. O Model inclui classes como `Usuario`, que encapsulam os dados e métodos necessários para a manipulação dessas informações, além de garantir a integridade e consistência dos dados.

2. **View (Visão)**: O componente View é responsável pela interface com o usuário (UI) do *Navalha App*. As Views são implementadas como telas em Flutter, onde cada tela é construída como um `StatefulWidget` separado. Estas telas exibem os dados fornecidos pelo Model e permitem que o usuário interaja com a aplicação de forma intuitiva e visualmente atraente, seguindo a paleta de cores estabelecida para o aplicativo.

3. **Controller (Controlador)**: O Controller atua como um intermediário entre o Model e a View. Ele processa as entradas do usuário, interage com o Model para obter ou atualizar dados, e instrui a View sobre como apresentar essas informações. No *Navalha App*, o Controller garante que a lógica de negócios seja aplicada corretamente e que as mudanças no estado do aplicativo sejam refletidas na interface do usuário de maneira eficiente.

A utilização da arquitetura MVC no *Navalha App* permite uma clara separação das preocupações, garantindo que o desenvolvimento seja modular e que cada componente possa ser desenvolvido, testado e mantido de forma independente. Isso resulta em um aplicativo mais flexível e adaptável a futuras melhorias e expansões.

# Fluxo dos Dados

No *Navalha App*, o fluxo de dados segue uma trajetória bem definida, baseada na arquitetura MVC (Model-View-Controller), garantindo que a comunicação entre as diferentes partes do sistema seja clara e eficiente. Abaixo está uma visão geral de como os dados fluem através dos componentes do aplicativo:

1. **Interação do Usuário (View para Controller)**:
   - O fluxo de dados começa quando o usuário interage com a interface do aplicativo (View), como ao preencher um formulário de login, agendar um serviço, ou visualizar o perfil de um barbeiro.
   - Essas ações são capturadas pela View, que então envia as informações para o Controller correspondente.

2. **Processamento da Lógica de Negócios (Controller para Model)**:
   - O Controller recebe os dados da View e processa a lógica de negócios necessária. Por exemplo, ao receber credenciais de login, o Controller valida os dados e, se necessário, faz uma chamada ao Model para verificar essas credenciais no banco de dados.
   - O Controller pode solicitar ao Model que consulte, insira, atualize ou exclua dados, dependendo da ação realizada pelo usuário.

3. **Manipulação e Armazenamento de Dados (Model)**:
   - O Model, após receber a solicitação do Controller, interage com o banco de dados SQLite, onde os dados são armazenados. Ele executa operações como leitura, escrita, atualização ou exclusão de registros.
   - Por exemplo, ao realizar um agendamento, o Model cria um novo registro no banco de dados que associa o cliente, o barbeiro, o serviço escolhido e a data/hora do agendamento.

4. **Atualização da Interface (Model para Controller para View)**:
   - Após a conclusão da operação no Model, os dados ou resultados são retornados ao Controller. O Controller, por sua vez, decide como esses dados devem ser exibidos ou como a interface deve ser atualizada.
   - Por exemplo, se um agendamento foi bem-sucedido, o Controller instrui a View a exibir uma mensagem de confirmação ou a atualizar a lista de agendamentos do usuário.
   - A View, ao receber as instruções do Controller, atualiza a interface do usuário, refletindo as mudanças de estado e proporcionando uma resposta visual adequada.

5. **Retroalimentação ao Usuário**:
   - Finalmente, o usuário recebe feedback visual na interface, confirmando que sua ação foi bem-sucedida ou que ocorreu um erro, se for o caso. Esse feedback fecha o ciclo de fluxo de dados, permitindo que o usuário continue a interagir com o aplicativo de maneira fluida e intuitiva.

Esse fluxo de dados garante que cada interação do usuário seja processada de forma eficiente e que as mudanças sejam refletidas na interface de maneira coerente, mantendo a consistência e integridade dos dados em todo o aplicativo.

![Diagrama de caso de uso](docs/CasoDeUso.jpeg)

# Banco de Dados 


### Tabela `Barbeiro`
- **idBarbeiro**: Identificador único para o Barbeiro (chave primária).
- **idUsuario**: Referência ao identificador do usuário associado ao barbeiro (chave estrangeira).
- **nome**: Nome do barbeiro.
- **foto**: Foto do barbeiro.

### Tabela `Cliente`
- **idCliente**: Identificador único para o Cliente (chave primária).
- **idUsuarioCli**: Referência ao identificador do usuário associado ao cliente (chave estrangeira).
- **nome**: Nome do cliente.
- **cpf**: CPF do cliente.
- **dataNasc**: Data de nascimento do cliente.
- **usuario**: Nome de usuário do cliente.
- **emailUsuario**: Email do cliente.
- **senhaUsuario**: Senha do cliente.
- **telefone**: Telefone do cliente.

### Tabela `EndereçoCliente`
- **idEndereco**: Identificador único para o endereço (chave primária).
- **idCliente**: Identificador único para o cliente (chave estrangeira).
- **bairro**: Bairro do cliente.
- **cep**: CEP do cliente.
- **rua**: Rua do cliente.
- **numero**: Número da residência do cliente.
- **complemento**: Complemento do endereço.

### Tabela `Barbearia`
- **idBarbearia**: Identificador único para a Barbearia (chave primária).
- **idBarbeiroPro**: Identificador único do barbeiro proprietário (chave estrangeira).
- **nomeBarbearia**: Nome da barbearia.
- **bairro**: Bairro onde a barbearia está localizada.
- **cep**: CEP da barbearia.
- **rua**: Rua da barbearia.
- **numero**: Número da barbearia.
- **complemento**: Complemento do endereço da barbearia.

### Tabela `ContratoBarbeiro`
- **idContratoBarbeiro**: Identificador único para o contrato do barbeiro (chave primária).
- **idBarbeiro**: Identificador único do barbeiro (chave estrangeira).
- **idBarbearia**: Identificador único da barbearia (chave estrangeira).

### Tabela `ServicoBarbeiro`
- **idServico**: Identificador único para o serviço do barbeiro (chave primária).
- **idBarbeiro**: Identificador único do barbeiro que oferece o serviço (chave estrangeira).
- **nomeServico**: Nome do serviço.
- **foto**: Foto do serviço.
- **valor**: Valor do serviço.

### Tabela `Repositorio`
- **idRepositorio**: Identificador único para o repositório (chave primária).
- **idBarbeiro**: Identificador único do barbeiro (chave estrangeira).

### Tabela `Post`
- **idPost**: Identificador único para o post (chave primária).
- **idRepositorio**: Identificador único do repositório associado (chave estrangeira).
- **imagemUrl**: URL da imagem do post.
- **vidioUrl**: URL do vídeo do post.
- **descricaoPost**: Descrição do post.
- **dataPost**: Data de criação do post.

### Tabela `Loja`
- **idLoja**: Identificador único para a loja (chave primária).
- **idBarbearia**: Identificador único da barbearia associada (chave estrangeira).

### Tabela `Produto`
- **idProduto**: Identificador único para o produto (chave primária).
- **nomeProduto**: Nome do produto.
- **precoUnitario**: Preço unitário do produto.
- **quantProduto**: Quantidade em estoque do produto.
- **descricaoProduto**: Descrição do produto.

### Tabela `ProdutoLoja`
- **idProdutoLoja**: Identificador único para a associação produto-loja (chave primária).
- **idLoja**: Identificador único da loja associada (chave estrangeira).
- **idProduto**: Identificador único do produto associado (chave estrangeira).

### Tabela `Venda`
- **idVenda**: Identificador único para a venda (chave primária).
- **idCliente**: Identificador único do cliente (chave estrangeira).
- **dataVenda**: Data da venda.
- **horaVenda**: Hora da venda.

### Tabela `ProdutoVenda`
- **idProdutoVenda**: Identificador único para a associação produto-venda (chave primária).
- **idProduto**: Identificador único do produto vendido (chave estrangeira).
- **idVenda**: Identificador único da venda (chave estrangeira).

### Tabela `Agendamento`
- **idAgendamento**: Identificador único para o agendamento (chave primária).
- **idCliente**: Identificador único do cliente que fez o agendamento (chave estrangeira).
- **dataAgen**: Data do agendamento.
- **valorTotal**: Valor total do agendamento.

### Tabela `ServicoAgendamento`
- **idServicoAgen**: Identificador único para a associação serviço-agendamento (chave primária).
- **idServico**: Identificador único do serviço (chave estrangeira).
- **idAgendamento**: Identificador único do agendamento (chave estrangeira).
- **dataServicoAgend**: Data do serviço agendado.
- **horaServico**: Hora do serviço.
- **valorServico**: Valor do serviço.
- **avaliacao**: Avaliação do serviço.


