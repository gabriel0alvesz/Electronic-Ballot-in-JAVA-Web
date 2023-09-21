<%@ page import="java.rmi.Naming" %>
<%@ page import="Classes.RmiInterface" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>DashBoard</title>
    <link rel="stylesheet" href="style.css">
    <meta http-equiv="refresh" content="3;board_votos.jsp">
</head>
<body>
    <%
//        String[] candidatos = {"azul", "roxo", "verde", "vermelho"};
//        int[] votosPCandidatos = {0, 0, 0, 0}; // ordem conforme os cadidatos
//        int total_votos = 0;
//
//        for(int i = 0; i < candidatos.length; i++) {
//
//            String who_candidato = candidatos[i];
//            String arquivo_candidato = "/Users/gabrielalves/IdeaProjects/Urna_eletronica-v2/src/main/webapp/repositorio/" + who_candidato + ".txt";
//
//            FileReader reader = new FileReader(arquivo_candidato);
//            BufferedReader buffer = new BufferedReader(reader);
//
//            int qtd_temp = Integer.parseInt(buffer.readLine());
//
//            votosPCandidatos[i] = qtd_temp;
//            total_votos += qtd_temp;
//
//            reader.close();
//        }
//
//            float[] votos_canditado_pcent = {0, 0, 0, 0};
//
//             votos_canditado_pcent[0] = (float) votosPCandidatos[0] /total_votos * 100;
//             votos_canditado_pcent[1] = (float) votosPCandidatos[1] /total_votos * 100;
//             votos_canditado_pcent[2] = (float) votosPCandidatos[2] /total_votos * 100;
//             votos_canditado_pcent[3] = (float) votosPCandidatos[3] /total_votos * 100;


        float[] votos_candidato_pcent = {0,0,0,0};
        int[] votosPCandidatos = {0,0,0,0};
        try{
            RmiInterface objRMI = (RmiInterface) Naming.lookup("rmi://127.0.0.1:7777/servidor_chat");

            votos_candidato_pcent = objRMI.RecuperaVotos();
            votosPCandidatos = objRMI.getQtdVotos();

        }catch (Exception e){
            System.out.print("Erro na aplicação: " + e.getMessage());
        }
    %>
    <table class="dash_board_table" border="1px solid black">
        <tr>
            <td class="azul">
                Azul
            </td>
            <td class="space">
                <%
                    out.print(votosPCandidatos[0]);
                %>
            </td>
            <td>
                <progress style="height: 30px" max="100" value="<%=votos_candidato_pcent[0]%>"></progress>
            </td>
            <td>
                <%
                    out.print(votos_candidato_pcent[0] + "%");
                %>
            </td>
        </tr>
        <tr>
            <td class="roxo">
                Roxo
            </td>
            <td class="space">
                <%
                    out.print(votosPCandidatos[1]);
                %>
            </td>
            <td>
                <progress style="height: 30px" max="100" value="<%=votos_candidato_pcent[1]%>"></progress>
            </td>
            <td>
                <%
                    out.print(votos_candidato_pcent[1] + "%");
                %>
            </td>
        </tr>
        <tr>
            <td class="verde">
                Verde
            </td>
            <td class="space">
                <%
                    out.print(votosPCandidatos[2]);
                %>
            </td>
            <td>
                <progress style="height: 30px" max="100" value="<%=votos_candidato_pcent[2]%>"></progress>
            </td>
            <td>
                <%
                    out.print(votos_candidato_pcent[2] + "%");
                %>
            </td>
        </tr>
        <tr>
            <td class="vermelho">
                Vermelho
            </td>
            <td class="space">
                <%
                    out.print(votosPCandidatos[3]);
                %>
            </td>
            <td>
                <progress style="height: 30px" max="100" value="<%=votos_candidato_pcent[3]%>"></progress>
            </td>
            <td>
                <%
                    out.print(votos_candidato_pcent[3] + "%");
                %>
            </td>
        </tr>
    </table>
</body>
</html>