package com.wso2.install.action;

public abstract class Action {

    public abstract void execute();

    public abstract boolean validatePreReqs();

    public abstract void printHelp();

    public abstract String getName();

    public abstract void init();
}
