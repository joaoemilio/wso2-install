package com.wso2.install.action.wso2.apim;

import com.mxssh.SSHMXException;
import com.mxssh.SSHService;
import com.wso2.install.action.SSHAction;
import com.wso2.install.util.Properties;

import java.io.IOException;

public class CreateWSO2UserAction extends SSHAction {


    public void executeAction(SSHService ssh) throws IOException, InterruptedException, SSHMXException {
        String wso2_user = Properties.get("wso2_user");
        String command = "sudo useradd " + wso2_user;
        String result = ssh.executeCommand( command );
        System.out.println( command + "\n" + result );
    }

    public boolean validatePreReqs() {
        boolean result = false;

        String host = Properties.getHost();
        String privateKey = Properties.getPrivateKey();
        String username = Properties.getUsername();
        String wso2_user = Properties.get( "wso2_user");

        if( host != null && privateKey != null && username != null && wso2_user != null) {
            result = true;
        }

        return result;
    }

    public void printHelp() {

    }

    public String getName() {
        return "CreateWSO2UserAction";
    }
}
