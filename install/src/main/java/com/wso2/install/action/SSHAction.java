package com.wso2.install.action;

import com.mxssh.SSHMXException;
import com.mxssh.SSHService;
import com.mxssh.SSHTask;

import java.io.IOException;

public abstract class SSHAction extends Action {

    protected SSHTask task;

    public void setTask(SSHTask task) {
        this.task = task;
    }

    public void execute( ) {
    }

    public void init() {

    }

    public abstract void executeAction(SSHService ssh) throws IOException, InterruptedException, SSHMXException;

}
