package aspectos;

import contas.Conta;

public aspect Mensagens {
  // Defina no aspecto um pointcut para identificar todas as chamadas ao método creditar de objetos do tipo Conta.
  pointcut pcCreditar():
    call(void Conta.creditar(..));

  before(): pcCreditar() {
    System.out.println("Vou creditar!");
  }
}
