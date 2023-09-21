package com.ctrip.framework.apollo.common.config;

import org.hibernate.boot.model.naming.Identifier;
import org.hibernate.boot.model.naming.PhysicalNamingStrategyStandardImpl;
import org.hibernate.engine.jdbc.env.spi.JdbcEnvironment;

public class CaseStrategy extends PhysicalNamingStrategyStandardImpl {

    private static final long serialVersionUID = 1383021413247872469L;


    @Override
    public Identifier toPhysicalTableName(Identifier name, JdbcEnvironment context) {
        return name.toIdentifier(name.getText());
    }

    @Override
    public Identifier toPhysicalColumnName(Identifier name, JdbcEnvironment jdbcEnvironment) {
        return name.toIdentifier(name.getText());
    }

}