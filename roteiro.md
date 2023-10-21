# Introdução AOP - Laboratório AspectJ - Eclipse
- [x] Instale o plugin AspectJ Development Tools no seu Eclipse, caso não esteja instalado: instruções.\
DICA: Ao importar o projeto de exemplo, utilizado em sala de aula, o Eclipse sugere a instalação do plugin, caso já não esteja instalado.
- [x] Importe o projeto do Laboratório:
  - no menu File escolha a opção Import
  - escolha a opção General, Existing Projects into Workspace
  - importe o arquivo .zip (archive file).
- [x] Na janela Package Explorer você visualiza os pacotes do seu projeto.
- [x] Executando o programa:
  1. clique com o botão direito no arquivo Programa.java
  2. Run As...
  3. Java Application
- [x] Agora vamos criar um aspecto
   1. no menu File escolha a opção New -> Other..., selecione Aspect e em seguida clique em Next
   2. escolha o Source Folder (o mesmo do projeto)
   3. digite o nome do pacote (aspectos)
   4. e o nome do aspecto (Mensagens)
- [x] Defina no aspecto um pointcut para identificar todas as chamadas ao método creditar de objetos do tipo Conta. AspectJ Programming Guide.
- [x] Agora defina um advice para imprimir a mensagem "Vou creditar!" antes das chamadas ao método creditar de objetos do tipo Conta.\
  Teste com os pointcuts a seguir e descreva a diferença entre eles na forma de comentário:
     - [x] pointcut pcCreditar1(): call(public * creditar(..));
     - [x] pointcut pcCreditar2(): call(public * Conta.creditar(..));
     - [x] pointcut pcCreditar3(Conta c): target(c) && call(public * creditar(..));
- [x] Para executar o sistema composto, basta escolher a opção AspectJ/Java Application, no menu de contexto Run As...
- [ ] No menu Window, Perspective, Show perspective -> Other... Em seguida escolha a opção Aspect Visualization Esta perspectiva mostra como os aspectos afetam as classes do projeto.
   - [x] defina um advice (before) para imprimir o saldo da conta antes da execução do método creditar.
   - [x] defina um advice (after) para imprimir o saldo da conta após a execução do método creditar.
   - [x] o que deve acontecer caso os dois advices atuem no método creditar? Teste executando o sistema.
- [ ] Troque os dois advices por um único advice "around".
- [ ] Altere o arquivo Mensagens.aj para que ele capture o valor do parâmetro e imprima a seguinte mensagem antes da execução do método creditar:
    1. "Creditar valor: R$ ***"
- [ ] Crie um aspecto, denominado Precondicoes, para verificar as seguintes precondições nas transações bancárias:
    1. Creditar:
       1. Só aceita valores positivos
    2. Debitar:
       1. Só aceita valores positivos
       2. Verificar se o saldo é suficiente
    3. Transferir:
       1. Só aceita valores positivos
       2. Verificar se o saldo da conta destino é suficiente
