#  Arquitetura do projeto (mvc)

Para a criação Navalha app  foi utilizado a arquitetura MVC: 

model: 
pasta na qual fica os arquivos de armazenamento de dados (Agendamento, Barbearia local,Barbeiro,clinte,Contrato BArbeir,endereço barbeiro,endereço cliente,loja,produto,produto loja,produto venda,serviço agenda, serviço Barbeiro e venda ).
-

view:
nessa pasta fica armazenamento de dados (adicionar Produto,agendamento cliente, cadastro, conta, cria_post, editar perfil barbeiro,editar perfil cliente, escolha, financeiro barbeiro, inicio Barbeiro, inicio clinte, login, perfil cliente, perfil barbeiro,produto cilente tela bucar barbeiro, tela cadastro barbeiro, e ultimos agendamentos).
control:
nessa pasta fica armazenada a fica o controller ( barbeiro COntroller,Clinete controller,login Controller).
dao
nessa fica armazenado o( bando de dados).
# Fluxo dos Dados
-![Diagrama de Casdo de Uso](docs/CasoDe)

O Navalha App foi desenvolvido para atender às principais necessidades de gestão e operação de uma barbearia moderna. As funcionalidades básicas do aplicativo incluem:

Cadastro e Login de Usuários:

Os usuários podem se registrar no aplicativo utilizando e-mail/senha ou através do login integrado com o Google (Gmail).
A funcionalidade de recuperação de senha permite que os usuários redefinam suas credenciais de forma segura.

Gestão de Perfis:

Tanto clientes quanto barbeiros podem criar e editar seus perfis, incluindo informações como nome, contato, foto de perfil, e detalhes adicionais relevantes.
Os barbeiros podem detalhar suas especialidades, horários disponíveis e anos de experiência.

Agendamento de Serviços:

Os clientes podem visualizar a agenda disponível dos barbeiros e agendar serviços como corte de cabelo, barba, entre outros.
O sistema permite a seleção de data, hora e barbeiro preferido, proporcionando uma experiência personalizada ao cliente.
Os clientes podem visualizar, editar ou cancelar seus agendamentos diretamente no aplicativo.

Gerenciamento de Serviços:

As barbearias podem cadastrar diferentes serviços oferecidos, definir preços e estimativas de duração para cada um.
Os barbeiros podem gerenciar sua disponibilidade, ajustando horários conforme necessário, e visualizar sua agenda diária ou semanal.

Controle de Vendas:

O aplicativo permite o registro de vendas e pagamentos, vinculando cada transação a um serviço e cliente específico.
As barbearias podem acompanhar o histórico de vendas, analisar o desempenho de serviços e barbeiros, e gerar relatórios financeiros básicos.

Notificações e Lembretes:

O Navalha App envia notificações aos clientes para lembrar dos agendamentos futuros, evitando esquecimentos e faltas.
As barbearias podem enviar notificações promocionais ou comunicados importantes para todos os usuários cadastrados.

Localização e Contato:

O aplicativo exibe a localização da barbearia, com integração ao Google Maps, permitindo que os clientes encontrem o estabelecimento facilmente.
Informações de contato, como telefone e redes sociais, também estão disponíveis para facilitar a comunicação direta entre clientes e a barbearia.

Histórico de Atendimentos:

Os clientes podem acessar um histórico detalhado de todos os serviços realizados, incluindo datas, barbeiros e valores pagos.
Essa funcionalidade ajuda os clientes a manter um registro de seus cortes de cabelo e preferências, além de facilitar a repetição de um serviço anterior.



![Diagrama de caso de uso](docs/casodeuso.png)

# BAnco de dados
'tabela Barbeiro'
id: idantificador unico para o Barbeiro
nome: nome do barbeiro
foto: foto barbeiro

'Tabela Barbeiro'
idBarbeiro: Identificador único para o Barbeiro (chave primária).
idUsuario: Referência ao identificador do usuário associado ao barbeiro (chave estrangeira).
nome: Nome do barbeiro.
foto: Foto do barbeiro.

'Tabela Cliente'
idCliente: Identificador único para o Cliente (chave primária).
idUsuarioCli: Referência ao identificador do usuário associado ao cliente (chave estrangeira).
nome: Nome do cliente.
cpf: CPF do cliente.
dataNasc: Data de nascimento do cliente.
usuario: Nome de usuário do cliente.
emailUsuario: Email do cliente.
senhaUsuario: Senha do cliente.
telefone: Telefone do cliente.

'Tabela EndereçoCliente'
idEndereco: Identificador único para o endereço (chave primária).
idCliente: Identificador único para o cliente (chave estrangeira).
bairro: Bairro do cliente.
cep: CEP do cliente.
rua: Rua do cliente.
numero: Número da residência do cliente.
complemento: Complemento do endereço.

'Tabela Barbearia'
idBarbearia: Identificador único para a Barbearia (chave primária).
idBarbeiroPro: Identificador único do barbeiro proprietário (chave estrangeira).
nomeBarbearia: Nome da barbearia.
bairro: Bairro onde a barbearia está localizada.
cep: CEP da barbearia.
rua: Rua da barbearia.
numero: Número da barbearia.
complemento: Complemento do endereço da barbearia.

'Tabela ContratoBarbeiro'
idContratoBarbeiro: Identificador único para o contrato do barbeiro (chave primária).
idBarbeiro: Identificador único do barbeiro (chave estrangeira).
idBarbearia: Identificador único da barbearia (chave estrangeira).

'Tabela ServicoBarbeiro'
idServico: Identificador único para o serviço do barbeiro (chave primária).
idBarbeiro: Identificador único do barbeiro que oferece o serviço (chave estrangeira).
nomeServico: Nome do serviço.
foto: Foto do serviço.
valor: Valor do serviço.

'Tabela Repositorio'
idRepositorio: Identificador único para o repositório (chave primária).
idBarbeiro: Identificador único do barbeiro (chave estrangeira).

'Tabela Post'
idPost: Identificador único para o post (chave primária).
idRepositorio: Identificador único do repositório associado (chave estrangeira).
imagemUrl: URL da imagem do post.
vidioUrl: URL do vídeo do post.
descricaoPost: Descrição do post.
dataPost: Data de criação do post.

'Tabela Loja'
idLoja: Identificador único para a loja (chave primária).
idBarbearia: Identificador único da barbearia associada (chave estrangeira).

'Tabela Produto'
idProduto: Identificador único para o produto (chave primária).
nomeProduto: Nome do produto.
precoUnitario: Preço unitário do produto.
quantProduto: Quantidade em estoque do produto.
descricaoProduto: Descrição do produto.

'Tabela ProdutoLoja'
idProdutoLoja: Identificador único para a associação produto-loja (chave primária).
idLoja: Identificador único da loja associada (chave estrangeira).
idProduto: Identificador único do produto associado (chave estrangeira).

'Tabela Venda'
idVenda: Identificador único para a venda (chave primária).
idCliente: Identificador único do cliente (chave estrangeira).
dataVenda: Data da venda.
horaVenda: Hora da venda.

'Tabela ProdutoVenda'
idProdutoVenda: Identificador único para a associação produto-venda (chave primária).
idProduto: Identificador único do produto vendido (chave estrangeira).
idVenda: Identificador único da venda (chave estrangeira).

'Tabela Agendamento'
idAgendamento: Identificador único para o agendamento (chave primária).
idCliente: Identificador único do cliente que fez o agendamento (chave estrangeira).
dataAgen: Data do agendamento.
valorTotal: Valor total do agendamento.

'Tabela ServicoAgendamento'
idServicoAgen: Identificador único para a associação serviço-agendamento (chave primária).
idServico: Identificador único do serviço (chave estrangeira).
idAgendamento: Identificador único do agendamento (chave estrangeira).
dataServicoAgend: Data do serviço agendado.
horaServico: Hora do serviço.
valorServico: Valor do serviço.
avaliacao: Avaliação do serviço.