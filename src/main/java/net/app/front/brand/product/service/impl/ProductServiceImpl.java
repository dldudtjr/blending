package net.app.front.brand.product.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.file.service.FileService;
import net.app.file.vo.FileVO;
import net.app.front.brand.product.service.ProductService;
import net.app.front.brand.product.vo.ProductCateVO;
import net.app.front.brand.product.vo.ProductVO;
import net.app.lgn.util.FrntSessionUtils;
import net.app.vo.SrchVO;

@Service("productService")
public class ProductServiceImpl extends EgovAbstractServiceImpl implements ProductService {



    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;


    @Resource(name = "productDAO")
    private ProductDAO productDAO;


    @Resource(name = "fileService")
    private FileService fileService;




    @Override
    public List<EgovMap> getProductPageLst(SrchVO vo) {
        return this.productDAO.getProductPageLst(vo);
    }



    @Override
    public List<EgovMap> getProductPageForCateLst(ProductCateVO vo) {
        return this.productDAO.getProductPageForCateLst(vo);
    }




    @Override
    public ProductVO getProductDtl(ProductVO vo) {
        return this.productDAO.getProductDtl(vo);
    }


    @Override
    public ProductVO getProductLatestDtl(ProductVO vo) {
        vo.setRegtId(FrntSessionUtils.getUserId());
        return this.productDAO.getProductLatestDtl(vo);
    }




    @Override
    public String udtProductInfoDo(ProductVO vo) {

        vo.setRegtId(FrntSessionUtils.getUserId());

        if("001".equals(vo.getProductOrgStatus())){

            if("".equals(vo.getProductId()) || vo.getProductId() == null ) {
                vo.setProductId(this.productDAO.getProductId(vo));
            }
            System.out.println(">>>>>>>>>vo.getProductId() A= "+vo.getProductId());

            this.productDAO.udtProductIntroduceInfoDo(vo);
            vo.setCateType("001");
            this.InscateGory(vo);

            System.out.println(">>>>>>>>>vo.getProductId() B= "+vo.getProductId());

        }else if("002".equals(vo.getProductOrgStatus())){
            this.productDAO.udtProductDetailInfoDo(vo);
        }else if("003".equals(vo.getProductOrgStatus())){
            this.productDAO.udtProductDistributionInfoDo(vo);
        }else if("004".equals(vo.getProductOrgStatus())){
            this.productDAO.udtProductMaketingInfoDo(vo);
        }
        return vo.getProductId();
    }

    @Override
    public String delProductInfoDo(ProductVO vo) {
        FileVO fileVO = new FileVO();
        fileVO.setParntsDtaId(vo.getProductId());
        int cnt = this.fileService.delFileDo(fileVO);
        return    this.productDAO.delProductInfoDo(vo);

    }


    public void InscateGory(ProductVO vo) {
        this.productDAO.delProductCateDo(vo.getProductId());
        if(vo.getCategoryArr() != null) {
            for(String cateNm : vo.getCategoryArr()) {
                String cateCode = this.productDAO.getCateDo(cateNm);
                if("".equals(cateCode) || cateCode == null) {
                    this.productDAO.udtCateDo(cateNm);
                    cateCode = this.productDAO.getCateDo(cateNm);
                }
                vo.setCateCode(cateCode);
                this.productDAO.insProductCateDo(vo);
            }
        }
    }



}


