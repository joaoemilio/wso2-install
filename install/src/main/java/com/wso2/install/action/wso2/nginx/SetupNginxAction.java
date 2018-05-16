package com.wso2.install.action.wso2.nginx;

import com.wso2.install.action.MultiStepSSHAction;
import com.wso2.install.action.wso2.apim.CreateWSO2UserAction;

public class SetupNginxAction extends MultiStepSSHAction {

    public void printHelp() {

    }

    public void init() {
        System.out.println("initializing Setup Nginx Action");
        this.actions.add(new SendResourcesTarBallAction());
        this.actions.add(new SetupNginxAPIM220AllInOneAction());
    }

    public String getName() {
        return "SetupNginx";
    }
}
