# Roteiro da apresentação
1. Mostrar o projeto rodando naturalmente.
2. Mostrar que o aspecto "Mensagens" foi criado.
3. Mostrar que o um pointcut foi criado para ser chamado nas chamadas de "Conta.creditar()"
   - Mostrar advice que imprimiria "Vou creditar!"
   - Mostrar pointcut pcCreditar1(): call(public * creditar(..));
   - Mostrar pointcut pcCreditar2(): call(public * Conta.creditar(..));
   - Mostrar pointcut pcCreditar3(Conta c): target(c) && call(public * creditar(..));
4. Mostrar o advice (before) criado para imprimir o saldo da conta antes de creditar.
5. Mostrar o advice (after) criado para imprimir o saldo da conta após creditar.
6. Mostrar o que deve acontecer caso os dois advices atuem no método creditar.
7. Mostrar o a troca por um único advice "around".
8. Mostrar o pointcut before creditar após atualizar para "Creditar valor: R$ ***"
9. Mostrar o aspecto "Precondicoes":
   - Mostrar regras para Creditar.
   - Mostrar regras para Debitar.
   - Mostrar regras para Transferir.
