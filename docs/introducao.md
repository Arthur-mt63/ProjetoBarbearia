# Projeto Barbearia

# Arquitetura do Projeto (MVC)

Para a criação do Navalha App, foi utilizada a arquitetura MVC (Model-View-Controller), uma das abordagens mais eficazes para desenvolvimento de aplicativos robustos e bem estruturados. Esta arquitetura promove a separação de responsabilidades em três componentes principais, facilitando a manutenção, a escalabilidade e a organização do código:

 Model (Modelo): No *Navalha App, o componente Model é responsável por representar a lógica de negócios e os dados da aplicação. Ele gerencia as informações relacionadas aos usuários, barbearias, serviços, agendamentos e vendas, bem como a interação com o banco de dados SQLite. O Model inclui classes como Usuario, que encapsulam os dados e métodos necessários para a manipulação dessas informações, além de garantir a integridade e consistência dos dados.

 View (Visão): O componente View é responsável pela interface com o usuário (UI) do *Navalha App. As Views são implementadas como telas em Flutter, onde cada tela é construída como um StatefulWidget separado. Estas telas exibem os dados fornecidos pelo Model e permitem que o usuário interaja com a aplicação de forma intuitiva e visualmente atraente, seguindo a paleta de cores estabelecida para o aplicativo.

Controller (Controlador): O Controller atua como um intermediário entre o Model e a View. Ele processa as entradas do usuário, interage com o Model para obter ou atualizar dados, e instrui a View sobre como apresentar essas informações. No *Navalha App, o Controller garante que a lógica de negócios seja aplicada corretamente e que as mudanças no estado do aplicativo sejam refletidas na interface do usuário de maneira eficiente.

A utilização da arquitetura MVC no Navalha App permite uma clara separação das preocupações, garantindo que o desenvolvimento seja modular e que cada componente possa ser desenvolvido, testado e mantido de forma independente. Isso resulta em um aplicativo mais flexível e adaptável a futuras melhorias e expansões.

# Introdução
O Navalha app é um aplicativo desenvolvido para facilitar a conexão entre clientes e barbearias, trazendo uma solução prática para quem busca serviços de qualidade em locais próximos. Com uma interface amigável e recursos avançados, o aplicativo permite tanto ao cliente quanto ao barbeiro gerenciar suas atividades de forma simples e eficiente. Desenvolvido utilizando as melhores práticas de tecnologia móvel, o Navalhar app é uma ferramenta poderosa para quem deseja melhorar sua experiência em encontrar e agendar serviços em barbearias.
# objetivo
O principal objetivo do Navalha app é oferecer uma plataforma integrada que permita aos usuários localizar barbearias próximas, visualizar suas avaliações e serviços, e agendar atendimentos diretamente pelo aplicativo. Para os barbeiros, o aplicativo facilita o gerenciamento de clientes, controle de faturamento e organização de serviços, permitindo uma visão clara das finanças e um canal direto de interação com os clientes.
# Problematica
A necessidade de encontrar rapidamente barbearias de qualidade pode ser um problema para muitos clientes, especialmente quando se busca por confiança e eficiência em um atendimento próximo. Da mesma forma, barbeiros e donos de barbearias têm dificuldades em atrair novos clientes e gerenciar de maneira eficaz suas finanças e serviços. O Navalhar app  resolve essa lacuna ao conectar clientes e barbearias de maneira direta e organizada, promovendo maior praticidade para todos os envolvidos.
# Publica alva
O público-alvo do Navalha app é composto por dois grupos principais:

Clientes: Homens que estão em busca de barbearias próximas com serviços de qualidade e que desejam uma experiência ágil para encontrar, avaliar e agendar seus atendimentos.

Barbeiros e Donos de Barbearias: Profissionais que buscam um sistema eficaz para gerenciar seus serviços, atrair novos clientes e monitorar o crescimento financeiro de suas barbearias.
# tecnologia usadas
O Navalha app foi desenvolvido utilizando as seguintes tecnologias:

Flutter: Framework para o desenvolvimento de aplicativos móveis multiplataforma, permitindo que o aplicativo funcione tanto em Android quanto em iOS com uma única base de código.

Dart: Linguagem de programação usada no Flutter, escolhida por sua simplicidade e eficiência em aplicações mobile.
GitHub: Usado para o controle de versão e colaboração no desenvolvimento do código.