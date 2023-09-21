<%@ page import="Classes.RmiInterface" %>
<%@ page import="java.rmi.Naming" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Urna Eletronica</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <center>
        <h1> Urna Eletronica</h1>
        <form name="form_votos" method="get" action="urna_eletronica.jsp">
            <table>
                <tr>
                    <td>
                        <input type="radio" name="rad_candidato" value="azul">
                    </td>
                    <td>
                       <p class="azul">Azul</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="rad_candidato" value="roxo">
                    </td>
                    <td>
                        <p class="roxo">Roxo</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="rad_candidato" value="verde">
                    </td>
                    <td>
                        <p class="verde">Verde</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="rad_candidato" value="vermelho">
                    </td>
                    <td>
                        <p class="vermelho">Vermelho</p>
                    </td>
                </tr>
            </table>
            <button id="button_votar" type="submit">Votar</button>
        </form>
    </center>
        <%
            String candidato = "";
            try{
                RmiInterface objRMI = (RmiInterface) Naming.lookup("rmi://127.0.0.1:7777/servidor_chat");

                if(request.getParameter("rad_candidato")!=null){
                    candidato += request.getParameter("rad_candidato");
                }

                objRMI.GravaVoto(candidato);
            }catch (Exception e){
                System.out.print("Erro na aplicação: " + e.getMessage());
            }

//            if(request.getParameter("rad_candidato")!=null){
//
//                String candidato = request.getParameter("rad_candidato");
//                String arquivo_candidato = "/Users/gabrielalves/IdeaProjects/Urna_eletronica-v2/src/main/webapp/repositorio/" + candidato + ".txt";
//
//                FileReader reader = new FileReader(arquivo_candidato);
//                BufferedReader buffer = new BufferedReader(reader);
//
//                int qtd_votos = Integer.parseInt(buffer.readLine());
//                qtd_votos += 1;
//                String qtd_votos_string = ""+ qtd_votos;
//
//                FileWriter writer = new FileWriter(arquivo_candidato,false);
//                writer.write(qtd_votos_string);
//                writer.close();
//                reader.close();
//            }
        %>
</body>
</html>