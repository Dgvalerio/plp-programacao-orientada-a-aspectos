package aspectos;

import contas.Conta;

public aspect Precondicoes {
  pointcut pcCreditar(double valor, Conta conta): args(valor) && target(conta) && call(public * creditar(..));

  pointcut pcDebitar(double valor, Conta conta): args(valor) && target(conta) && call(public * creditar(..));

  pointcut pcTransferir(double valor, Conta conta): args(valor) && target(conta) && call(public * creditar(..));

  void around(double valor, Conta conta): pcCreditar(valor, conta) {
    if (valor <= 0) {
      System.out.println("Valor inválido!\nVocê deve creditar um valor maior que R$ 0!");
      return;
    }

    proceed(valor, conta);
  }
}
