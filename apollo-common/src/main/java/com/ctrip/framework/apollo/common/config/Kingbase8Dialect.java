package com.ctrip.framework.apollo.common.config;
import org.hibernate.dialect.PostgreSQLDialect;
import org.hibernate.dialect.function.NoArgSQLFunction;
import org.hibernate.dialect.function.SQLFunction;
import org.hibernate.dialect.function.SQLFunctionTemplate;
import org.hibernate.dialect.function.StandardSQLFunction;
import org.hibernate.dialect.function.VarArgsSQLFunction;
import org.hibernate.type.StandardBasicTypes;
import org.hibernate.type.Type;

public class Kingbase8Dialect extends PostgreSQLDialect {
    public Kingbase8Dialect() {
        registerColumnType(16, "bool");
        registerColumnType(-7, "bit");
        registerColumnType(2005, "clob");
        registerColumnType(2004, "blob");
        registerColumnType(-2, "bytea");
        registerHibernateType(1, 2147483647L, StandardBasicTypes.STRING.getName());
        registerFunction("count", (SQLFunction)new StandardSQLFunction("count", (Type)StandardBasicTypes.LONG));
        registerFunction("clock_timestamp", (SQLFunction)new NoArgSQLFunction("CLOCK_TIMESTAMP", (Type)StandardBasicTypes.TIMESTAMP));
        registerFunction("systimestamp", (SQLFunction)new NoArgSQLFunction("SYSTIMESTAMP", (Type)StandardBasicTypes.TIMESTAMP, false));
        registerFunction("transaction_timestamp", (SQLFunction)new NoArgSQLFunction("TRANSACTION_TIMESTAMP", (Type)StandardBasicTypes.TIMESTAMP));
        registerFunction("textcat", (SQLFunction)new VarArgsSQLFunction((Type)StandardBasicTypes.STRING, "(", "||", ")"));
        registerFunction("coalesce", (SQLFunction)new StandardSQLFunction("coalesce"));
        registerFunction("nvl", (SQLFunction)new StandardSQLFunction("nvl"));
        registerFunction("nvl2", (SQLFunction)new StandardSQLFunction("nvl2"));
        registerFunction("to_char", (SQLFunction)new StandardSQLFunction("to_char", (Type)StandardBasicTypes.STRING));
        registerFunction("to_date", (SQLFunction)new StandardSQLFunction("to_date", (Type)StandardBasicTypes.DATE));
        registerFunction("to_timestamp", (SQLFunction)new StandardSQLFunction("to_timestamp", (Type)StandardBasicTypes.TIMESTAMP));
        registerFunction("to_number", (SQLFunction)new StandardSQLFunction("to_number", (Type)StandardBasicTypes.BIG_DECIMAL));
        registerFunction("atan2", (SQLFunction)new StandardSQLFunction("atan2", (Type)StandardBasicTypes.DOUBLE));
        registerFunction("bitand", (SQLFunction)new StandardSQLFunction("bitand", (Type)StandardBasicTypes.BIG_INTEGER));
        registerFunction("ceiling", (SQLFunction)new StandardSQLFunction("ceiling"));
        registerFunction("dlog1", (SQLFunction)new StandardSQLFunction("ln", (Type)StandardBasicTypes.DOUBLE));
        registerFunction("dlog10", (SQLFunction)new StandardSQLFunction("log", (Type)StandardBasicTypes.DOUBLE));
        registerFunction("pi", (SQLFunction)new NoArgSQLFunction("pi", (Type)StandardBasicTypes.DOUBLE));
        registerFunction("power", (SQLFunction)new StandardSQLFunction("power", (Type)StandardBasicTypes.DOUBLE));
        registerFunction("pow", (SQLFunction)new StandardSQLFunction("power", (Type)StandardBasicTypes.DOUBLE));
        registerFunction("dpow", (SQLFunction)new StandardSQLFunction("power", (Type)StandardBasicTypes.DOUBLE));
        registerFunction("dexp", (SQLFunction)new StandardSQLFunction("exp", (Type)StandardBasicTypes.DOUBLE));
        registerFunction("dround", (SQLFunction)new StandardSQLFunction("round"));
        registerFunction("dtrunc", (SQLFunction)new StandardSQLFunction("trunc"));
        registerFunction("dateadd", (SQLFunction)new VarArgsSQLFunction("dateadd(", ",", ")"));
        registerFunction("datediff", (SQLFunction)new VarArgsSQLFunction((Type)StandardBasicTypes.INTEGER, "datediff(", ",", ")"));
        registerFunction("date_part", (SQLFunction)new VarArgsSQLFunction((Type)StandardBasicTypes.INTEGER, "date_part(", ",", ")"));
        registerFunction("date_trunc", (SQLFunction)new StandardSQLFunction("date_trunc", (Type)StandardBasicTypes.TIMESTAMP));
        registerFunction("date_format", (SQLFunction)new StandardSQLFunction("date_format", (Type)StandardBasicTypes.TEXT));
        registerFunction("isfinite", (SQLFunction)new StandardSQLFunction("isfinite", (Type)StandardBasicTypes.BOOLEAN));
        registerFunction("str_valid", (SQLFunction)new StandardSQLFunction("str_valid", (Type)StandardBasicTypes.BOOLEAN));
        registerFunction("sysdate", (SQLFunction)new NoArgSQLFunction("sysdate", (Type)StandardBasicTypes.DATE, false));
        registerFunction("left1", (SQLFunction)new StandardSQLFunction("left", (Type)StandardBasicTypes.STRING));
        registerFunction("overlay", (SQLFunction)new SQLFunctionTemplate((Type)StandardBasicTypes.STRING, "overlay(?1 placing ?2 from ?3 for ?4)"));
        registerFunction("right1", (SQLFunction)new StandardSQLFunction("right", (Type)StandardBasicTypes.STRING));
        registerFunction("character_length", (SQLFunction)new StandardSQLFunction("character_length", (Type)StandardBasicTypes.INTEGER));
        registerFunction("convert", (SQLFunction)new StandardSQLFunction("convert", (Type)StandardBasicTypes.TEXT));
        registerFunction("decoding", (SQLFunction)new VarArgsSQLFunction((Type)StandardBasicTypes.STRING, "decoding(", ",", ")"));
        registerFunction("encode", (SQLFunction)new StandardSQLFunction("encode", (Type)StandardBasicTypes.TEXT));
        registerFunction("instr", (SQLFunction)new StandardSQLFunction("instr", (Type)StandardBasicTypes.INTEGER));
        registerFunction("instrb", (SQLFunction)new StandardSQLFunction("instrb", (Type)StandardBasicTypes.INTEGER));
        registerFunction("difference", (SQLFunction)new StandardSQLFunction("difference", (Type)StandardBasicTypes.INTEGER));
        registerFunction("difference", (SQLFunction)new StandardSQLFunction("difference", (Type)StandardBasicTypes.INTEGER));
        registerFunction("lcase", (SQLFunction)new StandardSQLFunction("lcase"));
        registerFunction("lpad", (SQLFunction)new StandardSQLFunction("lpad", (Type)StandardBasicTypes.TEXT));
        registerFunction("ltrim", (SQLFunction)new StandardSQLFunction("ltrim"));
        registerFunction("repeat", (SQLFunction)new StandardSQLFunction("repeat", (Type)StandardBasicTypes.TEXT));
        registerFunction("replace", (SQLFunction)new StandardSQLFunction("replace", (Type)StandardBasicTypes.TEXT));
        registerFunction("replicate", (SQLFunction)new VarArgsSQLFunction((Type)StandardBasicTypes.STRING, "replicate(", ",", ")"));
        registerFunction("rpad", (SQLFunction)new StandardSQLFunction("rpad", (Type)StandardBasicTypes.TEXT));
        registerFunction("rtrim", (SQLFunction)new StandardSQLFunction("rtrim"));
        registerFunction("soundex", (SQLFunction)new StandardSQLFunction("soundex"));
        registerFunction("substr", (SQLFunction)new StandardSQLFunction("substr", (Type)StandardBasicTypes.STRING));
        registerFunction("substrb", (SQLFunction)new StandardSQLFunction("substrb", (Type)StandardBasicTypes.TEXT));
        registerFunction("translate", (SQLFunction)new StandardSQLFunction("translate", (Type)StandardBasicTypes.TEXT));
        registerFunction("ucase", (SQLFunction)new StandardSQLFunction("ucase"));
        registerFunction("position", (SQLFunction)new VarArgsSQLFunction((Type)StandardBasicTypes.INTEGER, "position(", " in ", ")"));
    }

    public String getSelectGUIDString() {
        return "select sys_guid_name()";
    }
}
