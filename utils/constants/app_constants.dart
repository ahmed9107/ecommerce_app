// ignore_for_file: constant_identifier_names
class AppConstants {
  static const String APP_NAME                    = "AZ_Ecom";
  static const int APP_VERSION                    = 1;
  static const String CART_LIST                   = 'cart-list';
  static const String CART_HISTORY_LIST           = 'cart-history-list';
  static const String TOKEN                       = '';
  static const String PHONE                       = '';
  static const String PASSWORD                    = '';

  /// Auth end points
  static const String BASE_URL                    = 'https://didishoop.com/public/estore_api';
  //static const String BASE_URL                  = 'http://localhost/eStore';
  static const String REGISTRATION_URI            = '/auth/signup.php';
  static const String VERIFY_CODE_URI             = '/auth/verifycode.php';
  static const String LOGIN_URI                   = '/auth/login.php';
  static const String CHECK_EMAIL_URI             = '/forgetPassword/checkEmail.php';
  static const String FORGETPASS_VERIFY_CODE_URI  = '/forgetPassword/verifycode.php';
  static const String RESETPASS_URI               = '/forgetPassword/resetpassword.php';

  
  static const String UPLOAD_URL                  = '/uploads/';
  static const String PRODUCT_URI                 = '/api/v1/products/popular';
  static const String RECOMMENDED_PRODUCT_URI     = '/api/v1/products/recommended';
  static const String USER_INFO_URI               = '/api/v1/customer/info';
  static const String USER_ADDRESS                = 'user_address';
  static const String ADD_USER_ADDRESS            = '/api/v1/customer/address/add';
  static const String ADDRESS_LIST_URI            = '/api/v1/customer/address/list';
  /// Config
  static const String GEOCODE_URI                 = '/api/v1/config/geocode-api';
  static const String ZONE_URI                    = '/api/v1/config/get-zone-id';
  static const String SEARCH_LOCATION_URI         = '/api/v1/config/place-api-autocomplete';
  static const String PLACE_DETAILS_URI           = '/api/v1/config/place-api-details';
  /// Orders
  static const String PLACE_ORDER_URI             = '/api/v1/customer/order/place';
  static const String ORDER_LIST_URI              = '/api/v1/customer/order/list';
}
