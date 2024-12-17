/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.reservadesalass;

import java.sql.Connection;
import static model.ConexaoBancoDeDados.getConnection;
import view.TelaLogin;
/**
 *
 * @author devmat
 */
public class ReservaDeSalass {

    public static void main(String[] args) {
       // criando um objeto da classe TelaLogin
        TelaLogin telalogin = new TelaLogin();
        // deixando a tela visivel
        
        telalogin.setVisible(true);
        Connection conexao = getConnection(); // variável recebe a conexão com BD
        if(conexao!=null){// se conexão for diferente de nulo 
            System.out.println("Conexão efetuada com sucesso!");
        }else{//Senão da erro
            System.out.println("Erro de conexão com Banco de Dados!");
        }
    }
}