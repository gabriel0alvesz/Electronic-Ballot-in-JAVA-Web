package Classes;

import javax.swing.*;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

public class Server_execution {
    public Server_execution(){
        try{
            Registry reg = LocateRegistry.createRegistry(7777);
            RmiInterface objRmi = new Rmi_implementation();

            reg.rebind("servidor_chat", objRmi);

        }catch (Exception e){
            JOptionPane.showMessageDialog(null, "Erro no servidor"+ e.getMessage());
        }
    }
}
