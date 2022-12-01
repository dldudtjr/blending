package net.app.front.buyer.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egov.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.front.brand.product.vo.ProductCateVO;
import net.app.vo.SrchVO;

@Repository("buyerDAO")
public class BuyerDAO extends EgovComAbstractDAO {

    public EgovMap getLatestBrand(SrchVO vo) {
        return this.selectOne("buyerDAO.getLatestBrand", vo);
    }


    public String getProductCateId() {
        return this.selectOne("buyerDAO.getProductCateId")+"";
    }

    public String udtCategorySrchInfoDo(ProductCateVO vo) {
        return this.update("buyerDAO.udtCategorySrchInfoDo", vo)+"";
    }

    public String insProductSrchCateDo(ProductCateVO vo) {
        return this.update("buyerDAO.insProductSrchCateDo", vo)+"";
    }

    public ProductCateVO getProductCateDtl(ProductCateVO vo) {
        return this.selectOne("buyerDAO.getProductCateDtl", vo);
    }

    public List<ProductCateVO> getProductCateLst(ProductCateVO productCateVO) {
        return this.selectList("buyerDAO.getProductCateLst", productCateVO);
    }


    public String delProductCateSubmitDo(ProductCateVO vo) {
        return this.delete("buyerDAO.delProductCate", vo)+"";
    }


    public String delProductCateMapDo(String productCateId) {
        return this.delete("buyerDAO.delProductCateMapDo", productCateId)+"";

    }

    public String delProductCateDo(String productCateId) {
        return this.delete("buyerDAO.delProductCateDo", productCateId)+"";
    }


}