import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../feature/addCustomer/view/add_customer_screen.dart';
import '../feature/register/view/register_screen.dart';
import '../screen/onboarding/onboardingmenu_screen.dart';
import '../feature/homeIndex/view/home_index.dart';
import '../feature/login/view/login_screen.dart';
import '../screen/onboarding/onboarding1_screen.dart';
import '../screen/not_found_screen.dart';
import '../screen/splash_screen.dart';

import '../feature/home/bloc/home_bloc/home_bloc.dart';

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
        duration: const Duration(milliseconds: 1200),
        curve: Curves.easeInOut,
        child: const OnBoardingMenuScreen(),
        childCurrent: const OnBoarding1Screen(),
        settings: settings
      );
      
      case LOGIN :
      return PageTransition(
        child: const LoginScreen(),
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 800),
        settings: settings
      );
      
      case LOGINFROMREGISTER :
      return PageTransition(
        type: PageTransitionType.leftToRightJoined,
        duration: const Duration(milliseconds: 800),
        child: const LoginScreen(),
        childCurrent: const RegisterScreen(),
        settings: settings
      );
      
      case REGISTER :
      return PageTransition(
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 800),
        child: const RegisterScreen(),
        settings: settings
      );
      
      case REGISTERFROMLOGIN :
      return PageTransition(
        type: PageTransitionType.rightToLeftJoined,
        duration: const Duration(milliseconds: 800),
        child: const RegisterScreen(),
        childCurrent: const LoginScreen(),
        settings: settings
      );
      
      case ADDCUSTOMERFROMLOGIN :
      return PageTransition(
        child: AddCustomerScreen(routeState: false),
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 800),
        settings: settings
      );

      case HOME :
      return PageTransition(
        child: const HomeIndex(),
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 800),
        settings: settings
      );

      case ADDCUSTOMERFROMHOME :
      return PageTransition(
        child: AddCustomerScreen(routeState: true, homebloc: settings.arguments as HomeBloc,),
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 800),
        settings: settings
      );

      default :
      return PageTransition(
        child: const NotFoundScreen(),
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 800),
        settings: settings
      );
    } 
  }
}