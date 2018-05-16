package com.wso2.install.util;

import com.mxssh.SSHTask;

public class SSHHelper {

    public static SSHTask connectWithPrivateKey( ) {
        SSHTask task = new SSHTask();
        String host = Properties.getHost();
        String privateKey = Properties.getPrivateKey();
        String username = Properties.getUsername();
        System.out.println("host: " + host + " username: " + username + " privatekey: " + privateKey );
        task.connectPK( host,username,privateKey);
        return task;
    }

}
