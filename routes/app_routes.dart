import 'package:store_app/models/order_model.dart';
import 'package:store_app/utils/middleware/middleware.dart';
import 'package:store_app/view/layout/layout.dart';
import 'package:store_app/view/pages/adress/adress_page.dart';
import 'package:store_app/view/pages/adress/pick_address_map.dart';
import 'package:store_app/view/pages/auth/forget_pass/forget_password.dart';
import 'package:store_app/view/pages/auth/forget_pass/reset_password.dart';
import 'package:store_app/view/pages/auth/forget_pass/verify_code.dart';
import 'package:store_app/view/pages/auth/login_page.dart';
import 'package:store_app/view/pages/auth/signup_page.dart';
import 'package:store_app/view/pages/auth/verify_code_signup.dart';
import 'package:store_app/view/pages/cart/cart_page.dart';
import 'package:store_app/view/pages/category_items_page/category_items_page.dart';
import 'package:store_app/view/pages/chat_page/chat_page.dart';
import 'package:store_app/view/pages/edit_profile_page/edit_profile.dart';
import 'package:store_app/view/pages/item_detail/item_detail.dart';
import 'package:store_app/view/pages/notification_page/notification_page.dart';
import 'package:store_app/view/pages/onboarding/onboarding.dart';
import 'package:store_app/view/pages/payment/payment.dart';
import 'package:store_app/view/pages/payment/order_success.dart';
import 'package:store_app/view/pages/popular_items_page/popular_items_page.dart';
import 'package:store_app/view/pages/search_page/search_page.dart';
import 'package:store_app/view/pages/special_offers_page/special_offers_page.dart';
import 'package:store_app/view/pages/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'package:store_app/view/pages/wishlist_page/wishlist_page.dart';

class AppRoute {
  static const String address             = "/address";
  static const String cart                = "/cart";
  static const String categoryItems       = "/category-items";
  static const String chatPage            = "/chat";
  static const String editProfilePage     = "/edit-profile";
  static const String forgetPassword      = "/forget_password";
  static const String initial             = "/layout";
  static const String itemDetail          = "/item-detail";
  static const String login               = "/";
  static const String notificationPage    = "/notification";
  static const String onboarding          = "/onboarding";
  static const String orderSuccess        = "/order-success";
  static const String popularItems        = "/popular-items";
  static const String payment             = "/payment";
  static const String pickAddressMap      = "/pick-address-map";
  static const String recommendedProduct  = "/recommended-product";
  static const String resetPassPage       = "/reset-password";
  static const String splashPage          = "/splash-page";
  static const String specialOffers       = "/special-offers";
  static const String searchPage          = "/search";
  static const String signupVerifyCode    = "/signup_verifycode";
  static const String signup              = "/signup";
  static const String verifyCode          = "/pass_verifycode";
  static const String wishListPage        = "/wishlist";

  static String getSplashPage() => splashPage;
  static String getOnboarding() => onboarding;
  static String getInitial() => initial;
  static String getItemDetail(int pageId, String page) =>'$itemDetail?pageId=$pageId&page=$page';
  static String getRecommendedProduct(int pageId, String page) =>'$recommendedProduct?pageId=$pageId&page=$page';
  static String getCart() => cart;
  static String getSpecialOffers() => specialOffers;
  static String getPopularItems() => popularItems;
  static String getCategoryItems() => categoryItems;
  static String getSearchPage() => searchPage;
  static String getChatPage() => chatPage;
  static String getWishListPage() => wishListPage;
  static String getEditProfilePage() => editProfilePage;
  static String getNotificationPage() => notificationPage;
  static String getResetPassVerifyCode(String email) => '$verifyCode?email=$email';
  static String getResetPassPage(String email) => '$resetPassPage?email=$email';
  static String getForgetPassPage() => forgetPassword;
  static String getSignupVerifyCode(String email) => '$signupVerifyCode?email=$email';
  static String getLogin() => login;
  static String getSignUp() => signup;
  static String getAddressPage() => address;
  static String getPickAddressPage() => pickAddressMap;
  static String getOrderSuccessRoute(String orderID, String status) => '$orderSuccess?id=$orderID&status=$status';
  static String getPayment(String id, int userID) => '$payment?id=$id&userID=$userID';

  static List<GetPage> routes = [
    GetPage(
      name: splashPage,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn),

    GetPage(
      name: onboarding,
      page: () => const Onboarding(),
      middlewares: [AppMiddleware(sharedPref: Get.find())]),

    GetPage(
      name: login,
      page: () => const LoginPage(),
      transition: Transition.fadeIn),

    GetPage(
      name: signup,
      page: () => const SignUpPage(),
      transition: Transition.fadeIn),

    GetPage(
      name: initial,
      page: () => const Layout(),
      transition: Transition.fadeIn),
    
    GetPage(
      name: forgetPassword,
      page: () => const ForgetPassword(),
      transition: Transition.fadeIn),
    
    GetPage(
      name: verifyCode,
      page: () => VerifyCode(email: Get.parameters['email']!),
      transition: Transition.fadeIn),
    
    GetPage(
      name: resetPassPage,
      page: () => ResetPassword(email: Get.parameters['email']!),
      transition: Transition.fadeIn),
    
    GetPage(
      name: signupVerifyCode,
      page: () => SignupVerifyCode(email: Get.parameters['email']!),
      transition: Transition.fadeIn),
    
    GetPage(
      name: chatPage,
      page: () => const ChatPage(),
      transition: Transition.fadeIn),
    
    GetPage(
      name: notificationPage,
      page: () => const NotificationPage(),
      transition: Transition.fadeIn),
    
    GetPage(
      name: wishListPage,
      page: () => const WishlistPagePage(),
      transition: Transition.fadeIn),
    
    GetPage(
      name: specialOffers,
      page: () => const SpecialOffersPage(),
      transition: Transition.fadeIn),
    
    GetPage(
      name: editProfilePage,
      page: () => const EditProfile(),
      transition: Transition.fadeIn),
    
    GetPage(
      name: searchPage,
      page: () => const SearchPage(),
      transition: Transition.fadeIn),

    GetPage(
      name: popularItems,
      page: () => const PopularItemsPage(),
      transition: Transition.fadeIn),

    GetPage(
      name: categoryItems,
      page: () => const CategoryItemsPage(),
      transition: Transition.fadeIn),

    GetPage(
      name: cart,
      page: () { return const CartPage();},
      transition: Transition.fadeIn),

    GetPage(
      name: address,
      page: () => const AddressPage(),
      transition: Transition.fadeIn),
    
    GetPage(
      name: orderSuccess, page: () => OrderSuccess(
      orderID: Get.parameters['id']!,
      status: Get.parameters['status'].toString().contains('success')?1:0)),

    GetPage(
      name: payment, page: () => PaymentPage(orderModel: OrderModel(
      id: int.parse(Get.parameters['id']!),
      userId: int.parse(Get.parameters['userID']!)))),

    GetPage(
      name: pickAddressMap,
      page: () { /// Get.arguments to pass everything
        PickAddressMap pickAddress = Get.arguments;
        return pickAddress;}),

    GetPage(
      name: itemDetail,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return ItemDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn),
  ];
}
