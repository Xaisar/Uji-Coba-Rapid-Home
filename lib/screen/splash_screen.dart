import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../route/routes_name.dart';

import '../feature/authentication/bloc/authentication_bloc.dart';
import '../theme/pallet_color.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) 
      => context.read<AuthenticationBloc>().add(InitialApplicationEvent())
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) { 
        if(state is AuthenticationIsFirstState){
          Navigator.of(context).pushReplacementNamed(ONBOARDING);
        } else if (state is AuthenticationUnAuthenticationState){
          Navigator.of(context).pushReplacementNamed(LOGIN);
        } else if (state is AuthenticationAuthenticationState){
          Navigator.of(context).pushReplacementNamed(HOME);
        }
      },
      child: Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [C1, const Color(0xFF003D93)])),
        child: Image.asset(
          "assets/logos/Full_Logo.png",
          width: MediaQuery.of(context).size.width * 0.7,
        ),
      )),
    );
  }
}
