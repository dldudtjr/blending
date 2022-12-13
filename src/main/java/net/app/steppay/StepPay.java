package net.app.steppay;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;


@Component
public class StepPay {

	private String payToken = "aa9940916492075b347401318e68c3437bda8dfa5259fa5914631205ccd3e868";
    private String productCode = "product_LoggT2Tz5";
    private int productId = 4318;


	// 고객 코드 조회 api (고객 아이디 또는 이름)
	public String getCustomers(String name) throws IOException, InterruptedException {
		HttpRequest request = HttpRequest.newBuilder()
			    .uri(URI.create("https://api.steppay.kr/api/v1/customers"))
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
			}
		}
		return code; // 고객 코드
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

	// 사용자 가격 플랜 코드 생성 api (가격, 플랜이름(영문), 서비스 건, 기기 수)
	public String createPricePlan(int Price, String planName, String serviceCount, int iotGearNum) throws IOException, InterruptedException {
		switch (planName) {
		    case "001" : planName = "regular";
		                 break;
		    case "002" : planName = "prime";
		                 break;
		    case "003" : planName = "primeplus";
		                 break;
		    case "004" : planName = "platinum";
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

//	// 관리자 가격 플랜 코드 생성 api (서비스 시간, 가격)
//	public int createPricePlan(int serviceHours, int price) throws IOException, InterruptedException {
//
//		HttpRequest request = HttpRequest.newBuilder()
//			    .uri(URI.create("https://api.steppay.kr/api/v1/products/" + productId + "/prices"))
//			    .header("accept", "*/*")
//			    .header("content-type", "application/json")
//			    .header("Secret-Token", payToken)
//			    .method("POST", HttpRequest.BodyPublishers.ofString("{\"plan\":{\"name\":\""
//			    + serviceHours + "시간 / 일\",\"description\":\"admin\"},\"claim\":{\"methodType\":\"PRE\"},\"recurring\":{\"intervalCount\":1,\"interval\":\"MONTH\",\"aggregateUsageType\":\"SUM\",\"usageType\":\"LICENSED\"},\"price\":"
//			    + price + ",\"unit\":\"건\",\"type\":\"FLAT\"}"))
//			    .build();
//			HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
//			System.out.println(response.body());
//
//		ObjectMapper mapper = new ObjectMapper();
//		JsonNode JsonMap = mapper.readTree(response.body());
//		int priceId = JsonMap.get("id").asInt(); // 가격 플랜 id
//
//		return priceId;
//	}

//	// 관리자 가격 플랜 코드 수정 api (기존 시간, 수정할 시간, 수정할 가격)
//	public int modifyPricePlan(int originHours, int serviceHours, int price) throws IOException, InterruptedException {
//		int priceId = getPriceId(originHours, "admin");
//		HttpRequest request = HttpRequest.newBuilder()
//			    .uri(URI.create("https://api.steppay.kr/api/v1/products/" + productId + "/prices/" + priceId))
//			    .header("accept", "*/*")
//			    .header("content-type", "application/json")
//			    .header("Secret-Token", payToken)
//			    .method("PUT", HttpRequest.BodyPublishers.ofString("{\"plan\":{\"name\":\""
//			+ serviceHours +"시간 / 일\",\"description\":\"admin\"},\"unit\":\"건\",\"price\":"
//			+ price +"}"))
//			    .build();
//			HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
//			System.out.println(response.body());
//		return priceId;
//	}

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

	// 주문 코드 생성 api (고객코드, 상품코드, 가격플랜코드)
    public String getOrders(String customerCode, String priceCode) throws IOException, InterruptedException {

    	String currency = "KRW"; // 통화코드
    	int minimumQuantity = 1; // 최소주문수량
    	LocalDateTime now = LocalDateTime.now();
    	String purchaseDeadline = now.plusMinutes(10).toString(); //결제 기한 - 결제창 생성 후 10분 후까지
    	System.out.println(purchaseDeadline);
    	String paymentGateway = "NICE"; // 결제사 nice

    	HttpRequest request = HttpRequest.newBuilder()
    		    .uri(URI.create("https://api.steppay.kr/api/v1/orders"))
    		    .header("accept", "*/*")
    		    .header("content-type", "application/json")
    		    .header("Secret-Token", payToken)
    		    .method("POST", HttpRequest.BodyPublishers.ofString("{\"items\":[{\"currency\":\""+ currency // 통화
    		    		+"\",\"minimumQuantity\":"+ minimumQuantity // 최소 수량
    		    		+",\"productCode\":\""+ productCode // 주문코드
    		    		+"\",\"priceCode\":\""+ priceCode // 가격플랜코드
    		    		+"\"}],\"customerCode\":\"" + customerCode // 고객코드
    		    		+"\",\"purchaseDeadline\":\"" + purchaseDeadline // 결제 만료 기한
    		    		+"\",\"paymentGateway\":\"" + paymentGateway + "\"}")) // pg사
    		    .build();
    		HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());

    	ObjectMapper mapper = new ObjectMapper();
    	JsonNode JsonMap = mapper.readTree(response.body());
    	String orderCode = JsonMap.get("orderCode").asText(); // 주문코드

    	return orderCode;
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

    // 주문 취소 api (환불금액, 주문코드)
    public String cancelOrder(String refund, String orderCode) throws IOException, InterruptedException {
    	HttpRequest request = HttpRequest.newBuilder()
    		    .uri(URI.create("https://api.steppay.kr/api/v1/orders/"+ orderCode +"/cancel"))
    		    .header("accept", "*/*")
    		    .header("content-type", "application/json")
    		    .header("Secret-Token", payToken)
    		    .method("PATCH", HttpRequest.BodyPublishers.ofString("{\"requestPrice\":" + refund + "}"))
    		    .build();
    		HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
    		System.out.println(response.body()); // 환불이 완료되었습니다

    		ObjectMapper mapper = new ObjectMapper();
            JsonNode JsonMap = mapper.readTree(response.body());

    	return JsonMap.get("message").asText();
    }

}