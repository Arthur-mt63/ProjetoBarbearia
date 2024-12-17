package model;

public class Salas {
    private int idsalas;  // Identificador único da sala
    private String sala;   // Nome da sala
    private String capacidade;  // Capacidade da sala
    private String tipo;  // Tipo da sala (ex: auditório, sala de reunião, etc.)
    private String descricao;  // Descrição adicional da sala

    // Construtores
    public Salas() { }

    public Salas(int idsalas, String sala, String capacidade, String tipo, String descricao) {
        this.idsalas = idsalas;
        this.sala = sala;
        this.capacidade = capacidade;
        this.tipo = tipo;
        this.descricao = descricao;
    }

    public Salas(String sala, String capacidade, String tipo, String descricao) {
        this.sala = sala;
        this.capacidade = capacidade;
        this.tipo = tipo;
        this.descricao = descricao;
    }

    // Getters e setters

    public int getIdsalas() {
        return idsalas;
    }

    public void setIdsalas(int idsalas) {
        this.idsalas = idsalas;
    }

    // Getter e setter para 'sala'
    public String getSala() {
        return sala;
    }

    public void setSala(String sala) {
        this.sala = sala;
    }

    // Getter e setter para 'capacidade'
    public String getCapacidade() {
        return capacidade;
    }

    public void setCapacidade(String capacidade) {
        this.capacidade = capacidade;
    }

    // Getter e setter para 'tipo'
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    // Getter e setter para 'descricao'
    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}
