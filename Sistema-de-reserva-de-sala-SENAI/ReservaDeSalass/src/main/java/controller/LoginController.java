/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Colaborador;
import model.ConexaoBancoDeDados;

/**
 *
 * @author lldua
 */
public class LoginController {
    
    
    public Colaborador authenticate(String email,String senha) {
        /* Foi criado uma variável com o nome de query que recebe o método de 
        de seleção do banco de dados, onde ele vai selecionar todos os registros
        da tabela, no caso, usuário, e verificar se o email e senha digitados 
        existe no banco de dados */
        String query = "SELECT * FROM Colaborador WHERE email = ? AND senha =?";
            // Conexão com o banco de dados
        try (Connection connection = ConexaoBancoDeDados.getConnection();
            // Mandar o comando select para ser executado no Banco de dados
            PreparedStatement preparedStatement = connection.prepareStatement(query)){
            
            /*Parâmetros que vão substituir os pontos de interrogação da variável
            query em ordem, email para o 1º ponto e senha para o 2º ponto, se 
            se fosse mais pontos de interrogação seria preparedStatement.setString
            .set(tipo da variável)(3, variável) */
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, senha);
            
            // Método ResultSet recebe o returno do comando sql da variável query 
            try(ResultSet resultSet = preparedStatement.executeQuery() ){
                if(resultSet.next()){
                  // retorna o valor que ele recebeu do banco de dados
                int id = resultSet.getInt("idColaborador");
                String nome = resultSet.getString("nome");
                 String emailcolaborador = resultSet.getString("email");
                String senhacolaborador = resultSet.getString("senha");
                String telefone = resultSet.getString("telefone");
                String cpf = resultSet.getString("cpf");
                String tipo_usuario = resultSet.getString("tipo_usuario");
                // mandando o usuário para tela de login
                
                
                return new Colaborador (id, emailcolaborador, senhacolaborador, telefone, nome,cpf,tipo_usuario);  
                }
            }
        }catch (SQLException e){
            System.err.println("Erro ao autenticar o usuario: "+ e.getMessage());
            return null;
        }// fim do try catch
        return null;
    
    }// fim do método authenticate
    
}//fim da classe LoginController
