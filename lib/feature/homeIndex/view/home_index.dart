import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

import '../../../route/routes_name.dart';

import '../bloc/cubit/index_home_cubit.dart';
import '../../billing/view/billing_screen.dart';
import '../../home/view/home_screen.dart';
import '../../../screen/not_found_screen.dart';
import '../../authentication/bloc/authentication_bloc.dart';
import '../../../theme/pallet_color.dart';

class HomeIndex extends StatelessWidget{
  const HomeIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexHomeCubit(),
      child: Scaffold(
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(
            elevation: 0,
            backgroundColor: C3,
            duration: const Duration(seconds: 3),
            content: Text(
              "Press again to leave",
              style: TextStyle(
                color: C1,
                fontSize: 12,
                fontWeight: FontWeight.w600
              ),
            )
          ),
          child: const HomeIndexView()
        )
      ),
    );
  }
}

class HomeIndexView extends StatefulWidget {
  const HomeIndexView({super.key});

  @override
  State<HomeIndexView> createState() => _HomeIndexViewState();
}

class _HomeIndexViewState extends State<HomeIndexView> {
  List<Widget> bodyHome = [
    const HomeScreen(),
    const BillingScreen(),
    const NotFoundScreen(),
    const LogoutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final homeIndexCubit = BlocProvider.of<IndexHomeCubit>(context);

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationUnAuthenticationState) {
          Navigator.pushReplacementNamed(context, LOGIN);
        }
      }, 
      child: BlocBuilder<IndexHomeCubit, int>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: C20,
            body: bodyHome[state],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state,
              onTap: (value) {
                homeIndexCubit.onChangeIndex(value);
              },
              elevation: 0,
              backgroundColor: C1,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 14,
              unselectedFontSize: 13,
              selectedLabelStyle: TextStyle(
                color: C3, 
                fontWeight: FontWeight.bold
              ),
              unselectedLabelStyle: TextStyle(
                color: C3, 
                fontWeight: FontWeight.w400
              ),
              items: const [
                BottomNavigationBarItem(icon: SizedBox(), label: "Home"),
                BottomNavigationBarItem(icon: SizedBox(), label: "Billing"),
                BottomNavigationBarItem(icon: SizedBox(), label: "Notification"),
                BottomNavigationBarItem(icon: SizedBox(), label: "Setting"),
              ],
            ),
          );
        },
      )
    );
  }
}

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is LogoutFailureState) {
          showTopSnackBar(
            Overlay.of(context), CustomSnackBar.error(message: state.error));
        }
        if (state is LogoutSuccessState) {
          context.read<AuthenticationBloc>().add(UnAuthenticationEvent());
        }
      },
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[600]),
                  onPressed: () {
                    authenticationBloc.add(IsLogoutEvent());
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        color: C3, fontSize: 20, fontWeight: FontWeight.w600),
                  )),
            ),
          )),
    );
  }
}
