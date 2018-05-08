package com.example.ailin.controller;

import com.example.ailin.entity.SpiderImg;
import com.example.ailin.repository.SpiderImgRepository;
import com.example.ailin.tool.WebSpiderImg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class TestController {
    @Autowired
    SpiderImgRepository spiderImgRepository;
    @RequestMapping("/test")
    public String test(){
        WebSpiderImg spiderImgList=new WebSpiderImg();
         List<String> list=spiderImgList.img();
        for(String src:list){
            SpiderImg spiderImg=new SpiderImg(src);
            spiderImgRepository.save(spiderImg);
        }
        return "index";
    }
//    baiDuAPI测试
    @RequestMapping("bdtest")
    public String bdtest(){
        return "baiDuTest";
    }
    //    baiDuAPI测试
    @RequestMapping("movetest")
    public String movetest(){
        return "moveTest";
    }
    //    baiDuAPI测试移动小人
    @RequestMapping("moveBDMove")
    public String moveDBMove(){
        return "testBDMove";
    }

    //    test new login
    @RequestMapping("newLogin")
    public String newLogin(){
        return "newLogin";
    }
//    test teamHistory
//     @RequestMapping("teamHistory")
//     public String teamHistory(){
//    return "teamHistory";
//}
}
