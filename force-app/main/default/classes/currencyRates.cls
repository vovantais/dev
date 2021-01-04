public  class currencyRates {

   public static String  API_CURS_RATES= 'https://www.nbrb.by/api/exrates/rates?periodicity=0';
   
   public static Httpresponse getResponse(){
   
      Http http =new Http();
      HttpRequest request = new HttpRequest();
      request.setEndPoint(API_CURS_RATES);
      request.setMethod('GET');
      HttpResponse response = http.send(request);
      return response;
	}
	
   @AuraEnabled
   public static List<Object> getRates(){
      String response  =getResponse().getBody(); 
		List<Object> result = (List<Object>)JSON.deserializeUntyped(response);
      return result;
   }
}