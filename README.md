Visão Geral
O projeto do Fluter Experience coordenado por Rodrigo Rahman é um sistema de gestão para clinicas médicas que abrange três componentes principais:

Aplicação para Android: Uma aplicação voltada para autoatendimento, onde os usuários informam seus pedidos médicos e sua carteirinha.

Aplicação Desktop: Destinada à administração do sistema, permitindo que os funcionários indiquem o guichê para iniciar o atendimento aos usuários.

Página Web: Uma interface web que exibe as senhas chamadas em tempo real, configurada com um web socket para comunicação instantânea.

Tecnologias Utilizadas
Flutter: Framework utilizado para desenvolvimento da aplicação.
Signals: Gerenciamento de estado utilizado com a arquitetura MVVM (Model, View, ViewModel).
WebSocket: Protocolo de comunicação utilizado para atualização em tempo real na página web.

Experiências Adquiridas
Durante o desenvolvimento deste projeto, adquiri várias experiências valiosas, incluindo:

Programação Orientada a Package: Implementamos uma abordagem orientada a package, onde criamos um package central (core) contendo a lógica principal da aplicação, reutilizado em todas as plataformas (Android, Desktop e Web). Isso proporcionou modularidade, reutilização de código e facilita a manutenção do projeto.

Arquitetura Limpa: Adotamos os princípios da arquitetura limpa, separando as preocupações em diferentes camadas para garantir uma aplicação bem estruturada, de fácil compreensão e testável.

Configuração de Web Socket: Implementamos a configuração de um web socket para comunicação em tempo real na página web, permitindo uma experiência dinâmica e atualizada para os usuários que acompanham as senhas chamadas.

