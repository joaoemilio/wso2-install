package com.wso2.install.util;

import org.apache.commons.cli.*;

public class OptionsHelper {

    private Options options;
    private CommandLineParser parser = new DefaultParser();
    private CommandLine cmd = null;
    private static OptionsHelper me;

    private OptionsHelper() {

    }

    public static OptionsHelper getInstance() {
        if( me == null ) {
            me = new OptionsHelper();
        }
        return me;
    }

    public void init( String args[] ) {
        // create Options object
        options = new Options();
        options.addOption("help", false, "print this message");
        addOption( options, "host", "hostname to install wso2", "host");
        addOption( options, "username", "username to connect to host", "username");
        addOption( options, "privatekey", "private key to connect to host", "privatekey");
        addOption( options, "action", "action to be performed", "action");
        addOption( options, "certificate_name", "certificate file name", "certificate_name");
        addOption( options, "wso2_user", "wso2 service user", "wso2_user");
        addOption( options, "resources", "resources tar ball path", "resources");

        try {
            cmd = parser.parse( options, args);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    private void addOption(Options options, String argname, String description, String create) {

        Option action = OptionBuilder.withArgName( argname )
                .hasArg()
                .withDescription( description )
                .create( create );
        options.addOption(action);

    }

    public String getOptionValue( String name ) {
        return this.cmd.getOptionValue(name);
    }

}
