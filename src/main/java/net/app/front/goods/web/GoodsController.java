package net.app.front.goods.web;

import javax.annotation.Resource;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egov.cmm.EgovMessageSource;
import net.app.vo.SrchVO;
import net.base.web.CommUtils;
import net.app.file.service.FileService;

@Controller
@RequestMapping(path = "web/goods/")
public class GoodsController {


    @Resource(name = "sessionContextFactory")
    private ObjectFactory<?> sessionContextFactory;


    @Resource(name = "commUtils")
    private CommUtils commUtils;

    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;

    @Resource(name = "fileService")
    private FileService fileService;

    String path = "tiles/pages/lpsm/road/user";



    @RequestMapping(path = "goodsMakeDt")
    public String goodsMakeDt(SrchVO srchVO) {
        
        if(srchVO.getGoodsDtpgType().equals("B")) {
                
        }else if(srchVO.getGoodsDtpgType().equals("C")) {

        }else if(srchVO.getGoodsDtpgType().equals("D")) {
        
        }
        
    	return commUtils.tiles(commUtils.TILES_FRNT, "godds/goodsMakeDt"+srchVO.getGoodsDtpgType());
    }
    
    
    
    
   
    
}