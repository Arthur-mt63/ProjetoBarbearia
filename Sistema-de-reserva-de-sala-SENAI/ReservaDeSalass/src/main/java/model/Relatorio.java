/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author lldua
 
public class Relatorio {
    private int relatorio;
        private String sala;
        private String colaborador;
        private String local;
        private String hora; 

    public Relatorio(String sala, String colaborador, String local, String hora) {
        this.sala = sala;
        this.colaborador = colaborador;
        this.local = local;
        this.hora = hora;
    }

    public Relatorio(int Relatorio, String sala, String colaborador, String local, String hora) {
        this.relatorio = Relatorio;
        this.sala = sala;
        this.colaborador = colaborador;
        this.local = local;
        this.hora = hora;
    }

    public Relatorio() {
    }

    public int getRelatorio() {
        return relatorio;
    }

    public String getSala() {
        return sala;
    }

    public String getColaborador() {
        return colaborador;
    }

    public String getLocal() {
        return local;
    }

    public String getHora() {
        return hora;
    }

    public void setRelatorio(int Relatorio) {
        this.Relatorio = Relatorio;
    }

    public void setSala(String sala) {
        this.sala = sala;
    }

    public void setColaborador(String colaborador) {
        this.colaborador = colaborador;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }
    
    
}*/
