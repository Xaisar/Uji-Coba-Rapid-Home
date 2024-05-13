import "api_name.dart";

class ApiUtils{
  final String _baseUrl = BASEURL;
  final String _baseurlQuaryParameter = BASEURLQUARYPARAMETER;
  final String _apiVersion = APIVERSION;

  Map<String, String> header() => {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  Map<String, String> headerWithToken(String token) => {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  Uri urlLogin(){
    const String urlLogin = LOGINURL;
    return Uri.parse(_baseUrl + _apiVersion + urlLogin);
  }

  Uri urlValidateToken(){
    const String urlValidateToken = VALIDATETOKENURL;
    return Uri.parse(_baseUrl + _apiVersion + urlValidateToken);
  }

  Uri urlRegister(){
    const String urlRegister = REGISTERURL;
    return Uri.parse(_baseUrl + _apiVersion + urlRegister);
  }

  Uri urlLogout(){
    const String urlLogout = LOGOUTURL;
    return Uri.parse(_baseUrl + _apiVersion + urlLogout);
  }

  Uri urlGetAllMerchant(){
    const String urlGetAllMerchant = GETALLMERCHANTURL;
    return Uri.parse(_baseUrl + _apiVersion + urlGetAllMerchant);
  }

  Uri urlAddCustomer(){
    const String urlAddCustomer = ADDCUSTOMERURL;
    return Uri.parse(_baseUrl + _apiVersion + urlAddCustomer);
  }

  Uri urlGetCatalogCardHome(String parameter){
    const String urlGetCatalogCardHome = GETCATALOGCARDHOMEURL;
    Map<String, String> parameterQuery = {'customer_id': parameter};
    return Uri.https(_baseurlQuaryParameter, _apiVersion + urlGetCatalogCardHome, parameterQuery);
  }

  Uri urlGetCatalogs(String parameter){
    const String urlGetCatalogs = GETCATALOGSURL;
    Map<String, String> parameterQuery = {'customer_id': parameter};
    return Uri.https(_baseurlQuaryParameter, _apiVersion + urlGetCatalogs, parameterQuery);
  }

  Uri urlGetDetailCatalog(String parameter){
    const String urlGetDetailCatalog = GETDETAILCATALOGURL;
    return Uri.parse(_baseUrl + _apiVersion + urlGetDetailCatalog);
  }

  Uri urlGetBilling(String parameter){
    const String urlGetBilling = GETBILLINGURL;
    return Uri.parse(_baseUrl + _apiVersion + urlGetBilling + parameter);
  }

  Uri urlGetDetailBilling(String parameter){
    const String urlGetDetailBilling = GETDETAILBILLINGURL;
    return Uri.parse(_baseUrl + _apiVersion + urlGetDetailBilling + parameter);
  }
}