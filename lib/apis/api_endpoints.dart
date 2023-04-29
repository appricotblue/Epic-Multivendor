class ApiEndPoints {
  static String baseUrl =
      "http://phpstack-732301-3293226.cloudwaysapps.com/api/";
  static String imageBaseURL =
      "https://phpstack-732301-3293226.cloudwaysapps.com/image_uploads/";

  /// login
  static String login = '${baseUrl}login';
  static String settings = '${baseUrl}settings';
   static String updateDeviceToken = '${baseUrl}user-update/device-token';

  /// HOME
  ///
  ///
  static String homeShopData = '${baseUrl}home-shop-data';
  static String homeServiceData = '${baseUrl}home-service-data';
  static String homeSearchShopData = '${baseUrl}search/home-shop-data';
  static String homeSearchServiceData = '${baseUrl}search/home-service-data';
  static String searchShopData = '${baseUrl}search/shop-data';
  static String searchServiceData = '${baseUrl}search/service-data';
  static String searchProductData = '${baseUrl}search/shop-product';
  /// SERVICES
  ///
  ///

  static String serviceCategory = '${baseUrl}category-services';
  static String brandServices = '${baseUrl}brand-services';
  static String serviceDetails = '${baseUrl}service-details';

  /// ADDRESS
  ///
  ///
  static String addAddress = '${baseUrl}add/user-address';
  static String getAddress = '${baseUrl}get/user-address';
  static String deleteAddress = '${baseUrl}delete/user-address';

  /// SERVICE BOOKING
///
///
  static String serviceBooking = '${baseUrl}service-bookings';


  /// shop
  static String shopCategory = '${baseUrl}category-shops';
  static String shopProduct = '${baseUrl}shop/product';
  static String shopDetails = '${baseUrl}product-details';
  ///
  static String categoryProduct = '${baseUrl}category/product';

  /// cart
  static String addToCart = '${baseUrl}add/cart-data';
  static String getCart = '${baseUrl}get/cart-data';
   static String removeCart = '${baseUrl}remove/cart-data';

  /// Wish List
  static String addToWishList = '${baseUrl}add-to/wish-list';
  static String removeToWishList = '${baseUrl}remove/wish-list/data';

  /// place order
  static String placeOrder = '${baseUrl}place/order';
  static String buyNow = '${baseUrl}buy/now';

  /// Qwqer calculation
  static String deliveryCalcualtion = 'https://stage-api.qwqer.in/client/price-calculate/';

  /// profile
  static String myProfile = '${baseUrl}profile-data';
  static String updateProfile = '${baseUrl}update/profile-data';


  /// wishlist
  static String productWishList = '${baseUrl}get/wish-list/data';
  static String serviceWishList = '${baseUrl}get/service/wish-list/data';
  static String productAddToWishList = '${baseUrl}add-to/wish-list';
  static String productRemovedFromWishList = '${baseUrl}remove/wish-list/data';
  static String serviceAddToWishList = '${baseUrl}service/add-to/wish-list';
  static String serviceRemovedFromWishList ='${baseUrl}remove/service/wish-list/data';

  /// myOrder
  static String myOrderList = '${baseUrl}order/list';
  static String myOrderListDetails = '${baseUrl}order/details';
  static String myserviceDetails = '${baseUrl}service-details';
  static String myServiceList = '${baseUrl}my-service-bookings';
  static String serviceBookingDetails = '${baseUrl}service-bookings/details';

  /// prime
  static String premium = '${baseUrl}update/premium';

  static String productSubCategory = '${baseUrl}get-all/sub-category';

}
