package com.wso2.install.action.sample;

import com.mxssh.SSHMXException;
import com.mxssh.SSHService;
import com.wso2.install.action.SSHAction;
import com.wso2.install.util.Properties;

import java.io.IOException;

public class SampleAction extends SSHAction {

    public void executeAction(SSHService ssh) throws IOException, InterruptedException, SSHMXException {
        System.out.println(" ps -ef | grep nginx " + ssh.executeCommand("ps -ef | grep nginx") );
    }

    public boolean validatePreReqs() {
        boolean result = false;

        String host = Properties.getHost();
        String privateKey = Properties.getPrivateKey();
        String username = Properties.getUsername();

        if( host != null && privateKey != null && username != null ) {
            result = true;
        }

        return result;
    }

    public void printHelp() {
        System.out.println("Sample action requires host, username and privatekey path \n" +
                "./wso2installer.sh -action sample -host <hostname> -username <username> -privatekey <private-key-path>");
    }

    public String getName() {
        return "SampleAction";
    }

}
