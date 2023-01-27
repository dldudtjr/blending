package net.app.front.brand.product.web;

import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egov.cmm.EgovFileUpload;
import egov.cmm.EgovMessageSource;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.file.service.FileService;
import net.app.file.vo.FileVO;
import net.app.front.brand.product.service.ProductService;
import net.app.front.brand.product.vo.ProductVO;
import net.app.lgn.util.FrntSessionUtils;
import net.app.vo.SrchVO;
import net.base.cmm.annotation.CodeId;
import net.base.web.CommUtils;

@Controller
@RequestMapping(path = "web/brand/")
public class ProductController {


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

    String path = "tiles/pages/frnt/";



    @RequestMapping(path = {"main.bt","productLst.bt"})
    public String productLst(@ModelAttribute("srchFm") SrchVO srchVO, ModelMap model, ProductVO productVO) {
        model.addAttribute("_subimg","true");


        model.addAttribute("productLatest", productService.getProductLatestDtl(productVO));

        srchVO.setSrchRegtId(FrntSessionUtils.getUserId());
        List<EgovMap> eMap = this.productService.getProductPageLst(srchVO);
        srchVO.setTotalRecordCount(eMap.size() > 0 ? Integer.parseInt(eMap.get(0).get("totCnt") + "") : 0);
        model.addAttribute("srchLst", eMap);

        return commUtils.tiles(commUtils.TILES_FRNT, "brand/product/productLst");
    }


    @RequestMapping(path = "productDtl.bt")
    public String productDtl(SrchVO srchVO , ProductVO productVO, ModelMap model,FileVO fileVO) {

        productVO = productService.getProductDtl(productVO);
        fileVO.setParntsDtaId(productVO.getProductId());
        List<FileVO>  fileLst = this.fileService.getFileLst(fileVO);
        model.addAttribute("fileLst",fileLst);

        model.addAttribute("productImgLst",fileLst.stream().filter(c -> "productImg".equals(c.getUploadFileNm())).collect(Collectors.toList()));
        model.addAttribute("labelImgLst",fileLst.stream().filter(c -> "labelImg[]".equals(c.getUploadFileNm())).collect(Collectors.toList()));
        model.addAttribute("productImgAnotherLst",fileLst.stream().filter(c -> "productImgAnother[]".equals(c.getUploadFileNm())).collect(Collectors.toList()));

        model.addAttribute("saveFm",productVO);

        return path+"/brand/product/productDtl";
    }

    @RequestMapping(path = "productLatestDo.ax")
    public String productLatestDo(SrchVO srchVO , ProductVO productVO, ModelMap model,FileVO fileVO) {
        model.addAttribute("productCurrent", productService.getProductLatestDtl(productVO));

        return path+"/brand/product/productAdd/detailSide";
    }




    @CodeId({ "P01", "P02", "P03", "P04", "P05", "P06", "P07" }) // 게시판유형
    @RequestMapping(path = {"productAdd.bt","productMod.bt","{pgId}/productAdd.bt"})
    public String productAddPath(@PathVariable(name = "pgId", required = false) String pgId,SrchVO srchVO,FileVO fileVO,ProductVO productVO, ModelMap model) {
        if("".equals(pgId) || pgId == null) pgId = "introduce";

        if(!"".equals(productVO.getProductId()) && productVO.getProductId() != null ) {
           productVO = productService.getProductDtl(productVO);
           model.addAttribute("savedRegStatus",productVO.getProductRegStatus());

           if(
                   ("003".equals(productVO.getProductRegStatus()) && "maketing".equals(pgId)) ||
                   ("002".equals(productVO.getProductRegStatus()) && ("distribution".equals(pgId) || "maketing".equals(pgId))) ||
                   ("001".equals(productVO.getProductRegStatus()) && ("detail".equals(pgId) || "distribution".equals(pgId) || "maketing".equals(pgId)))
           ) {
               productVO.makeProductRegStatus(pgId);
           }


         }else {
             productVO.makeProductRegStatus(pgId);
         }

        fileVO.setParntsDtaId(productVO.getProductId());
        List<FileVO>  fileLst = this.fileService.getFileLst(fileVO);
        model.addAttribute("fileLst",fileLst);

        model.addAttribute("productImgLst",fileLst.stream().filter(c -> "productImg".equals(c.getUploadFileNm())).collect(Collectors.toList()));
        model.addAttribute("labelImgLst",fileLst.stream().filter(c -> "labelImg[]".equals(c.getUploadFileNm())).collect(Collectors.toList()));
        model.addAttribute("productImgAnotherLst",fileLst.stream().filter(c -> "productImgAnother[]".equals(c.getUploadFileNm())).collect(Collectors.toList()));

        model.addAttribute("saveFm",productVO);

        return commUtils.tiles(commUtils.TILES_FRNT, "brand/product/productAdd/"+pgId);
    }

    @RequestMapping(path = "/productSubmitDo.ax")
    @ResponseBody
    public ModelMap productSubmitDo(
            MultipartHttpServletRequest request,
            SrchVO srchVO,ProductVO productVO) {

        ModelMap modelMap = new ModelMap();

        String rtnId = productService.udtProductInfoDo(productVO);

        List<FileVO> list;
        try {
            list = EgovFileUpload.fileUploads(request, this.path); // 파일 업로드
            if (list.size() > 0) {
                this.fileService.insFileDo(list, productVO.getProductId());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

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

    @RequestMapping(path = "/delProductSubmitDo.ax")
    @ResponseBody
    public ModelMap delProductSubmitDo(
             SrchVO srchVO,ProductVO productVO,FileVO fileVO) {

        ModelMap modelMap = new ModelMap();

        String rtnId = productService.delProductInfoDo(productVO);


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