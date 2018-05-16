package com.wso2.install;

import com.mxssh.SSHTask;
import com.wso2.install.action.Action;
import com.wso2.install.action.MultiStepSSHAction;
import com.wso2.install.action.SSHAction;
import com.wso2.install.action.sample.SampleAction;
import com.wso2.install.action.security.ssl.GenerateSSLCertificateAction;
import com.wso2.install.action.wso2.apim.InstallApim220Action;
import com.wso2.install.action.wso2.nginx.SetupNginxAction;
import com.wso2.install.util.OptionsHelper;
import com.wso2.install.util.Properties;
import com.wso2.install.util.SSHHelper;

import java.util.HashMap;

public class Main {

    private static HashMap<String, Action> actions = new HashMap<String, Action>();

    static {
        actions.put("sample", new SampleAction());
        actions.put("generate-ssl-certificate", new GenerateSSLCertificateAction());
        actions.put("install-apim-220", new InstallApim220Action());
        actions.put("setup-nginx", new SetupNginxAction());
    }

    public static void main(String args[]) {

        Main.init( args );
        System.out.println("Initiating flight");

        Action action = actions.get( Properties.getActionName() );
        System.out.println(action);
        if( action == null ) {
            System.err.println("action argument is mandatory");
            System.exit(-1);
        }

        action.init();

        if(action.validatePreReqs()) {
            if( action instanceof SSHAction || action instanceof MultiStepSSHAction ) {
                SSHTask task = SSHHelper.connectWithPrivateKey();
                if( action instanceof SSHAction) {
                    ((SSHAction) action).setTask(task);
                } else {
                    ((MultiStepSSHAction) action).setTask(task);
                }
            }
            action.execute();
        } else {
            action.printHelp();
        }

    }

    public static void init( String args[] ) {

        OptionsHelper.getInstance().init(args);

    }
}
