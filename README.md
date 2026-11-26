# Treino em Dia — etapa 1/3

IFPI · Programação para Dispositivos Móveis

Equipe: Paulo Gabriel, Isaac Borges e Leonardo José.

Esta é a base inicial para o trabalho em grupo (aproximadamente 30% do escopo, uma estimativa de divisão de esforço, não uma medição objetiva). Segue o protótipo `Prototipo_Treino_em_Dia.pdf`, páginas 3, 4, 6 e 7, e o documento de requisitos do trabalho final. Não é a entrega completa.

## O que já foi desenvolvido

- Tema verde e componentes reutilizáveis, inspirados no protótipo.
- Formulários de login, cadastro e recuperação de senha, com validação local de campos, campos de senha ocultos e navegação.
- Botão de Google demonstrativo, sem conexão com provedor.
- Prévia da Home com treino de exemplo (Alex, Costas e bíceps, 3 exercícios), data atual e atalhos para Treinos e Refeições.
- Navegação inferior com Início, Treinos, Refeições e Mapa. As três últimas abas são pontos de extensão, identificados como em desenvolvimento.
- Estrutura MVC e dois arquivos de testes iniciais.

**Atenção:** o login NÃO está conectado a um serviço de autenticação. O cadastro não cria conta, a recuperação não envia e-mail, e o botão Google não autentica. O botão “Visualizar protótipo sem login” abre somente dados fictícios. Não inserir credenciais reais nesta prévia. O banco de dados, CRUD e mapas foram deixados para os colegas.

## Executar no Ubuntu ou Windows

É necessário ter Flutter instalado. O ZIP contém o código-fonte e a configuração de dependências, mas não as pastas de plataforma geradas pelo SDK. Para preparar o projeto sem sobrescrever o código fornecido, crie um projeto novo e copie os arquivos:

```bash
flutter create --platforms=android,ios,web treino_em_dia
```

Em seguida, copie `lib/`, `test/`, `pubspec.yaml` e `README.md` deste ZIP para a pasta `treino_em_dia`, substituindo os arquivos de mesmo nome (inclusive o teste padrão). No Ubuntu, também é possível executar a partir da pasta extraída `treino_em_dia_etapa1`:

```bash
flutter create --platforms=android,ios,web --project-name treino_em_dia .
flutter pub get
flutter analyze
flutter test
flutter run -d web-server --web-hostname=127.0.0.1 --web-port=9100
```

Não use `--overwrite`. Se preferir, utilize a primeira opção, com projeto novo e cópia dos arquivos, para preservar a base. No navegador, abra `http://localhost:9100` depois que o servidor informar que está pronto. Se a porta estiver ocupada, escolha outra. Para Android, consulte `flutter devices` e execute `flutter run -d ID_DO_DISPOSITIVO`. A compilação para iOS exige macOS e Xcode.

No app, toque em **Visualizar protótipo sem login** para navegar pela Home. Use apenas dados fictícios para testar os formulários.

## Estrutura e responsabilidades

```text
lib/
  main.dart                         # MaterialApp, idioma, tema e tela inicial
  models/
    resumo_treino.dart              # modelo mínimo do treino da Home
  controllers/
    acesso_controller.dart          # validação local dos formulários
  views/
    auth/
      acesso_view.dart              # login
      cadastro_view.dart            # criar conta
      recuperacao_view.dart         # recuperação de senha
    components/
      componentes.dart              # campos, marca e layout reutilizáveis
    principal_view.dart             # navegação inferior
    inicio_view.dart                # dashboard e atalhos
    treinos_view.dart               # ponto de extensão da etapa 2
    refeicoes_view.dart             # ponto de extensão da etapa 2
    mapa_view.dart                  # ponto de extensão da etapa 3
  services/
    README.md                       # plano dos serviços ainda não integrados
  utils/
    tema.dart                       # cores e estilo geral
    formatadores.dart               # formatação da data
test/
    acesso_controller_test.dart
    widget_test.dart
```

## Divisão sugerida (ajustável pela equipe)

### Etapa 1 — Leonardo José (30%) — base entregue

Revisar e testar a estrutura visual e a navegação. Entender as classes e os formulários. Não apresentar as integrações pendentes como concluídas.

### Etapa 2 — Paulo Gabriel (35%) — dados e funções

- Configurar Firebase para Android/iOS e, se desejado, web; adicionar dependências e configuração do SDK FlutterFire.
- Implementar Firebase Authentication com e-mail/senha, cadastro, recuperação e Google. Substituir os TODOs das três views de autenticação por chamadas ao serviço, com tratamento de erros e estados de carregamento.
- Proteger a navegação usando o estado de autenticação; remover a entrada de demonstração da versão final e implementar logout real.
- Criar modelos de usuário, ficha, exercício e refeição. Usar Cloud Firestore para registros por usuário e regras de acesso restritas ao UID autenticado.
- Implementar `TreinosView` e telas de ficha, detalhes e novo exercício com nome, séries, repetições e carga. Incluir criar, consultar, editar e excluir registros.
- Implementar `RefeicoesView` e tela de registro manual com tipo, horário e alimentos/observações, incluindo CRUD. Sem cálculos nutricionais, conforme protótipo.
- Substituir os dados fictícios da Home pelo nome e treino do usuário autenticado.

### Etapa 3 — Isaac Borges (35%) — mapa e qualidade

- Implementar `MapaView` com a API oficial do Google Maps para Flutter, marcadores, busca de academias/endereços e cálculo/exibição de rotas. A busca e rotas precisam de serviços adicionais da plataforma, como Places e Routes API, conforme o protótipo.
- Configurar chaves da API com restrições apropriadas, permissões de localização e mensagens de erro. Não publicar credenciais privadas; evitar expor chaves de serviços de backend no app.
- Testar segurança das regras de acesso do Firestore em conjunto com a etapa 2; verificar desempenho, estados de carregamento, acessibilidade e compatibilidade Android/iOS.
- Completar testes unitários e de integração e documentação técnica final.

As etapas 2 e 3 podem ser trabalhadas paralelamente em branches separadas. Preservem os nomes `TreinosView`, `RefeicoesView` e `MapaView`, ou atualizem os imports e construtores em `principal_view.dart`. A Home hoje chama `abrirAba(1)` para o treino e `abrirAba(2)` para refeições. Ao integrar dados, ajustem o card de treino para abrir a ficha específica.

## Guia rápido para entender o código

| Trecho | Para que serve |
|---|---|
| `main()` e `runApp()` | Iniciam o aplicativo. |
| `MaterialApp` | Define tema, idioma e primeira tela. |
| `StatefulWidget` | Guarda estado mutável (aba selecionada, formulários). |
| `TextEditingController` | Lê o conteúdo dos campos. |
| `Form` e `GlobalKey<FormState>` | Permitem validar os campos antes de executar uma ação. |
| `AcessoController` | Centraliza as funções de validação. |
| `dispose()` | Libera os controladores quando a tela deixa de existir. |
| `Navigator.push/pop` | Abre e fecha páginas de cadastro, recuperação e prévia. |
| `NavigationBar` e `setState` | Alteram a aba selecionada. |
| `IndexedStack` | Mantém as páginas das abas na árvore enquanto troca a página visível. |
| `ResumoTreino` | Guarda os dados do card de treino da Home. |

## Checklist de continuidade

- [ ] Executar `flutter pub get`, `flutter analyze` e `flutter test` no computador da equipe.
- [ ] Testar formulários e navegação da etapa 1 em tela pequena e no navegador.
- [ ] Conectar autenticação e Firestore com regras seguras.
- [ ] Implementar CRUD de fichas, exercícios e refeições.
- [ ] Integrar Google Maps, busca de endereço e rotas.
- [ ] Remover modo de demonstração da versão autenticada.
- [ ] Testar Android e iOS, acessibilidade, segurança e integração.
- [ ] Concluir documentação técnica.

**Estado de verificação:** os arquivos foram revisados estruturalmente, mas o SDK Flutter/Dart não está disponível no ambiente onde este ZIP foi criado. Não houve compilação nem execução dos testes. A equipe deve executar os comandos de verificação antes de continuar. Os formulários, tema e Home são aproximações do protótipo, não uma reprodução pixel a pixel.
