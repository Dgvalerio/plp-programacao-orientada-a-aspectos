package aspectos;

import contas.Conta;

public aspect Precondicoes {
  pointcut pcCreditar(double valor, Conta conta): args(valor) && target(conta) && call(public * creditar(..));

  pointcut pcDebitar(double valor, Conta conta): args(valor) && target(conta) && call(public * debitar(..));

  pointcut pcTransferir(double valor, Conta conta): args(valor) && target(conta) && call(public * transferir(..));

  void around(double valor, Conta conta): pcCreditar(valor, conta) {
    if (valor <= 0) {
      System.out.println("Valor inválido!\nVocê deve creditar um valor maior que R$ 0!");
      return;
    }

    proceed(valor, conta);
  }

  void around(double valor, Conta conta): pcDebitar(valor, conta) {
    if (valor <= 0) {
      System.out.println("Valor inválido!\nVocê deve debitar um valor maior que R$ 0!");
      return;
    } else if (conta.getSaldo() < valor) {
      System.out.println("Valor inválido!\nSeu saldo é insuficiente para debitar esse valor!");
      return;
    }

    proceed(valor, conta);
  }
}
