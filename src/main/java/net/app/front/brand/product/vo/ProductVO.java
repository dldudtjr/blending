package net.app.front.brand.product.vo;

import lombok.Data;
import net.app.lgn.enu.UserStatusEnum;
import net.app.vo.SessEtdVO;

@Data
public class ProductVO extends SessEtdVO{
// <sf:input path="productNm"   class="input-text" placeholder="SeSi Leggings" />

	private String productId;
	private String productRelDt;

	private String productNm;

	private String cateCode;
	private String cateNm;
	private String cateType;

	private String[] cateNmArr;
	private String[] categoryArr;
	private String[] cateCodeArr;

	private String certStatus;
	private String usp; // Unique Selling Propositions

	private String productInfo;
	private String productStyleNo;

	private String cost;
	private String msrp;
	private String msrpMax;
    private String smpOrder;
    private String margin;
    private String marginMax;

    private String costInfo;

	private String bcdYn ="N";
	private String bcdSlt;
	private String bcdNo;

	private String pkgYn ="N";
	private String pkgStdCode;
	private String pkgStdX;
	private String pkgStdY;
	private String pkgStdH;

	private String productVolCode;
	private String productVol;

	private String productWtCode;
	private String productWt;


	private String cartonYn ="N";
	private String cartonStdCode;
	private String cartonX;
	private String cartonY;
	private String cartonH;

	private String cartonCbmVolCode;
	private String cartonCbmVol;
	private String cartonWtCode;
	private String cartonWt;

	private String palletTi;
	private String palletHi;

	private String cartonTot;


	private String inboxYn ="N";
	private String inboxStdCode;
	private String inboxX;
	private String inboxY;
	private String inboxH;

	private String inboxCbmVolCode;
	private String inboxCbmVol;
	private String inboxWtCode;
	private String inboxWt;

	private String expireDtYn;
	private String expireDtCode;
	private String expireDt;


	private String  ingredientsYn ="N";
	private String  ingredients;

	private String  labelYn ="N";

	private String  manuFacturedCountry;
	private String  manuFacturedCity;


	private String  sellYn ="N";
	private String  sellWhere;

	private String  purchaseYn ="N";
	private String  distributorType;
	private String  distributedWhere;



	private String  deliveryYn ="N";
	private String  pbOrderYn ="N";
	private String  coldStorageYn ="N";
	private String  storageMethodYn ="N";

	private String  marketingBudget;
//    private File    anotherImg;
	private String  mvUrl;


	private String  productRegStatus;
	private String  productOrgStatus;

	private String  productTotalCnt;



	public void makeProductRegStatus(String pgId) {
		if ( "introduce".equals(pgId) ) {
			this.productRegStatus =  UserStatusEnum.INTRODUCE.getCode();
		}else if ( "detail".equals(pgId) ) {
			this.productRegStatus =  UserStatusEnum.DETAIL.getCode();
		}else if ( "distribution".equals(pgId) ) {
			this.productRegStatus =  UserStatusEnum.DISTRIBUTTION.getCode();
		}else if ( "maketing".equals(pgId) ) {
			this.productRegStatus =  UserStatusEnum.MAKETING.getCode();
		}
	}


}
