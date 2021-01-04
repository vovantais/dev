@isTest
global  class currencyRatesMockHttpResponseGenerator  implements HttpCalloutMock {

   public static String  API_CURS_RATES= 'https://www.nbrb.by/api/exrates/rates?periodicity=0';
   public static Integer RESPONSE_CODE = 200;
   public static String RESPONSE_HEADER_KEY = 'Content-Type';
   public static String RESPONSE_HEADER_VALUE = 'application/json;charset=UTF-8';
   public static String RESPONSE_BODY = '[{Cur_ID: 170,Date: "2020-12-30T00:00:00",Cur_Abbreviation: "AUD",Cur_Scale: 1,Cur_Name: "Австралийский доллар",Cur_OfficialRate: 1.9534,}]';
   global HTTPResponse respond(HTTPRequest request){
      
      System.assertEquals(API_CURS_RATES, request.getEndpoint());
      System.assertEquals('GET', request.getMethod());

      HttpResponse res = new HttpResponse();
      res.setHeader(RESPONSE_HEADER_KEY, RESPONSE_HEADER_VALUE);
      res.setBody(RESPONSE_BODY);
      res.setStatusCode(RESPONSE_CODE);
      return res;
   }
}