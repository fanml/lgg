package com.example.ailin.tool;

import javax.servlet.http.HttpServletRequest;

/**
 * <br>Created by liyanjun@bonc.com.cn on 2017/7/7.<br><br>
 */
public class CommonUtil {

    /**
     * 获取用户真实 ip
     * @param request 请求头
     * @return ip
     */
    public static String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }

        // 如果通过了多级反向代理的话，X-Forwarded-For的值并不止一个，而是一串Ip值，究竟哪个才是真正的用户端的真实IP呢？
        // 答案是取X-Forwarded-For中第一个非unknown的有效IP字符串。
        // 如：X-Forwarded-For：192.168.1.110， 192.168.1.120， 192.168.1.130， 192.168.1.100 用户真实IP为： 192.168.1.110
        if (ip != null) {
            String[] ips = ip.split(",");
            for (String ipStr : ips) {
                if (ipStr.trim().length() > 0 && !"unknown".equalsIgnoreCase(ipStr.trim())) {
                    ip = ipStr;
                    break;
                }
            }
        }

        return ip;
    }

}
