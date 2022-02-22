package net.app.front.buyer.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egov.cmm.EgovMessageSource;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.file.service.FileService;
import net.app.front.brand.product.service.ProductService;
import net.app.front.buyer.service.BuyerService;
import net.app.vo.SrchVO;
import net.base.web.CommUtils;

@Controller
@RequestMapping(path = "web/buyer/")
public class BuyerController {


    @Resource(name = "sessionContextFactory")
    private ObjectFactory<?> sessionContextFactory;


    @Resource(name = "commUtils")
    private CommUtils commUtils;

    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;

    @Resource(name = "fileService")
    private FileService fileService;

    @Resource(name = "productService")
    private ProductService productService;

    @Resource(name = "buyerService")
    private BuyerService buyerService;


    String path = "tiles/pages/frnt/";

    @RequestMapping(path = "productLst.bt")
    public String productLst(@ModelAttribute("srchFm") SrchVO srchVO, ModelMap model) {
        model.addAttribute("_subimg","true");


        EgovMap eMap = this.buyerService.getLatestBrand(srchVO);
        model.addAttribute("latestBrandCnt", eMap);
        List<EgovMap> eMaps = this.productService.getProductPageLst(srchVO);
        srchVO.setTotalRecordCount(eMaps.size() > 0 ? Integer.parseInt(eMaps.get(0).get("totCnt") + "") : 0);
        model.addAttribute("srchLst", eMaps);

        return commUtils.tiles(commUtils.TILES_FRNT, "buyer/productLst");
    }


}