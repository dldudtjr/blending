package net.app.front.brand.product.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.front.brand.product.vo.ProductCateVO;
import net.app.front.brand.product.vo.ProductVO;
import net.app.vo.SrchVO;

public interface ProductService {

//  마이페이지 사용자
    List<EgovMap> getProductPageLst(SrchVO vo);

    ProductVO getProductDtl(ProductVO vo);

    ProductVO getProductLatestDtl(ProductVO vo);



    String udtProductInfoDo(ProductVO productVO);

    String delProductInfoDo(ProductVO productVO);

    List<EgovMap> getProductPageForCateLst(ProductCateVO vo);

}