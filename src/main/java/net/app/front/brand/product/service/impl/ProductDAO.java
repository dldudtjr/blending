package net.app.front.brand.product.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egov.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.front.brand.product.vo.ProductVO;
import net.app.vo.SrchVO;

@Repository("productDAO")
public class ProductDAO extends EgovComAbstractDAO {

    public List<EgovMap> getProductPageLst(SrchVO vo) {
        return this.selectList("productDAO.getProductPageLst", vo);
    }

    public ProductVO getProductDtl(ProductVO vo) {
        return this.selectOne("productDAO.getProductDtl", vo);
    }

    public ProductVO getProductLatestDtl(ProductVO vo) {
        return this.selectOne("productDAO.getProductLatestDtl", vo);
    }



    public String udtProductIntroduceInfoDo(ProductVO vo) {
        return this.update("productDAO.udtProductIntroduceInfoDo", vo)+"";
    }

    public String udtProductDetailInfoDo(ProductVO vo) {
        return this.update("productDAO.udtProductDetailInfoDo", vo)+"";
    }

    public String udtProductDistributionInfoDo(ProductVO vo) {
        return this.update("productDAO.udtProductDistributionInfoDo", vo)+"";
    }

    public String udtProductMaketingInfoDo(ProductVO vo) {
        return this.update("productDAO.udtProductMaketingInfoDo", vo)+"";
    }

    public String delProductInfoDo(ProductVO vo) {
        return this.update("productDAO.delProductInfoDo", vo)+"";
    }

    public String getProductId(ProductVO vo) {
        return this.selectOne("productDAO.getProductId", vo);
    }


}