import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../authentication/bloc/authentication_bloc.dart';
import '../bloc/card_home_bloc/card_home_bloc.dart';
import '../bloc/catalog_home_bloc/catalog_home_bloc.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../bloc/cubit/index_recommendation_bloc/index_recommendation_cubit.dart';
import '../bloc/cubit/index_customer/index_customer_cubit.dart';

import '../../../theme/pallet_color.dart';
import '../bloc/recommendation_home_bloc/recommendation_home_bloc.dart';
import '../model/user_model.dart';
import 'home_section/bottom_sheet_customer.dart';
import 'home_section/card_section_view.dart';
import 'home_section/paket_section_view.dart';
import 'home_section/recommendation_section_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('///////////////////////screen');
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => HomeBloc()),
      BlocProvider(create: (context) => IndexRecommendationCubit()),
      BlocProvider(create: (context) => IndexCustomerCubit()),
      BlocProvider(create: (context) => CardHomeBloc()),
      BlocProvider(create: (context) => CatalogHomeBloc()),
      BlocProvider(create: (context) => RecommendationHomeBloc()),
    ], child: const HomeScreenView());
  }
}

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  User user = User(id: "", globalId: "", name: "", email: "", customers: []);
  int indexCustomer = 0;

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(InitialHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('///////////////////////view');
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final indexCustomerCubit = BlocProvider.of<IndexCustomerCubit>(context);

    return MultiBlocListener(
        listeners: [
          BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
            if (state is InitialHomeSuccesState) {
              user = state.user;
              indexCustomerCubit.changeState(state.indexCustomer);
            }
            if (state is InitialHomeFailureState) {
              showTopSnackBar(Overlay.of(context),
                CustomSnackBar.error(message: state.error));
            }
            if (state is OnRefreshHomeSuccesState) {
              user = state.user;
              indexCustomerCubit.changeState(state.indexCustomer);
            }
            if (state is OnRefreshHomeFailureState) {
              showTopSnackBar(Overlay.of(context),
                CustomSnackBar.error(message: state.error));
            }
          }),
          BlocListener<IndexCustomerCubit, IndexCustomerState>(
            listener: (context, state) {
              if (state is IndexCustomerChangeState) {
                indexCustomer = state.indexCustomer;
              }
            },
          ),
        ],
        child: Stack(
          fit: StackFit.expand,
          children: [
            //background
            Scaffold(
                backgroundColor: Colors.transparent,
                body: Image.asset(
                  "assets/images/Image_Home_Background.png",
                  width: MediaQuery.of(context).size.width,
                )
              ),
            //FrontView
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                debugPrint(state.toString());
                if(state is InitialHomeSuccesState || 
                  state is OnRefreshHomeSuccesState || 
                  state is OnRefreshHomeFailureState ||
                  state is OnRefreshHomeProccesState
                  ){
                  return BlocBuilder<IndexCustomerCubit, IndexCustomerState>(
                  builder: (context, state) {
                    debugPrint("build ulang");
                    return Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        title: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                                radius: MediaQuery.sizeOf(context).width * 0.083 / 2,
                                backgroundColor: C3,
                                child: user.avatar != null
                                    ? Image.network(
                                        user.avatar!,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Icon(Icons.person,
                                              color: C6);
                                        },
                                      )
                                    : Icon(
                                        Icons.person,
                                        color: C6,
                                      )),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.44,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AutoSizeText(
                                    user.customers[indexCustomer].name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    minFontSize: 10,
                                    style: TextStyle(
                                        color: C3,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  AutoSizeText(
                                    user.customers[indexCustomer].email,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    minFontSize: 10,
                                    style: TextStyle(
                                        color: C3,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20))),
                                      context: context,
                                      builder: (context) =>
                                          BottomSheetCustomerSetting(
                                            indexCustomerCubit:
                                                indexCustomerCubit,
                                            homeBloc: homeBloc,
                                            indexCustomer: indexCustomer,
                                            user: user,
                                          ));
                                },
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                icon: Icon(
                                  Icons.add,
                                  color: C3,
                                ))
                          ],
                        ),
                        actions: [
                          Padding(
                            padding: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.width * 0.03),
                            child: IconButton(
                                onPressed: () {},
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                icon: Icon(
                                  Icons.notifications_rounded,
                                  color: C3,
                                )),
                          )
                        ],
                      ),
                      body: RefreshIndicator.adaptive(
                        color: C3,
                        onRefresh: () async {
                          homeBloc.add(OnRefreshHomeEvent());
                        },
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.04,
                              bottom: MediaQuery.of(context).size.height * 0.025),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  //card section
                                  CardHomeWidget(customer: user.customers[indexCustomer]),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.015,
                                  ),
                                  //paket untuk anda section
                                  Container(
                                    color: C20,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height * 0.015 / 3,
                                        ),
                                        PaketHomeWidget(customer: user.customers[indexCustomer]),
                                      ],
                                    ),
                                  ),
                                  //Recommendation section
                                  Container(
                                    color: C20,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height * 0.015,
                                        ),
                                        const RecommedationHomeWidget(),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ),
                        ),
                      ),
                    );
                  },
                );
                } 
                if(state is InitialHomeFailureState){
                  return const Center();
                }
                return Center(child: CircularProgressIndicator(color: C1));
              },
            )
          ],
        ));
  }
}
