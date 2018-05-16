package com.wso2.install.action.wso2.nginx;

import com.mxssh.SSHMXException;
import com.mxssh.SSHService;
import com.wso2.install.action.SSHAction;

import java.io.IOException;

public class SetupNginxAPIM220AllInOneAction extends SSHAction {


    public void executeAction(SSHService ssh) throws IOException, InterruptedException, SSHMXException {
        String result = ssh.executeCommand( "/tmp/resources/setup-nginx.sh");
        System.out.println( result );
    }

    public boolean validatePreReqs() {
        boolean result = true;

        return result;
    }

    public void printHelp() {

    }

    public String getName() {
        return "SetupNginxAPIM220AllInOneAction";
    }
}
