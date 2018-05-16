package com.wso2.install.action.wso2.apim;

import com.wso2.install.action.MultiStepSSHAction;

public class InstallApim220Action extends MultiStepSSHAction {

    public void printHelp() {

    }

    public void init() {
        System.out.println("initializing Install API-M 2.2.0 Action");
        this.actions.add(new CreateWSO2UserAction());
    }

    public String getName() {
        return "InstallApim220";
    }
}
