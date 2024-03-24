import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication/bloc/authentication_bloc.dart';
import '../../../route/routes_name.dart';
import '../../../theme/pallet_color.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'homePage',
          style: TextStyle(
            color: Colors.white
          )
        ),
        actions: [
          IconButton(
            onPressed: (){
              context.read<AuthenticationBloc>().add(IsLogoutEvent());
              Navigator.pushReplacementNamed(context, LOGIN);
            },
            icon: Icon(
              Icons.logout,
              color: C3
            )
          )
        ],
      ),
      body: Center(
        child: Text(
          "Ini adalah HomePage",
          style: TextStyle(
            fontSize: 20,
            color: C10
          ),
        )
      )
    );
  }
}