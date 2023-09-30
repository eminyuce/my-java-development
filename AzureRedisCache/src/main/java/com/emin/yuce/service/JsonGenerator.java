package com.emin.yuce.service;

import com.emin.yuce.model.SampleClass;

import java.lang.reflect.Field;
import java.time.OffsetDateTime;
import java.util.*;

public class JsonGenerator {

    public static void main(String[] args) throws Exception {
        var se = new SampleClass();

        Field[] fields = se.getClass().getDeclaredFields();

        for (Field f : fields) {
            if (!f.isAccessible()) {
                f.setAccessible(true);
                Class<?> type = f.getType();

                if (type.isPrimitive()) {
                    if (type.equals(byte.class)) {
                        f.setByte(se, (byte) 0);
                    } else if (type.equals(short.class)) {
                        f.setShort(se, (short) 0);
                    } else if (type.equals(int.class)) {
                        f.setInt(se, 0);
                    } else if (type.equals(long.class)) {
                        f.setLong(se, 0L);
                    } else if (type.equals(float.class)) {
                        f.setFloat(se, 0.0f);
                    } else if (type.equals(double.class)) {
                        f.setDouble(se, 0.0);
                    } else if (type.equals(char.class)) {
                        f.setChar(se, '\u0000');
                    } else if (type.equals(boolean.class)) {
                        f.setBoolean(se, false);
                    }
                } else {
                    if (type.equals(Byte.class)) {
                        f.set(se, (byte) 0);
                    } else if (type.equals(Short.class)) {
                        f.set(se, (short) 0);
                    } else if (type.equals(Integer.class)) {
                        f.set(se, 0);
                    } else if (type.equals(Long.class)) {
                        f.set(se, 0L);
                    } else if (type.equals(Float.class)) {
                        f.set(se, 0.0f);
                    } else if (type.equals(Double.class)) {
                        f.set(se, 0.0);
                    } else if (type.equals(Character.class)) {
                        f.set(se, '\u0000');
                    } else if (type.equals(Boolean.class)) {
                        f.set(se, false);
                    } else if (type.equals(Date.class)) {
                        f.set(se, new Date());
                    } else if (type.equals(OffsetDateTime.class)) {
                        f.set(se, OffsetDateTime.now());
                    } else if (type.equals(Map.class)) {
                        f.set(se, new HashMap<>());
                    } else if (type.equals(List.class)) {
                        f.set(se, new ArrayList<>());
                    } else if (type.isEnum()) {
                        Class<?> enumClass = Class.forName(type.getName());
                        Object[] enumConstants = enumClass.getEnumConstants();
                        if (enumConstants.length > 0) {
                            f.set(se, enumConstants[0]);
                        }
                    }
                }
                f.setAccessible(false);
            }
        }

        System.out.println(Gson.objectToJson(se));
    }
}
