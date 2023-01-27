package net.app.front.buyer.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egov.cmm.EgovMessageSource;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import lombok.extern.java.Log;
import net.app.file.service.FileService;
import net.app.front.brand.product.service.ProductService;
import net.app.front.brand.product.vo.ProductCateVO;
import net.app.front.buyer.service.BuyerService;
import net.app.lgn.util.FrntSessionUtils;
import net.app.vo.SrchVO;
import net.base.web.CommUtils;

@Log
@Controller
@RequestMapping(path = "/web/buyer/")
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
    public String productLst(@ModelAttribute("srchFm") SrchVO srchVO,@ModelAttribute("cateFm") ProductCateVO productCateVO, ModelMap model) {
        model.addAttribute("_subimg","true");


        EgovMap eMap = this.buyerService.getLatestBrand(srchVO);
        model.addAttribute("latestBrandCnt", eMap);
        List<EgovMap> eMaps = this.productService.getProductPageLst(srchVO);
        srchVO.setTotalRecordCount(eMaps.size() > 0 ? Integer.parseInt(eMaps.get(0).get("totCnt") + "") : 0);
        model.addAttribute("srchLst", eMaps);

        productCateVO.setUserId(FrntSessionUtils.getUserId());

        List<ProductCateVO> cateEMaps = buyerService.getProductCateLst(productCateVO);

        List<ProductCateVO> newMap = new ArrayList<ProductCateVO>();

        int i = 0;
        for(ProductCateVO vo  : cateEMaps) {
            vo.setSubMap(this.productService.getProductPageForCateLst(vo));
//            newMap.set(i, vo);
            cateEMaps.set(i, vo);
            i++;
        }

//        System.out.println(">>>>>>>>>>>>> newMap.get(0).getSubMap()="+cateEMaps.get(0).getSubMap());


        model.addAttribute("cateLst",cateEMaps);

        return commUtils.tiles(commUtils.TILES_FRNT, "buyer/productLst");
    }

    @RequestMapping(path = "productCatePop.bt")
    public String productCatePop(SrchVO srchVO ,@ModelAttribute("cateFm") ProductCateVO productCateVO, ModelMap model) {
        if(!"".equals(productCateVO.getProductCateId()) && productCateVO.getProductCateId() != null ) {
            model.addAttribute("cateFm",buyerService.getProductCateDtl(productCateVO));
        }
        return path+"/buyer/productCatePop";
    }

    @RequestMapping(path = "productCateUdtPop.bt")
    public String productCateUdtPop(SrchVO srchVO ,@ModelAttribute("cateFm") ProductCateVO productCateVO, ModelMap model) {

        if(!"".equals(FrntSessionUtils.getUserId()) && FrntSessionUtils.getUserId() != null ) {
            productCateVO.setUserId(FrntSessionUtils.getUserId());
            model.addAttribute("cateLst",buyerService.getProductCateLst(productCateVO));
        }
        return path+"/buyer/productCateUdtPop";
    }


    @RequestMapping(path = "productCateFormPop.bt")
    public String productCateFormPop(@ModelAttribute("savePopFm") ProductCateVO productCateVO, ModelMap model) {
        System.out.println(">>>>>>>>>>>>>>>>>>>>productCateVO.getProductCateId()="+productCateVO.getProductCateId());
        if(!"".equals(productCateVO.getProductCateId()) && productCateVO.getProductCateId() != null ) {
            model.addAttribute("savePopFm",buyerService.getProductCateDtl(productCateVO));
        }
        return path+"/buyer/productCateFormPop";
    }

    @RequestMapping(path = "/cateSubmitDo.ax")
    @ResponseBody
    public ModelMap cateSubmitDo(
            MultipartHttpServletRequest request,
            SrchVO srchVO,ProductCateVO productCateVO) {

        ModelMap modelMap = new ModelMap();

        String rtnId = buyerService.udtCategorySrchInfoDo(productCateVO);

        if (!"".equals(rtnId) || rtnId != null ) {
            modelMap.put("productId",rtnId);
            modelMap.put("code", "0001");
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.update"));
        } else {
            modelMap.put("code", "9999");
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.fail"));
        }

        return modelMap;

    }

    @RequestMapping(path = "/delProductCateSubmitDo.ax")
    @ResponseBody
    public ModelMap delProductCateSubmitDo(
            SrchVO srchVO,ProductCateVO productCateVO) {

        ModelMap modelMap = new ModelMap();

        String rtnId = buyerService.delProductCateSubmitDo(productCateVO);


        if (!"".equals(rtnId) || rtnId != null ) {
            modelMap.put("productId",rtnId);
            modelMap.put("code", "0001");
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.delete"));
        } else {
            modelMap.put("code", "9999");
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.fail"));
        }

        return modelMap;

    }






}