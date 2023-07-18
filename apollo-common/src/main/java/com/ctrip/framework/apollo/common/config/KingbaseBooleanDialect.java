package com.ctrip.framework.apollo.common.config;

public class KingbaseBooleanDialect extends Kingbase8Dialect {
    public String toBooleanValueString(boolean bool) {
        return bool ? "1" : "0";
    }
}
