package net.app.front.buyer.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.front.brand.product.vo.ProductCateVO;
import net.app.vo.SrchVO;

public interface BuyerService {

    EgovMap getLatestBrand(SrchVO vo);

    String udtCategorySrchInfoDo(ProductCateVO productCateVO);

    ProductCateVO getProductCateDtl(ProductCateVO productCateVO);

    List<ProductCateVO> getProductCateLst(ProductCateVO productCateVO);

    String delProductCateSubmitDo(ProductCateVO productCateVO);


}