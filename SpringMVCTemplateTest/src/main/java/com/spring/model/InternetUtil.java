package com.spring.model;


import java.io.IOException;
import java.net.InetAddress;

public class InternetUtil {
    public static boolean hasInternetConnection() {
        try {
            InetAddress address = InetAddress.getByName("www.google.com");
            return address.isReachable(2000); // timeout 2 seconds
        } catch (IOException e) {
            return false;
        }
    }
}
