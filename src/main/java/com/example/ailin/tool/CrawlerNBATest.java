package com.example.ailin.tool;

import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author fml@bonc.com.cn
 * @version V1.0
 * @date 2018-05-07 21:01
 */
@Slf4j
public  class CrawlerNBATest {
    
    @Test
    public void test2(){

        for(int i = 65; i <= 90; i++){
                char ascii = (char) i;
                //log.info("{}  {}",i, a);
                // http://china.nba.com/static/data/league/playerlist_A.json
                String url = "http://china.nba.com/static/data/league/playerlist_"+ascii+".json";
                testCrawler(url);

                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

        }

    }
    
    
    /**
     * 根据url爬取html
     *
     * @param url
     * @return
     */
    public static String testCrawler(String url){
    
        //String url = "http://china.nba.com/playerindex/";
    
        Map<String, Object> header = new HashMap<>(16);
        header.put("Accept", "application/json, text/plain, */*");
        header.put("Accept-Encoding", "gzip, deflate");
        header.put("Accept-Language", "zh-CN,zh;q=0.8,zh-TW;q=0.6");
        header.put("Cache-Control", "max-age=0");
        header.put("Connection", "keep-alive");
        header.put("Cookie", "pgv_info=ssid=s5973599952; pgv_pvid=1946414831; ts_uid=8975212939; ad_play_index=56; AMCVS_248F210755B762187F000101%40AdobeOrg=1; s_cc=true; AMCV_248F210755B762187F000101%40AdobeOrg=-1891778711%7CMCIDTS%7C17659%7CMCMID%7C12200637358944883283634990980606558941%7CMCAAMLH-1526296956%7C11%7CMCAAMB-1526296956%7CRKhpRz8krg2tLO6pguXWp5olkAcUniQYPHaMWWgdJ3xzPWQmdj0y%7CMCOPTOUT-1525699356s%7CNONE%7CMCAID%7CNONE%7CMCSYNCSOP%7C411-17666%7CvVersion%7C2.4.0; i18next=zh_CN; locale=zh_CN; countryCode=CN; _ga=GA1.2.1563429075.1525692163; _gid=GA1.2.62771353.1525692163; s_sq=%5B%5BB%5D%5D; ts_last=china.nba.com/playerindex/; s_ppvl=china%253Aplayers%253Amain%2C100%2C49%2C994%2C1440%2C794%2C1440%2C900%2C1%2CL; gpv=cn%3Aplayers%3Amain; s_ppv=china%253Aplayers%253Amain%2C29%2C88%2C2442%2C1440%2C442%2C1440%2C900%2C1%2CL");
        header.put("Host", "china.nba.com");
        header.put("Referer", "http://china.nba.com/playerindex/");
        header.put("Upgrade-Insecure-Requests", "1");
        header.put("User-Agent",
            "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36");
    
        CloseableHttpClient httpClient = HttpClients.custom().build();
        HttpGet httpget = new HttpGet(url);
        CloseableHttpResponse response = null;
        try {
            response = httpClient.execute(httpget);
        } catch (IOException e) {
            log.error("请求出错： {}", e.toString());
        }
        HttpEntity entity = response.getEntity();
    
        String html = null;
        try {
            html = EntityUtils.toString(entity);
        } catch (IOException e) {
            log.error("处理响应出错：{}", e.toString());
        }
        log.info("\r\n{}", html);
    
        return html;
    }
    
}
