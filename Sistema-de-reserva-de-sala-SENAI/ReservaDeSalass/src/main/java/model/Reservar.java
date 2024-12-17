package model;

public class Reservar {  
    private int idReserva; // Corrigir para idReserva
    private String sala;
    private String colaborador;
    private String horario;
    private String datareservar;

    // Construtores
    public Reservar(String sala, String colaborador, String horario, String datareservar) {
        this.sala = sala;
        this.colaborador = colaborador;
        this.horario = horario;
        this.datareservar = datareservar;
    }

    public Reservar(int idReserva, String sala, String colaborador, String horario, String datareservar) {
        this.idReserva = idReserva;
        this.sala = sala;
        this.colaborador = colaborador;
        this.horario = horario;
        this.datareservar = datareservar;
    }

    public Reservar() { }

    // Getters e Setters
    public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public String getSala() {
        return sala;
    }

    public void setSala(String sala) {
        this.sala = sala;
    }

    public String getColaborador() {
        return colaborador;
    }

    public void setColaborador(String colaborador) {
        this.colaborador = colaborador;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getDatareservar() {
        return datareservar;
    }

    public void setDatareservar(String datareservar) {
        this.datareservar = datareservar;
    }

    public void setidReserva(int aInt) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
