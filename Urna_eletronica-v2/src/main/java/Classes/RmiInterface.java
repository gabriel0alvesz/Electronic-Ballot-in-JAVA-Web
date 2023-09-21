package Classes;

import java.io.IOException;
import java.rmi.Remote;
import java.rmi.RemoteException;

public interface RmiInterface extends Remote {

    public void GravaVoto(String value) throws RemoteException;

    public float[] RecuperaVotos() throws RemoteException;

    public int[] getQtdVotos() throws RemoteException;

}
