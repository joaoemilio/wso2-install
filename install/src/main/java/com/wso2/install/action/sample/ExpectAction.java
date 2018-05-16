package com.wso2.install.action.sample;

import com.mxssh.SSHMXException;
import com.mxssh.SSHService;
import com.mxssh.SSHTask;

import java.io.IOException;

public class ExpectAction {

    public static void main(String args[]) {
        SSHTask task = new SSHTask();
        String host = "apim.minegames.com.br";
        String privateKey = "/Users/joaoemilio/.ssh/id_rsa";
        String username = "joaoemilio";
        System.out.println("host: " + host + " username: " + username + " privatekey: " + privateKey );
        task.connectPK( host,username,privateKey);

        SSHService ssh = task.getSSHService();
        String certificate_name = "apim.minegames.com.br";
        String command = "sudo openssl genrsa -des3 -out " + certificate_name + ".key 1024";
        String result = null;
        try {
            ssh.setExternalPassword( "wso2carbon" );
            result = ssh.executeCommand(command, "ey:");

            System.out.println( command + "\n" + result );
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (SSHMXException e) {
            e.printStackTrace();
        } finally {
            if( task != null && task.getSSHService() != null && task.getSSHService().isConnected() ) {
                task.disconnect();
            }
        }
    }

}
