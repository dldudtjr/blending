package net.app.steppay;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.app.front.mypage.service.MypageService;
import net.app.front.mypage.vo.OrderVO;
import net.app.front.mypage.vo.PayVO;
import net.app.lgn.util.FrntSessionUtils;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;


@Component
public class StepPay {


    @Autowired
    private MypageService mypageService;

    private String payToken = "79c55d979e6024cef45bf0e1cc9a8965bc22895bb80d9da0c2bdb8d4a317bc04";
//     private String productCode = "product_LoggT2Tz5";
    private int productId = 4318;


	// 고객 코드 조회 api (고객 아이디 또는 이름)
	public OrderVO getCustomers(String name) throws IOException, InterruptedException {
	    OrderVO orderVO = new OrderVO();
	    HttpRequest request = HttpRequest.newBuilder()
			    .uri(URI.create("https://api.steppay.kr/api/v1/customers?keyword="+name))
			    .header("accept", "*/*")
			    .header("Secret-Token", payToken)
			    .method("GET", HttpRequest.BodyPublishers.noBody())
			    .build();
			HttpResponse <String>response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());

			// response - json 형식
		ObjectMapper mapper = new ObjectMapper();
		JsonNode JsonMap = mapper.readTree(response.body());
		ArrayList<Map> list = new ArrayList<Map>();
		list = new ObjectMapper().convertValue(JsonMap.get("content"), ArrayList.class); // response body를 list<map>과 매핑
		String code = "";

		for(int i=0; i<list.size(); i++) {
			if (list.get(i).get("username").equals(name)) { // 포털에서 사용자가 가입한 아이디로 고객 코드 리턴
				code = list.get(i).get("code").toString();
				orderVO.setCustomerId(list.get(i).get("id").toString());
				orderVO.setCustomerCode(list.get(i).get("code").toString());
			}
		}
		return orderVO; // 고객 코드
	}



	public String createUsers(String customerName, String customerEmail, String customerPhone) throws IOException, InterruptedException {


		HttpRequest request = HttpRequest.newBuilder()
					.uri(URI.create("https://api.steppay.kr/api/v1/customers"))
					.header("accept", "*/*")
					.header("content-type", "application/json")
					.header("Secret-Token", payToken)
					.method("POST", HttpRequest.BodyPublishers.ofString("{\"name\":\"" + customerName + "\",\"email\":\"" + customerEmail + "\",\"phone\":\"" + customerPhone + "\"}"))
					.build();
		HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
		System.out.println(response.body());

		ObjectMapper mapper = new ObjectMapper();
		JsonNode JsonMap = mapper.readTree(response.body());
		String id = JsonMap.get("id").asText();

		return id;
	}



	// 결제 완료 후 자동 가격플랜삭제
    public void deletePricePlan() throws IOException, InterruptedException {
    	HttpRequest request = HttpRequest.newBuilder()
    		    .uri(URI.create("https://api.steppay.kr/api/v1/products/4318/prices"))
    		    .header("accept", "*/*")
    		    .header("Secret-Token", "aa9940916492075b347401318e68c3437bda8dfa5259fa5914631205ccd3e868")
    		    .method("GET", HttpRequest.BodyPublishers.noBody())
    		    .build();
    		HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
    		System.out.println(response.body());

    		ObjectMapper mapper = new ObjectMapper();
			JsonNode JsonMap = mapper.readTree(response.body());
			ArrayList<Map> list = new ArrayList<Map>();
			list = new ObjectMapper().convertValue(JsonMap, ArrayList.class); // response body를 list<map>과 매핑
		    System.out.println(list);

		    int priceId = 0;
		for(int i=list.size()-1; i>=0; i--) {
			if (list.get(i).get("planDescription").toString().indexOf("admin") == -1) {
				priceId = (int) list.get(i).get("id");
			}
		}
		HttpRequest req = HttpRequest.newBuilder()
    		    .uri(URI.create("https://api.steppay.kr/api/v1/products/" + productId + "/prices/" + priceId))
    		    .header("accept", "*/*")
    		    .header("Secret-Token", payToken)
    		    .method("DELETE", HttpRequest.BodyPublishers.noBody())
    		    .build();
    		HttpResponse<String> res = HttpClient.newHttpClient().send(req, HttpResponse.BodyHandlers.ofString());
    		System.out.println(res.body());
    }



	// 주문시 상품의 가격 플랜 목록 조회
    public String getOrderPrice(int month,int price, String planName) throws IOException, InterruptedException {
        OrderVO orderVO = this.getCustomers(FrntSessionUtils.getUserInfo().getEmail());

        switch (planName) {
            case "001" : planName = "BASIC";
//                         priceId ="product_ECIwyQ18l";
                         break;
            case "002" : planName = "PREMIUM"; //product_H6ZNufAfE
//                        priceId ="product_H6ZNufAfE";
                         break;
            case "003" : planName = "EXCLUSIVE"; //product_gaCFaIZw8
//                        priceId ="product_gaCFaIZw8";
                         break;
        }
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://api.steppay.kr/api/v1/products?keyword="+planName))
                .header("accept", "*/*")
                .header("Secret-Token", payToken)
                .method("GET", HttpRequest.BodyPublishers.noBody())
                .build();
        HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
//        System.out.println(response.body());

        ObjectMapper mapper = new ObjectMapper();
        JsonNode JsonMap = mapper.readTree(response.body());


        orderVO.setProductId(JsonMap.get("content").get(0).get("id").asText());
        orderVO.setProductCode(JsonMap.get("content").get(0).get("code").asText());

//        price = 10;
         Iterator<JsonNode> inner = JsonMap.get("content").get(0).get("prices").iterator();
         while (inner.hasNext()) {
             JsonNode innerElement = inner.next();
             if (innerElement != null) {
                 System.out.println(">>>>>innerElement.get(\"price\").asInt()="+innerElement.get("price").asInt());

                 if(innerElement.get("planName").asText().indexOf(month+"") > -1 ) {
                     orderVO.setPriceId(innerElement.get("id").asText());
                     orderVO.setPriceCode(innerElement.get("code").asText());
                     break;
                 }
//                 if(innerElement.get("price").asInt() == price) {
//                     orderVO.setPriceId(innerElement.get("id").asText());
//                     orderVO.setPriceCode(innerElement.get("code").asText());
//                     break;
//                 }
             }
         }
         return this.getOrder(orderVO);
    }


	private String getOrder(OrderVO orderVO) throws IOException, InterruptedException {

        String currency = "KRW"; // 통화코드
        int minimumQuantity = 1; // 최소주문수량
        LocalDateTime now = LocalDateTime.now();
        String purchaseDeadline = now.plusMinutes(10).toString(); //결제 기한 - 결제창 생성 후 10분 후까지
        System.out.println(purchaseDeadline);

        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://api.steppay.kr/api/v1/orders"))
                .header("accept", "*/*")
                .header("content-type", "application/json")
                .header("Secret-Token", "79c55d979e6024cef45bf0e1cc9a8965bc22895bb80d9da0c2bdb8d4a317bc04")

                .method("POST", HttpRequest.BodyPublishers.ofString("{\"items\":[{\"currency\":\""+currency+"\",\"minimumQuantity\":"+minimumQuantity+",\"productId\":"+orderVO.getProductId()+""
                        + ",\"priceId\":"+orderVO.getPriceId()+",\"productCode\":\""+orderVO.getProductCode()+"\",\"priceCode\":\""+orderVO.getPriceCode()+"\"}]"
                                + ",\"customerId\":"+orderVO.getCustomerId()+",\"customerCode\":\""+orderVO.getCustomerCode()+"\"}"))
                .build();
            HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
            System.out.println(">>>>>>>>269="+response.body());

        ObjectMapper mapper = new ObjectMapper();
        JsonNode JsonMap = mapper.readTree(response.body());
        String orderCode = JsonMap.get("orderCode").asText(); // 주문코드

        return orderCode;
    }


	   public ResponseBody getOrders() throws IOException, InterruptedException {

	        String currency = "KRW"; // 통화코드
	        int minimumQuantity = 1; // 최소주문수량
	        LocalDateTime now = LocalDateTime.now();
	        String purchaseDeadline = now.plusMinutes(10).toString(); //결제 기한 - 결제창 생성 후 10분 후까지
	        System.out.println(purchaseDeadline);


	        String stDate = "2023-04-06T03:12:54";
	        String edDate = "2023-04-12T03:12:54";

	        OkHttpClient client = new OkHttpClient();

	        Request request = new Request.Builder()
	          .url("https://api.steppay.kr/api/v1/orders?startDate="+stDate+"&endDate="+stDate)
	          .get()
	          .addHeader("accept", "*/*")
	          .addHeader("Secret-Token", "79c55d979e6024cef45bf0e1cc9a8965bc22895bb80d9da0c2bdb8d4a317bc04")
	          .build();

	        Response response = client.newCall(request).execute();

	         System.out.println(">>>>>>>>269="+response.body());

	        ObjectMapper mapper = new ObjectMapper();
//	        JsonNode JsonMap = mapper.reader(response.body());
//	        String orderCode = JsonMap.get("orderCode").asText(); // 주문코드

	        return response.body();
	    }


    // 주문 코드로 결제 금액 찾기
    public int getPaidAmount(String orderCode) throws IOException, InterruptedException {
    	HttpRequest request = HttpRequest.newBuilder()
    		    .uri(URI.create("https://api.steppay.kr/api/v1/orders/" + orderCode))
    		    .header("accept", "*/*")
    		    .header("Secret-Token", payToken)
    		    .method("GET", HttpRequest.BodyPublishers.noBody())
    		    .build();
    		HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
    		System.out.println(response.body());

    	ObjectMapper mapper = new ObjectMapper();
        JsonNode JsonMap = mapper.readTree(response.body());
        int paidAmount = JsonMap.get("paidAmount").asInt(); // 결제한 금액
        int returnedAmount = JsonMap.get("returnedAmount").asInt(); // 환불 금액
        if (returnedAmount > 0) {
        	paidAmount = returnedAmount - paidAmount;
        }
    	return paidAmount;
    }

    /**
     * @param payVO
     * @return
     * @throws IOException
     * @throws InterruptedException
     * @apiNote 기존 주믄을 모두 취소 처리
     */
    public String changeProduct(PayVO payVO) throws IOException, InterruptedException {
        List<PayVO> refundVOs = mypageService.getPaRemainInfo(payVO);
        for(PayVO refundVO :  refundVOs) {
            mypageService.udtServiceStatus(refundVO);
      //    this.cancelOrderOnce(refundVO.getRefundPrice(), refundVO.getOrderCode());

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create("https://api.steppay.kr/api/v1/orders/"+ refundVO.getOrderCode() +"/cancel"))
                    .header("accept", "*/*")
                    .header("content-type", "application/json")
                    .header("Secret-Token", payToken)
                    .method("PATCH", HttpRequest.BodyPublishers.ofString("{\"requestPrice\":"+refundVO.getRefundPrice()+"}"))
                    .build();
                HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
                System.out.println(response.body()); // 환불이 완료되었습니다
        }
        return "001";
    }



    public String cancelOrderOnce(int refund, String orderCode) throws IOException, InterruptedException {
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://api.steppay.kr/api/v1/orders/"+ orderCode +"/cancel"))
                .header("accept", "*/*")
                .header("content-type", "application/json")
                .header("Secret-Token", payToken)
                .method("PATCH", HttpRequest.BodyPublishers.ofString("{\"requestPrice\":"+refund+"}"))
                .build();
            HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
            System.out.println(response.body()); // 환불이 완료되었습니다

            ObjectMapper mapper = new ObjectMapper();
        JsonNode JsonMap = mapper.readTree(response.body());
        return JsonMap.get("message").asText();
    }


//  // 관리자 가격 플랜 코드 생성 api (서비스 시간, 가격)
//  public int createPricePlan(int serviceHours, int price) throws IOException, InterruptedException {
//
//      HttpRequest request = HttpRequest.newBuilder()
//              .uri(URI.create("https://api.steppay.kr/api/v1/products/" + productId + "/prices"))
//              .header("accept", "*/*")
//              .header("content-type", "application/json")
//              .header("Secret-Token", payToken)
//              .method("POST", HttpRequest.BodyPublishers.ofString("{\"plan\":{\"name\":\""
//              + serviceHours + "시간 / 일\",\"description\":\"admin\"},\"claim\":{\"methodType\":\"PRE\"},\"recurring\":{\"intervalCount\":1,\"interval\":\"MONTH\",\"aggregateUsageType\":\"SUM\",\"usageType\":\"LICENSED\"},\"price\":"
//              + price + ",\"unit\":\"건\",\"type\":\"FLAT\"}"))
//              .build();
//          HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
//          System.out.println(response.body());
//
//      ObjectMapper mapper = new ObjectMapper();
//      JsonNode JsonMap = mapper.readTree(response.body());
//      int priceId = JsonMap.get("id").asInt(); // 가격 플랜 id
//
//      return priceId;
//  }

//  // 관리자 가격 플랜 코드 수정 api (기존 시간, 수정할 시간, 수정할 가격)
//  public int modifyPricePlan(int originHours, int serviceHours, int price) throws IOException, InterruptedException {
//      int priceId = getPriceId(originHours, "admin");
//      HttpRequest request = HttpRequest.newBuilder()
//              .uri(URI.create("https://api.steppay.kr/api/v1/products/" + productId + "/prices/" + priceId))
//              .header("accept", "*/*")
//              .header("content-type", "application/json")
//              .header("Secret-Token", payToken)
//              .method("PUT", HttpRequest.BodyPublishers.ofString("{\"plan\":{\"name\":\""
//          + serviceHours +"시간 / 일\",\"description\":\"admin\"},\"unit\":\"건\",\"price\":"
//          + price +"}"))
//              .build();
//          HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
//          System.out.println(response.body());
//      return priceId;
//  }




 // 사용자 가격 플랜 코드 생성 api (가격, 플랜이름(영문), 서비스 건, 기기 수)
    public String createPricePlan(int Price, String planName, String serviceCount, int iotGearNum) throws IOException, InterruptedException {

        switch (planName) {
            case "001" : planName = "BASIC"; //product_ECIwyQ18l
                         break;
            case "002" : planName = "PRIEMIUM"; //product_H6ZNufAfE
                         break;
            case "003" : planName = "EXCLUCIVE"; //product_gaCFaIZw8
                         break;
        }


        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://api.steppay.kr/api/v1/products/4318/prices"))
                .header("accept", "*/*")
                .header("content-type", "application/json")
                .header("Secret-Token", payToken)
                .method("POST", HttpRequest.BodyPublishers.ofString("{\"plan\":{\"name\":\""
                + planName + serviceCount.substring(0, 1) + "\",\"description\":\"iot "
                + iotGearNum + " \"},\"firstSale\":{\"enabled\":false,\"price\":0},\"claim\":{\"methodType\":\"PRE\",\"whenToClaimType\":\"FIRST_PAYMENT\",\"billingDate\":0,\"provideStartDay\":0},\"options\":[{\"priceCode\":\"price_JFktR0zDz\"}],"
                + "\"recurring\":{\"intervalCount\":0,\"interval\":\"DAY\",\"aggregateUsageType\":\"SUM\",\"usageType\":\"LICENSED\"},\"price\":"
                + Price + ",\"unit\":\"건\",\"type\":\"ONE_TIME\",\"isRepresentative\":false}"))
                .build();
            HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
            System.out.println(response.body());

        ObjectMapper mapper = new ObjectMapper();
        JsonNode JsonMap = mapper.readTree(response.body());
        String priceCode = JsonMap.get("code").asText(); // 가격 플랜 코드

        return priceCode;
    }


    // 주문시 상품의 가격 플랜 목록 조회
    public HashMap<String, Object> getPriceLst() throws IOException, InterruptedException {
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://api.steppay.kr/api/v1/products/" + productId + "/prices"))
                .header("accept", "*/*")
                .header("Secret-Token", payToken)
                .method("GET", HttpRequest.BodyPublishers.noBody())
                .build();
            HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
            System.out.println(response.body());

        ObjectMapper mapper = new ObjectMapper();
        JsonNode JsonMap = mapper.readTree(response.body());

        ArrayList<HashMap> list = new ArrayList<HashMap>();
        list = new ObjectMapper().convertValue(JsonMap, ArrayList.class);
        HashMap<String, Object> map = new HashMap<String, Object>();
        for(int i=0; i<list.size(); i++) {
            if(list.get(i).get("planDescription").toString().indexOf("admin") > -1) { // 관리자가 등록한 가격 플랜 3가지 가져와서 map에 Put
                String count = list.get(i).get("planDescription").toString();
                int price = (int) Math.floor((double) list.get(i).get("price"));
                System.out.println(price);
                map.put("price"+(i+1), price);
                map.put("count"+(i+1), count.substring(5, count.length()));
            }
        }

        return map;
    }




}



