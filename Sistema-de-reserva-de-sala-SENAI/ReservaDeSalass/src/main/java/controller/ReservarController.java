  // Importando a classe List do pacote correto
package Controller;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;  // Para criar a lista
import java.util.List;
import model.ConexaoBancoDeDados;
import model.Reservar;  // Certificando-se de importar a classe Reservar

public class ReservarController {

    // Método para listar as reservas
    public List<Reservar> listaReserva() {
        String query = "SELECT * FROM Reserva;";
        List<Reservar> lista = new ArrayList<>();

        try (Connection connection = ConexaoBancoDeDados.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Reservar reservar = new Reservar();
                reservar.setidReserva(resultSet.getInt("idReserva"));
                reservar.setSala(resultSet.getString("salas"));
                reservar.setColaborador(resultSet.getString("colaborador"));
                reservar.setHorario(resultSet.getString("horario"));
                reservar.setDatareservar(resultSet.getString("datareservar"));
                lista.add(reservar);
            }

            return lista;

        } catch (SQLException e) {
            System.err.println("Erro ao listar reservas: " + e.getMessage());
            return null;
        }
    }

    // Método para cadastrar uma nova reserva
    public boolean cadastrandoReservar(Reservar reservar) {
        String query = "INSERT INTO Reserva (salas, colaborador, horario, datareservar) VALUES (?, ?, ?, ?)";
        
        try (Connection connection = ConexaoBancoDeDados.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            // Definindo os parâmetros da query com os dados do objeto "reservar"
            preparedStatement.setString(1, reservar.getSala());
            preparedStatement.setString(2, reservar.getColaborador());
            preparedStatement.setString(3, reservar.getHorario());
            preparedStatement.setString(4, reservar.getDatareservar());

            // Executando a query de inserção no banco de dados
            int rowsAffected = preparedStatement.executeUpdate();

            // Se a inserção for bem-sucedida, retorna true
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.err.println("Erro ao cadastrar reserva: " + e.getMessage());
            return false;
        }
    }
}
