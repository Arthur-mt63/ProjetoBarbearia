/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Colaborador;
import model.ConexaoBancoDeDados;

/**
 *
 * @author lldua
 */
public class ColaboradorController {
    // Criando metodo de colaborador no banco de dados
    // metodo para verificar se o colaborador está ou não cadastrado no BD
    
    public boolean cadastrandoColaborador( Colaborador usuario){
        // comando do banco de dados para inserir 
        /* Os pontos de interrogação serão trocados pelos dados que o usuário
        irá inserir */
     
        String query = "INSERT INTO Colaborador (nome,cpf,email,senha,telefone,tipo_usuario)"
               + "VALUES(?,?,?,?,?,?);";
               
        // Connection : conecta-se ao banco de dados
        // PreparedStatement : manda o comando sql para executar no Banco de DD
        try(Connection conection = ConexaoBancoDeDados.getConnection();
        PreparedStatement preparedStatement = conection.prepareStatement(query))
        {
          // mandar os dados para  dentro do insert
          preparedStatement.setString(1,usuario.getNome());
          preparedStatement.setString(2,usuario.getCpf());
          preparedStatement.setString(3,usuario.getEmail());
          preparedStatement.setString(4,usuario.getSenha());
          preparedStatement.setString(5,usuario.getTelefone());
          preparedStatement.setString(6,usuario.getTipo_usuario());
          
          
          
          
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
        String query = "UPDATE Colaborador SET nome =?,email =?,senha=?, telefone=?,tipo_usuario=? WHERE cpf=?;";
        
        try(Connection conection = ConexaoBancoDeDados.getConnection();
        PreparedStatement preparedStatement = conection.prepareStatement(query)){
        
            // Configurando os valores dos campos
          preparedStatement.setString(1,usuario.getNome());
          preparedStatement.setString(2,usuario.getEmail());
          preparedStatement.setString(3,usuario.getSenha());
          preparedStatement.setString(4, usuario.getTelefone());
          preparedStatement.setString(5,usuario.getTipo_usuario());
          preparedStatement.setString(6,usuario.getCpf());
          
          
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
}
