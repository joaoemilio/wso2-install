package com.wso2.install.action.security.ssl;

import com.mxssh.SSHMXException;
import com.mxssh.SSHService;
import com.wso2.install.action.SSHAction;
import com.wso2.install.util.Properties;

import java.io.IOException;

public class GenerateSSLCertificateAction extends SSHAction {

    public void executeAction(SSHService ssh ) throws IOException, InterruptedException, SSHMXException {

        String certificate_name = Properties.get("certificate_name");
        String command = "sudo openssl genrsa -des3 -out " + certificate_name + ".key 1024";
        String result = ssh.executeCommand( command, "wso2carbon" );
        System.out.println( command + "\n" + result );
    }

    public boolean validatePreReqs() {
        boolean result = false;

        String host = Properties.getHost();
        String privateKey = Properties.getPrivateKey();
        String username = Properties.getUsername();
        String certificateName = Properties.get( "certificate_name");

        if( host != null && privateKey != null && username != null && certificateName != null) {
            result = true;
        }

        return result;
    }

    public void printHelp() {
        System.out.println("GenerateSSLCertificate action requires host, username, privatekey path and certificate-name \n" +
                "./wso2installer.sh -action generate-ssl-certificate -host <hostname> -username <username> -privatekey <private-key-path> " +
                "-certificate-name <certificate-file-name>");
    }
    public String getName() {
        return "GenerateSSLCertificateAction";
    }
}
