import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../feature/addCustomer/view/add_customer_screen.dart';
import '../feature/billing/model/billing_model.dart';
import '../feature/changePassword/view/change_password_screen.dart';
import '../feature/deleteAccount/view/confirmation_delete_account_screen.dart';
import '../feature/deleteAccount/view/delete_account_screen.dart';
import '../feature/detailBilling/view/detail_billing_screen.dart';
import '../feature/detailCatalog/view/detail_catalog_screen.dart';
import '../feature/forgotPassword/view/forgot_password_screen.dart';
import '../feature/home/model/catalog_model.dart';
import '../feature/homeIndex/model/user_model.dart';
import '../feature/register/view/register_screen.dart';
import '../screen/onboarding/onboardingmenu_screen.dart';
import '../feature/homeIndex/view/home_index.dart';
import '../feature/login/view/login_screen.dart';
import '../screen/onboarding/onboarding1_screen.dart';
import '../screen/not_found_screen.dart';
import '../screen/splash_screen.dart';

import './routes_name.dart';

class MyRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name){
      
      case SPLASHSCREEN :
      return PageTransition(
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 800),
        child: const SplashScreenView(),
        settings: settings
      );
      
      case ONBOARDING :
      return PageTransition(
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 800),
        reverseDuration: const Duration(milliseconds: 800),
        child: const OnBoarding1Screen(),
        settings: settings
      );
      
      case ONBOARDINGMENU :
      return PageTransition(
        type: PageTransitionType.leftToRightPop,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
        child: const OnBoardingMenuScreen(),
        childCurrent: const OnBoarding1Screen(),
        settings: settings
      );
      
      case LOGIN :
      return PageTransition(
        child: const LoginScreen(),
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 600),
        settings: settings
      );

      case FORGOTPASSWORD :
      return MaterialPageRoute(
        builder: (context) => const ForgotPasswordScreen(),
        settings: settings
      );
      
      case LOGINFROMREGISTER :
      return PageTransition(
        type: PageTransitionType.leftToRightJoined,
        duration: const Duration(milliseconds: 600),
        child: const LoginScreen(),
        childCurrent: const RegisterScreen(),
        settings: settings
      );
      
      case REGISTER :
      return PageTransition(
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 600),
        child: const RegisterScreen(),
        settings: settings
      );
      
      case REGISTERFROMLOGIN :
      return PageTransition(
        type: PageTransitionType.rightToLeftJoined,
        duration: const Duration(milliseconds: 600),
        child: const RegisterScreen(),
        childCurrent: const LoginScreen(),
        settings: settings
      );
      
      case ADDCUSTOMERFROMLOGIN :
      return MaterialPageRoute(
        builder: (context) => const AddCustomerScreen(routeState: false),
        settings: settings
      );

      case HOME :
      return MaterialPageRoute(
        builder: (context) => const HomeIndex(),
        settings: settings
      );

      case ADDCUSTOMERFROMHOME :
      return MaterialPageRoute(
        builder: (context) => const AddCustomerScreen(routeState: true),
        settings: settings
      );

      case DETAILCATALOGHOME :
      return MaterialPageRoute(
        builder: (context) => DetailCatalogScreen(catalog: settings.arguments as Catalog),
        settings: settings
      );

      case DETAILBILLING :
      return MaterialPageRoute(
        builder: (context) => DetailBillingScreen(billingModel: settings.arguments as BillingModel),
        settings: settings
      );
      
      case CHANGEPASSWORD :
      return MaterialPageRoute(
        builder: (context) => ChangePasswordScreen(user: settings.arguments as User),
        settings: settings
      );

      case DELETEACCOUNT :
      return MaterialPageRoute(
        builder: (context) => DeleteAccountScreen(user: settings.arguments as User),
        settings: settings
      );

      case CONFIRMATIONDELETEACCOUNT :
      return MaterialPageRoute(
        builder: (context) => ConfirmationDeleteAccountScreen(user: settings.arguments as User),
        settings: settings
      );

      default :
      return PageTransition(
        child: const NotFoundScreen(),
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 600),
        settings: settings
      );
    } 
  }
}