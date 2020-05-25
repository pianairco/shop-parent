package ir.piana.business.jsonsql.util;

import java.math.BigDecimal;

/**
 * Created by mj.rahmati on 1/2/2020.
 */
public class SQLUtility {
    public static String getSequenceNextVal(String sequenceName) {
        BigDecimal bigDecimal = null;
        Long.valueOf(bigDecimal.toString());
        return "select ".concat(sequenceName).concat(".nextval from dual");
    }
}
