package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Classe para gerenciar a conexão com o banco de dados SQL Server.
 */
public class ConexaoBancoDeDados {

    // URL de conexão com o banco de dados
    private static final String URL =
            "jdbc:sqlserver://localhost:1433;databaseName=RersevaDeSalas;"  // Certifique-se de que o nome do banco está correto
            + "integratedSecurity=true;"
            + "trustServerCertificate=true";

    /**
     * Estabelece a conexão com o banco de dados.
     * 
     * @return A conexão com o banco de dados.
     */
    public static Connection getConnection() {
        Connection connection = null;

        try {
            // Carregar o driver JDBC (necessário para versões mais antigas)
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            // Estabelecer a conexão
            connection = DriverManager.getConnection(URL);
            System.out.println("Conexão bem-sucedida!");

        } catch (ClassNotFoundException e) {
            // Caso o driver JDBC não seja encontrado
            System.err.println("Erro: Driver JDBC não encontrado! " + e.getMessage());
        } catch (SQLException e) {
            // Caso ocorra algum erro ao tentar se conectar ao banco de dados
            System.err.println("Erro de conexão com o banco de dados! " + e.getMessage());
        }

        return connection;
    }

    /**
     * Método para fechar uma conexão com o banco de dados.
     * 
     * @param connection A conexão a ser fechada.
     */
    public static void fecharConexao(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Conexão fechada com sucesso.");
            } catch (SQLException e) {
                System.err.println("Erro ao fechar a conexão: " + e.getMessage());
            }
        }
    }
}
