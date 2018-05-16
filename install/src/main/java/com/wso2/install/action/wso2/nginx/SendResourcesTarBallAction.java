package com.wso2.install.action.wso2.nginx;

import com.mxssh.SCPClient;
import com.mxssh.SSHMXException;
import com.mxssh.SSHService;
import com.wso2.install.action.SSHAction;
import com.wso2.install.util.Properties;

import java.io.IOException;

public class SendResourcesTarBallAction extends SSHAction {


    public void executeAction(SSHService ssh) throws IOException, InterruptedException, SSHMXException {

        String resources = Properties.get("resources");
        SCPClient scp = new SCPClient();

        System.out.println("send resources file");
        scp.sendFile(ssh, resources, "/tmp/resources.tar.gz" );
        System.out.println("send resources file sent");


        System.out.println( ssh.executeCommand( "cd /tmp") );
        System.out.println( ssh.executeCommand( "rm -rf /tmp/resources") );
        System.out.println( ssh.executeCommand( "tar -xvzf resources.tar.gz") );
        System.out.println( " after tar -xvzf" );
        System.out.println( ssh.executeCommand( "cd /tmp/resources") );
        System.out.println( " cd /tmp/resources " );
        System.out.println( ssh.executeCommand( "chmod 750 setup-nginx.sh") );
        System.out.println( " chmod 750 setup-nginx.sh " );

    }

    public boolean validatePreReqs() {
        boolean result = false;

        String host = Properties.getHost();
        String privateKey = Properties.getPrivateKey();
        String username = Properties.getUsername();
        String resources = Properties.get( "resources");

        if( host != null && privateKey != null && username != null && resources != null) {
            result = true;
        }

        return result;
    }

    public void printHelp() {

    }

    public String getName() {
        return "SendResourcesTarBallAction";
    }
}
