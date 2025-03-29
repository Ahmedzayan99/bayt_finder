class Endpoints {
  Endpoints._();

  static const String baseUrl = "https://baytfinder.nahrdev.com/api/";
  //static const String baseUrl = "https://apps.meetmighty.com/mighty-realestate/api/";

  // AUTH
  static const String login = "social-otp-login";
  static const String  deleteUserAccount = "delete-user-account";
  static const String registerUser = "register";
  static const String getSetting = "get-setting";
  static const String propertyMap = "property-map";
  static const String getUserDetail = "user-detail";
  static const String updateProfile = "update-profile";
  static const String dashboardList= "dashboard-list";
  static const String getCategory= "category-list";
  static const String getCity= "city";
  static const String filterConfigurationPrice= "filter-configuration-price";
  static const String updateUserStatus= "update-user-status";
  static const String filterProperty= "filter-property-list";
  static const String favourite= "get-favourite-property";
  static const String addFavourite= "set-favourite-property";
  static const String myProperty= "my-property";
  static const String addProperty= "property-save";
  static const String propertyUpdate= "property-update/";
  static const String propertyDelete= "property-delete/";
  static const String searchLocation= "search-location";
  static const String propertyDetail= "property-detail";
  static const String getAgencies = "user-detail";
  static const String articleList = "article-list";
  static const String notificationList = "notification-list";
  static const String notificationDetail = "notification-detail";
  static const String googlePlacePhoto = "https://maps.googleapis.com/maps/api/place/details/json";
  static const String googlePlaceId = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json";
 // https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=القاهرة&inputtype=textquery&fields=place_id&key=YOUR_API_KEY
  static const String googleKay = "AIzaSyC4gTSwhUFShnUEBpmB3UPDuPJEB8N0ru4";

}
