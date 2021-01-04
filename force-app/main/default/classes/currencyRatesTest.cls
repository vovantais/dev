@isTest    
public class currencyRatesTest  {
      
   public static Integer RESPONSE_CODE = 200;
   public static String RESPONSE_HEADER_KEY = 'Content-Type';
   public static String RESPONSE_HEADER_VALUE = 'application/json;charset=UTF-8';
   public static String RESPONSE_BODY = '[{Cur_ID: 170,Date: "2020-12-30T00:00:00",Cur_Abbreviation: "AUD",Cur_Scale: 1,Cur_Name: "Австралийский доллар",Cur_OfficialRate: 1.9534,}]';
	
	@isTest
   static void testGetcurrencyRates() {

      StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
      mock.setStaticResource('nbrb');
      mock.setStatusCode(RESPONSE_CODE);
      mock.setHeader(RESPONSE_HEADER_KEY, RESPONSE_HEADER_VALUE);
      Test.setMock(HttpCalloutMock.class, new currencyRatesMockHttpResponseGenerator());

      HttpResponse result = currencyRates.getResponse();
      String actualValue = result.getBody();

      System.assertNotEquals(null, result);

      System.assertEquals(RESPONSE_CODE, result.getStatusCode());

      System.assertEquals(RESPONSE_HEADER_VALUE,result.getHeader(RESPONSE_HEADER_KEY));
      
      System.assertEquals(actualValue, RESPONSE_BODY);
      
      List<Object> objList = currencyRates.getRates();
      System.assert(!objList.isEmpty());
      
   }
}