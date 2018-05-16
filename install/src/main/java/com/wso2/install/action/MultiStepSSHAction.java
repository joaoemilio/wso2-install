package com.wso2.install.action;

import com.mxssh.SSHMXException;
import com.mxssh.SSHService;
import com.mxssh.SSHTask;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public abstract class MultiStepSSHAction extends Action {

    protected List<SSHAction> actions = new ArrayList<SSHAction>();

    protected SSHTask task;

    public void setTask(SSHTask task) {
        this.task = task;
    }

    public void execute() {
        SSHService ssh = task.getSSHService();
        try {
            for(SSHAction action: actions ) {
                action.setTask(task);
                action.executeAction(ssh);
                System.out.println( "action: " + action.getName() ) ;
            }
            System.out.println("done");
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

    public boolean validatePreReqs() {
        boolean result = false;
        for(Action action: actions) {
            System.out.println("validating pre reqs for: " + action.getName() );
            if( !action.validatePreReqs() ) {
                result = false;
                break;
            } else {
                result = true;
            }
        }
        return result;
    }

    public abstract void printHelp();

}
