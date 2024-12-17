/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Colaborador;
import model.ConexaoBancoDeDados;
import model.Relatorio;

/**
 *
 * @author lldua
 
public class RelatorioController {
    public boolean RelatorioColaborador( Colaborador usuario){
        String query = "INSERT INTO Reservar (sala,colaborador,local,hora)"+"VALUES(?,?,?,?);";
        try(Connection conection = ConexaoBancoDeDados.getConnection();
        PreparedStatement preparedStatement = conection.prepareStatement(query))
        {
          // mandar os dados para  dentro do insert
          preparedStatement.setString(1,usuario.getSala());
          preparedStatement.setString(2,usuario.getColaborador());
          preparedStatement.setString(3,usuario.getLocal());
          preparedStatement.setString(4,usuario.getHora());
          
          
          
          
          // verifica se o insert foi executado
          int rowsAffected = preparedStatement.executeUpdate();
          return rowsAffected > 0;
          
        }catch(SQLException e){
            //imprimindo erro que deu ao inserir colaborador
            System.err.print("Erro ao inserir Dados!"+ e);
            // return para indicar que o colaborador não foi cadastrado
            return false;
        }// final do try catch
        
        
    }// fim do metodo cadastrandoColaborador()
    
       //método para atualizar os dados do usuário dentro do BD
    
      public boolean atualizarColaborador(Colaborador usuario){
        // Comando SQL para atualizar o colaborador
        String query = "UPDATE Colaborador SET sala =?,colaborador =?,local=?, hora=?;";
        
        try(Connection conection = ConexaoBancoDeDados.getConnection();
        PreparedStatement preparedStatement = conection.prepareStatement(query)){
        
            // Configurando os valores dos campos
          preparedStatement.setString(1,usuario.getSala());
          preparedStatement.setString(2,usuario.getColaborador());
          preparedStatement.setString(3,usuario.getLocal());
          preparedStatement.setString(4,usuario.getHora());
          
          // Executa o comando e verifica se houve alterações
          int rowsAffected = preparedStatement.executeUpdate();
          return rowsAffected > 0;
          
        }catch(SQLException e){
            //imprime o erro no console
            System.err.print("Erro ao atualizar Dados!"+ e);
            // return para indicar que o usuário não foi cadastrado
            return false;
        }// fim do try catch
        
    } // fim do método atualizarColaborador;
}*/
