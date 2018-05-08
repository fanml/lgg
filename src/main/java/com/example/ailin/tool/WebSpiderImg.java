package com.example.ailin.tool;
import com.example.ailin.entity.SpiderImg;
import com.example.ailin.repository.SpiderImgRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/**
 * 爬网站上的所有jpg,png图片
 * @author fml
 *@Date: 2018/3/8 0026
 *@Time: 18:08
 */
public class WebSpiderImg {
public List<String> img(){
    URL url = null;
    URLConnection urlconn = null;
    BufferedReader br = null;
    List<String> list =new ArrayList<>();
//    PrintWriter pw = null;
     String regex = "http://[\\w+\\.?/?]+\\.(JPEG|jpeg|JPG|jpg|png|PNG)+";
//   String regex="http://china.nba.com/media/img/players/head/260x190/+/[0-9]+/g+\\.png+";
    Pattern p = Pattern.compile(regex);
    try {
        url = new URL("http://www.sina.com.cn/");
//        url = new URL("http://china.nba.com/playerindex/");
        urlconn = url.openConnection();
//        pw = new PrintWriter(new FileWriter("e:/url.txt"), true);//这里我们把收集到的链接存储在了E盘底下的一个叫做url的txt文件中
        br = new BufferedReader(new InputStreamReader(
                urlconn.getInputStream()));
        String buf = null;
        while ((buf = br.readLine()) != null) {
            Matcher buf_m = p.matcher(buf);
            while (buf_m.find()) {
                System.out.println(buf_m.group());
                list.add(buf_m.group());
//                pw.println(buf_m.group());
            }
        }
        System.out.println("获取成功！");
    } catch (MalformedURLException e) {
        e.printStackTrace();
    } catch (IOException e) {
        e.printStackTrace();
    } finally {
        try {
            br.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
//        pw.close();
    }
    return list;

}
}
