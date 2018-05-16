package com.wso2.install.util;

import com.wso2.install.util.OptionsHelper;

public class Properties {

    public static String getHost( ) {
        return OptionsHelper.getInstance().getOptionValue("host");
    }

    public static String getPrivateKey() {
        return OptionsHelper.getInstance().getOptionValue("privatekey");
    }

    public static String getUsername() {
        return OptionsHelper.getInstance().getOptionValue("username");
    }

    public static String get(String name) {
        return OptionsHelper.getInstance().getOptionValue( name );
    }

    public static String getActionName() {
        return OptionsHelper.getInstance().getOptionValue( "action" );
    }
}
