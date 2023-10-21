package aspectos;

import contas.Conta;

public aspect Mensagens {
  pointcut pcCreditar(): call(void Conta.creditar(..));
  // => Ao ser executado no before
  // Aparece somente quando a função creditar da Classe conta é chamada

  pointcut pcCreditar1(): call(public * creditar(..));
  // => Ao ser executado no before
  // Aparece todas as vezes que uma função creditar é chamada

  pointcut pcCreditar2(): call(public * Conta.creditar(..));
  // => Ao ser executado no before
  // Aparece somente quando a função creditar da Classe conta é chamada

  pointcut pcCreditar3(Conta c): target(c) && call(public * creditar(..));
  // => Ao ser executado no before
  // Aparece somente quando a função creditar recebe uma Conta por parâmetro
  // Também pode retornar os dados da Conta que foi informada em creditar

  before(Conta c): pcCreditar3(c) {
    System.out.println("Vou creditar 3!" + c.toString());
  }
}
