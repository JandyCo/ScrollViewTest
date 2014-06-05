package com.jandyco.util;

class ReflectionUtils {
    static function setProperties(target : Dynamic, values : Dynamic) {
        for (field in Reflect.fields(values)) {
            if (Reflect.hasField(target, field)) {
                Reflect.setField(target, field, Reflect.field(values, field));
            } else if (Reflect.getProperty(target, "set_" + field) != null) {
                Reflect.setProperty(target, field, Reflect.field(values, field));
            }
        }
    }

    static function getOrDefault(target : Dynamic, field : String, defaultValue : Dynamic) {
        return Reflect.hasField(target, field) ? Reflect.field(target, field) : defaultValue;
    }
}
