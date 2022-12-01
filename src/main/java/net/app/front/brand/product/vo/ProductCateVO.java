package net.app.front.brand.product.vo;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import lombok.Data;

@Data
public class ProductCateVO{


	private String productCateId;
	private String productCateNm;
	private String cateType;
	private String cateId;

	private String[] keywordArr;
	private String[] productCateIdArr;



	private String msrpMin;
	private String msrpMax;
	private String costMin;
	private String costMax;
    private String marginMin;
    private String marginMax;
    private String keyword;
    private String userId;
    private String sortSn;

    private List<EgovMap> subMap;

}
