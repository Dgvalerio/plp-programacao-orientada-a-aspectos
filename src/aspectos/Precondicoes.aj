package aspectos;

import contas.ContaNaoEncontradaException;
import fachada.Banco;

public aspect Precondicoes {
  pointcut pcCreditar(String numeroConta, double valor):
    args(numeroConta, valor) && call(public void Banco.creditar(String, double));

  pointcut pcDebitar(String numeroConta, double valor, Banco banco):
    args(numeroConta, valor) && target(banco) && call(public void Banco.debitar(String, double));

  pointcut pcTransferir(String numeroOrigem, String numeroDestino, double valor, Banco banco):
    args(numeroOrigem, numeroDestino, valor) && target(banco) && call(public void Banco.transferir(String, String, double));

  void around(String numeroConta, double valor): pcCreditar(numeroConta, valor) {
    if (valor <= 0) {
      System.out.println("Valor inválido!\nVocê deve creditar um valor maior que R$ 0!");
      return;
    }

    proceed(numeroConta, valor);
  }

  void around(String numeroConta, double valor, Banco banco): pcDebitar(numeroConta, valor, banco) {
    try {
      if (valor <= 0) {
        System.out.println("Valor inválido!\nVocê deve debitar um valor maior que R$ 0!");
        return;
      } else if (banco.saldo(numeroConta) < valor) {
        System.out.println("Valor inválido!\nSeu saldo é insuficiente para debitar esse valor!");
        return;
      }

      proceed(numeroConta, valor, banco);
    } catch (ContaNaoEncontradaException e) {
      throw new RuntimeException(e);
    }
  }

  void around(String numeroOrigem, String numeroDestino, double valor, Banco banco): pcTransferir(numeroOrigem, numeroDestino, valor, banco) {
    try {
      if (valor <= 0) {
        System.out.println("Valor inválido!\nVocê deve debitar um valor maior que R$ 0!");
        return;
      } else if (banco.saldo(numeroOrigem) < valor) {
        System.out.println("Valor inválido!\nSeu saldo é insuficiente para transferir esse valor!");
        return;
      }

      proceed(numeroOrigem, numeroDestino, valor, banco);
    } catch (ContaNaoEncontradaException e) {
      throw new RuntimeException(e);
    }
  }
}
