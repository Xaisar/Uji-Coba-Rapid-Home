import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

import '../../../route/routes_name.dart';

import '../../billing/bloc/billing_bloc.dart';
import '../../billing/view/billing_screen.dart';
import '../../home/bloc/card_home_bloc/card_home_bloc.dart';
import '../../home/bloc/catalog_home_bloc/catalog_home_bloc.dart';
import '../../home/bloc/recommendation_home_bloc/recommendation_home_bloc.dart';
import '../../home/view/home_screen.dart';
import '../../authentication/bloc/authentication_bloc.dart';
import '../../../theme/pallet_color.dart';
import '../../notification/bloc/notification_bloc.dart';
import '../../notification/view/notification_screen.dart';
import '../../settings/view/settings_screen.dart';
import '../bloc/cubit/index_customer_cubit/index_customer_cubit.dart';
import '../bloc/user_bloc.dart';

class HomeIndex extends StatelessWidget {
  const HomeIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          elevation: 0,
          backgroundColor: C3,
          duration: const Duration(seconds: 2),
          content: Text(
            "Press again to leave",
            style: TextStyle(
              color: C1, fontSize: 12, fontWeight: FontWeight.w600
            ),
          )
        ),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => UserBloc()),
            BlocProvider(create: (context) => IndexCustomerCubit()),
            BlocProvider(create: (context) => CardHomeBloc()),
            BlocProvider(create: (context) => CatalogHomeBloc()),
            BlocProvider(create: (context) => RecommendationHomeBloc()),
            BlocProvider(create: (context) => BillingBloc()),
            BlocProvider(create: (context) => NotificationBloc())
          ],
          child: const HomeIndexView(),
        )
      )
    );
  }
}

class HomeIndexView extends StatefulWidget {
  const HomeIndexView({super.key});

  @override
  State<HomeIndexView> createState() => _HomeIndexViewState();
}

class _HomeIndexViewState extends State<HomeIndexView> {
  int indexPage = 0;

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(InitialUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    final cardHomeBloc = BlocProvider.of<CardHomeBloc>(context);
    final catalogHomeBloc = BlocProvider.of<CatalogHomeBloc>(context);
    final recommendationHomeBLoc = BlocProvider.of<RecommendationHomeBloc>(context);
    final billingBloc = BlocProvider.of<BillingBloc>(context);
    
    return MultiBlocListener(
      listeners: <BlocListener>[
        BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationUnAuthenticationState) {
              Navigator.pushReplacementNamed(context, LOGIN);
            }
          },
        ),
        BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if(state is InitialUserProccesState) {
              cardHomeBloc.add(InitialCardHome());
              catalogHomeBloc.add(InitialCatalogHome());
              recommendationHomeBLoc.add(InitialRecommendationHome());
              billingBloc.add(InitialBilling());
            }
            if (state is UserExpiredTokenState) {
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(message: state.message)
              );
              authenticationBloc.add(UnAuthenticationEvent());
            }
          },
        ),
        BlocListener<IndexCustomerCubit, int>(
          listener: (context, state) {
            cardHomeBloc.add(InitialCardHome());
            catalogHomeBloc.add(InitialCatalogHome());
            recommendationHomeBLoc.add(InitialRecommendationHome());
            billingBloc.add(InitialBilling());
          }, 
        )
      ],
      child: Scaffold(
        backgroundColor: C20,
        body: Stack(
          fit: StackFit.expand,
          children: [
            indexPage == 0
            ? Scaffold(
              backgroundColor: Colors.transparent,
              body: Image.asset(
                "assets/images/Image_Home_Background.png",
                width: MediaQuery.of(context).size.width,
              )
            )
            : const SizedBox(),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, stateUser) {
                if (stateUser is InitialUserSuccesState) {   
                  return BlocBuilder<IndexCustomerCubit, int>(
                    builder: (context, stateIndexUser) {
                      List<Widget> bodyHome = <Widget>[
                        HomeScreen(
                          key: const Key("Home_Screen"),
                          user: stateUser.user,
                        ),
                      BillingScreen(
                        key: const Key("Billing_Screen"),
                        customer: stateUser.user.customers[stateIndexUser],
                      ),
                      NotificationScreen(
                        user: stateUser.user,
                      ),
                      SettingsScreen(
                        key: const Key("Settings"),
                        user: stateUser.user,
                      ),
                    ];
                      return bodyHome[indexPage];
                    },
                  );
                }
                return const Center();
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexPage,
          onTap: (value) {
            setState(() {
              indexPage = value;
            });
          },
          elevation: 0,
          backgroundColor: C1,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14,
          unselectedFontSize: 13,
          selectedLabelStyle: TextStyle(color: C3, fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(color: C3, fontWeight: FontWeight.w400),
          items: const [
            BottomNavigationBarItem(icon: SizedBox(), label: "Home"),
            BottomNavigationBarItem(icon: SizedBox(), label: "Billing"),
            BottomNavigationBarItem(icon: SizedBox(), label: "Notification"),
            BottomNavigationBarItem(icon: SizedBox(), label: "Setting"),
          ],
        ),
      )
    );
  }
}