package com.example.ailin.tool;

import java.util.HashMap;
import java.util.Map;

public enum LogOperateType {
    LOGIN("登陆"),
    REGISTER("注册"),
    CHECK("查看"),
    ADD("添加"),
    VALIDATE("验证"),
    UNDEFINED("未定义操作");
    // 操作类型描述
    private String desc;

    private static Map<String, LogOperateType> operateTypeMap = new HashMap<>();

    static {
        for (LogOperateType operateType : values()) {
            operateTypeMap.put(operateType.toString(), operateType);
        }
    }

    LogOperateType(String desc) {
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }

    /**
     * 将字符串转为枚举类型
     * @param operateTypeStr 枚举类型字符串
     * @return 对应的枚举类型或者 OperateType.UNDEFINED
     */
    public static LogOperateType convertToOperateType(String operateTypeStr) {
        LogOperateType operateType = operateTypeMap.get(operateTypeStr);
        if (operateType == null) {
            operateType = LogOperateType.UNDEFINED;
        }
        return operateType;
    }
}
