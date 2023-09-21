package Classes;

import javax.swing.*;
import javax.swing.plaf.synth.SynthTextAreaUI;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;


public class Rmi_implementation  extends UnicastRemoteObject implements RmiInterface{

    protected Rmi_implementation() throws RemoteException {}

    @Override
    public void GravaVoto(String value) throws RemoteException {

        String arquivo_candidato = "/Users/gabrielalves/IdeaProjects/Urna_eletronica-v2/src/main/webapp/repositorio/" + value + ".txt";
        int qtd_votos;
        String qtd_votos_string = "";

        try {
            FileReader reader = new FileReader(arquivo_candidato);
            BufferedReader buffer = new BufferedReader(reader);

            qtd_votos = Integer.parseInt(buffer.readLine());
            qtd_votos += 1;

            qtd_votos_string += qtd_votos;

            reader.close();

            FileWriter writer = new FileWriter(arquivo_candidato,false);
            writer.write(qtd_votos_string);

            writer.close();
        }catch (Exception e) {
            System.out.print("Erro no Leitura do GravaMSG: " + e.getMessage());
        }
    }

    @Override
    public float[] RecuperaVotos() throws RemoteException {

        String[] candidatos = {"azul", "roxo", "verde", "vermelho"};
        int[] votosPCandidatos = {0, 0, 0, 0}; // ordem conforme os cadidatos
        int total_votos = 0;

        float[] votos_canditado_pcent = {0, 0, 0, 0}; // ordem conforme os candidatos

        for(int i = 0; i < candidatos.length; i++) {

            String who_candidato = candidatos[i];
            String arquivo_candidato = "/Users/gabrielalves/IdeaProjects/Urna_eletronica-v2/src/main/webapp/repositorio/" + who_candidato + ".txt";

            try {

                FileReader reader = new FileReader(arquivo_candidato);
                BufferedReader buffer = new BufferedReader(reader);

                int qtd_temp = Integer.parseInt(buffer.readLine());

                votosPCandidatos[i] = qtd_temp;
                total_votos += qtd_temp;

                reader.close();
            }catch (Exception e){
                System.out.print("Erro em ReucuperaMSG: " + e.getMessage());
            }
        }

        votos_canditado_pcent[0] = (float) votosPCandidatos[0] /total_votos * 100;
        votos_canditado_pcent[1] = (float) votosPCandidatos[1] /total_votos * 100;
        votos_canditado_pcent[2] = (float) votosPCandidatos[2] /total_votos * 100;
        votos_canditado_pcent[3] = (float) votosPCandidatos[3] /total_votos * 100;

        return votos_canditado_pcent;
    }

    @Override
    public int[] getQtdVotos() throws RemoteException {

        int[] votosPCandidatos = {0, 0, 0, 0}; // ordem conforme os cadidatos
        String[] candidatos = {"azul", "roxo", "verde", "vermelho"};

        for(int i = 0; i < candidatos.length; i++) {

            String who_candidato = candidatos[i];
            String arquivo_candidato = "/Users/gabrielalves/IdeaProjects/Urna_eletronica-v2/src/main/webapp/repositorio/" + who_candidato + ".txt";

            try {
                FileReader reader = new FileReader(arquivo_candidato);
                BufferedReader buffer = new BufferedReader(reader);

                int qtd_temp = Integer.parseInt(buffer.readLine());
                votosPCandidatos[i] = qtd_temp;

                reader.close();
            } catch (Exception e) {
                System.out.print("Erro em ReucuperaMSG: " + e.getMessage());
            }
        }

        return votosPCandidatos;
    }
}
