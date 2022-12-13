package net.app.front.buyer.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.front.brand.product.service.impl.ProductDAO;
import net.app.front.brand.product.vo.ProductCateVO;
import net.app.front.buyer.service.BuyerService;
import net.app.lgn.util.FrntSessionUtils;
import net.app.vo.SrchVO;

@Service("buyerService")
public class BuyerServiceImpl extends EgovAbstractServiceImpl implements BuyerService {

    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;

    @Resource(name = "buyerDAO")
    private BuyerDAO buyerDAO;

    @Resource(name = "productDAO")
    private ProductDAO productDAO;


    @Override
    public EgovMap getLatestBrand(SrchVO vo) {
        return this.buyerDAO.getLatestBrand(vo);
    }

    @Override
    public ProductCateVO getProductCateDtl(ProductCateVO productCateVO) {
        return this.buyerDAO.getProductCateDtl(productCateVO);
    }

    @Override
    public List<ProductCateVO> getProductCateLst(ProductCateVO productCateVO) {
        return this.buyerDAO.getProductCateLst(productCateVO);
    }


    @Override
    public String udtCategorySrchInfoDo(ProductCateVO vo) {

        vo.setUserId(FrntSessionUtils.getUserId());

        if("".equals(vo.getProductCateId())){
               vo.setProductCateId(this.buyerDAO.getProductCateId());
        }
        this.buyerDAO.udtCategorySrchInfoDo(vo);
        vo.setCateType("002");
        return this.InsSrchCateGory(vo);
    }

    public String InsSrchCateGory(ProductCateVO vo) {
        this.productDAO.delProductCateDo(vo.getProductCateId());
        for (String keyword : vo.getKeywordArr()) {
            String cateId = this.productDAO.getCateDo(keyword);
            if (cateId == null || "".equals(cateId)) {
                this.productDAO.udtCateDo(keyword);
                cateId = this.productDAO.getCateDo(keyword);
            }
            vo.setCateId(cateId);
            this.buyerDAO.insProductSrchCateDo(vo);
        }
        return "success";
    }

    @Override
    public String delProductCateSubmitDo(ProductCateVO vo) {
        this.buyerDAO.delProductCateMapDo(vo.getProductCateId());
        return this.buyerDAO.delProductCateDo(vo.getProductCateId());

    }

    @Override
    public List<EgovMap> getBuyerPageLst(SrchVO srchVO) {
        return this.buyerDAO.getBuyerPageLst(srchVO);
    }

}