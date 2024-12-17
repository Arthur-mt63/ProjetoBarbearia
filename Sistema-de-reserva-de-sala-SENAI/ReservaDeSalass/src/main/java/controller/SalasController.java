package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.ConexaoBancoDeDados;
import model.Salas;

public class SalasController {

    public boolean cadastrandoSalas(Salas salas) {
        // Corrigir a consulta SQL
        String query = "INSERT INTO Salas (salas, capacidade, tipo, descricao) VALUES (?, ?, ?, ?);";

        // Conecta ao banco e prepara a consulta
        try (Connection connection = ConexaoBancoDeDados.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            // Preencher os dados nos parâmetros
            preparedStatement.setString(1, salas.getSala());  // Método correto para obter o nome da sala
            preparedStatement.setString(2, salas.getCapacidade());
            preparedStatement.setString(3, salas.getTipo());
            preparedStatement.setString(4, salas.getDescricao());

            // Executa o comando no banco de dados
            int rowsAffected = preparedStatement.executeUpdate();

            // Se as linhas afetadas forem maiores que 0, o cadastro foi bem-sucedido
            return rowsAffected > 0;

        } catch (SQLException e) {
            // Se ocorrer um erro ao inserir, imprime o erro
            System.err.println("Erro ao inserir Dados: " + e.getMessage());
            return false;  // Indica que o cadastro falhou
        }
    }
}
