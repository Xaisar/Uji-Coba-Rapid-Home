import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './feature/authentication/bloc/authentication_bloc.dart';

import './route/routes_page.dart';
import './route/routes_name.dart';

import './theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: const BuildApp(),
    );
  }
}

class BuildApp extends StatelessWidget {
  const BuildApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rapid Home' ,
      debugShowCheckedModeBanner: false,
      theme: theme,
      // home: const AddCustomerScreen(),
      onGenerateRoute: MyRoute.generateRoute,
      initialRoute: SPLASHSCREEN,
    );
  }
}


