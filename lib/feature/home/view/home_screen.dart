import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../authentication/bloc/authentication_bloc.dart';
import '../../../route/routes_name.dart';
import '../../../theme/pallet_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if(state is AuthenticationUnAuthenticationState){
          Navigator.pushReplacementNamed(context, LOGIN);
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title:
                const Text('homePage', style: TextStyle(color: Colors.white)),
            actions: [
              BlocConsumer<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state is LogoutFailureState) {
                    showTopSnackBar(Overlay.of(context),
                        CustomSnackBar.error(message: state.error));
                  }
                  if (state is LogoutSuccessState) {
                    context
                      .read<AuthenticationBloc>()
                      .add(UnAuthenticationEvent());
                  }
                },
                builder: (context, state) {
                  return IconButton(
                      onPressed: () {
                        context.read<AuthenticationBloc>().add(IsLogoutEvent());
                      },
                      icon: Icon(Icons.logout, color: C3));
                },
              )
            ],
          ),
          body: Center(
              child: Text(
            "Ini adalah HomePage",
            style: TextStyle(fontSize: 20, color: C10),
          ))),
    );
  }
}
