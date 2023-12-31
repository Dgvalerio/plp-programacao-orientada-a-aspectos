package gui;

import contas.*;
import fachada.Banco;
import util.Util;

public class Programa {
  public static void main(String[] args) {
    RepositorioContas repositorio = new RepositorioContasArray();
    Banco fachada = new Banco(repositorio);
    Programa.menu(fachada);
  }

  public static void menu(Banco fachada) {
    String numero = null;
    double valor = 0.0;
    Conta conta = null;
    int opcao = 1;
    while (opcao != 0) {
      try {
        System.out.println("Aperte <Enter> para continuar");
        Util.waitEnter();
        System.out.println("\n\n\n\n\n\n\n");
        System.out.println("Escolha uma das opções abaixo:");
        System.out.println("1 — Cadastrar Conta");
        System.out.println("2 — Creditar");
        System.out.println("3 — Debitar");
        System.out.println("4 — Transferir");
        System.out.println("5 — Ver Saldo");
        System.out.println("0 — Sair");
        opcao = Util.readInt();

        switch (opcao) {
          case 1 -> {
            System.out.println(
              "Informe o numero da conta a ser criada:");
            numero = Util.readStr();
            conta = new Conta(numero);
            fachada.cadastrar(conta);
            System.out.println("Cadastro realizado com sucesso");
          }
          case 2 -> {
            System.out.println("Informe o numero da conta:");
            numero = Util.readStr();
            System.out.println("Informe o valor a ser creditado:");
            valor = Util.readDbl();
            fachada.creditar(numero, valor);
            System.out.println("Credito efetivado com sucesso");
          }
          case 3 -> {
            System.out.println("Informe o numero da conta:");
            numero = Util.readStr();
            System.out.println("Informe o valor a ser debitado:");
            valor = Util.readDbl();
            fachada.debitar(numero, valor);
            System.out.println("Debito efetivado com sucesso");
          }
          case 4 -> {
            System.out.println(
              "Informe o numero da conta de origem:");
            numero = Util.readStr();
            System.out.println(
              "Informe o numero da conta de destino:");
            String numeroAux = Util.readStr();
            System.out.println(
              "Informe o valor a ser transferido:");
            valor = Util.readDbl();
            fachada.transferir(numero, numeroAux, valor);
            System.out.println(
              "Transferência realizada com sucesso");
          }
          case 5 -> {
            System.out.println("Informe o numero da conta:");
            numero = Util.readStr();
            System.out.println(
              "O saldo e " + fachada.saldo(numero));
          }
          case 0 -> System.out.println("Saindo...");
          default -> System.out.println(
            "Opção Incorreta! Escolha uma das opções do menu!\n");
        }
      } catch (Exception exception) {
        System.out.println(exception.getMessage());
      }
    }
  }

}
