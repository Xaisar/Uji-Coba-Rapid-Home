import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../route/routes_name.dart';

import '../../home/view/home_screen.dart';
import '../../../screen/not_found_screen.dart';
import '../../authentication/bloc/authentication_bloc.dart';
import '../../../theme/pallet_color.dart';

class HomeIndex extends StatefulWidget {
  const HomeIndex({super.key});

  @override
  State<HomeIndex> createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndex> {
  int indexBottomNavBar = 0;

  List<Widget> bodyHome = [
    const HomeScreen(),
    const NotFoundScreen(),
    const NotFoundScreen(),
    const LogoutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if(state is AuthenticationUnAuthenticationState){
          Navigator.pushReplacementNamed(context, LOGIN);
        }
      },
      child: Scaffold(
        backgroundColor: C20,
        body: bodyHome[indexBottomNavBar],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexBottomNavBar,
          onTap: (value) {
            setState(() {
              indexBottomNavBar = value;                
            });
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
            BottomNavigationBarItem(
              icon: SizedBox(),
              label: "Home"
            ),
            BottomNavigationBarItem(
              icon: SizedBox(),
              label: "Billing"
            ),
            BottomNavigationBarItem(
              icon: SizedBox(),
              label: "Notification"
            ),
            BottomNavigationBarItem(
              icon: SizedBox(),
              label: "Setting"
            ),
          ],
        ),
      )
    );
  }
}

class LogoutScreen extends StatelessWidget{
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    return BlocListener<AuthenticationBloc, AuthenticationState>(
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[600]
              ),
              onPressed: (){
                authenticationBloc.add(IsLogoutEvent());
              },
              child: Text(
                "Logout",
                style: TextStyle(
                  color: C3,
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
              )),
          ),
        )
      ),
    );

  }

}
