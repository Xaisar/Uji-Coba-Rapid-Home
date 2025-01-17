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

  Map<String, String> headerTokenForMultipart(String token) => {
    'Authorization': 'Bearer $token',
    'Content-Type': 'multipart/form-data',
  };

  Uri urlLogin(){
    const String urlLogin = LOGINURL;
    return Uri.parse(_baseUrl + _apiVersion + urlLogin);
  }

  Uri urlResetPassword(){
    const String urlResetPassword = RESETPASSWORDURL;
    return Uri.parse(_baseUrl + _apiVersion + urlResetPassword);
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
    return Uri.parse(_baseUrl + _apiVersion + urlGetDetailCatalog + parameter);
  }

  Uri urlGetBilling(String parameter){
    const String urlGetBilling = GETBILLINGURL;
    return Uri.parse(_baseUrl + _apiVersion + urlGetBilling + parameter);
  }

  Uri urlGetDetailBilling(String parameter){
    const String urlGetDetailBilling = GETDETAILBILLINGURL;
    return Uri.parse(_baseUrl + _apiVersion + urlGetDetailBilling + parameter);
  }

  Uri urlPayment(){
    const String urlPayment = PAYMENTURL;
    return Uri.parse(_baseUrl + _apiVersion + urlPayment);
  }

  Uri urlCancelPayment(){
    const String urlCancelPayment = CANCELPAYMENTURL;
    return Uri.parse(_baseUrl + _apiVersion + urlCancelPayment);
  }

  Uri urlPaymentMethod(String parameter){
    const String urlPaymentMethod = GETPAYMENTMETHODURL;
    return Uri.parse(_baseUrl + _apiVersion + urlPaymentMethod + parameter);
  }

  Uri urlGetPayment(String parameter){
    const String urlGetPayment = GETPAYMENTURL;
    return Uri.parse(_baseUrl + _apiVersion + urlGetPayment + parameter);
  }

  Uri urlGeUser(String parameter){
    const String urlGetUser = GETUSERURL;
    return Uri.parse(_baseUrl + _apiVersion + urlGetUser + parameter);
  }

  Uri urlEditUser(String parameter) {
    const String urlEditUser = EDITUSERURL;
    return  Uri.parse(_baseUrl + _apiVersion + urlEditUser + parameter);
  }
}