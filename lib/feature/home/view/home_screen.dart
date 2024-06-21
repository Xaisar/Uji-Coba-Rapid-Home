import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../editProfile/view/edit_profile_screen.dart';
import '../../homeIndex/bloc/cubit/index_customer_cubit/index_customer_cubit.dart';
import '../../homeIndex/bloc/user_bloc.dart';
import '../bloc/cubit/index_recommendation_bloc/index_recommendation_cubit.dart';

import '../../../theme/pallet_color.dart';
import '../../homeIndex/model/user_model.dart';
import 'home_section/bottom_sheet_customer.dart';
import 'home_section/card_section_view.dart';
import 'home_section/paket_section_view.dart';
import 'home_section/recommendation_section_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.user});
  final User user;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    final indexCustomerCubit = BlocProvider.of<IndexCustomerCubit>(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: userBloc,
                      child: EditProfileScreen(user: widget.user),
                    ),
                  )
                );
              },
              child: CircleAvatar(
                radius: MediaQuery.sizeOf(context).width * 0.083 / 2,
                backgroundColor: C3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular( MediaQuery.sizeOf(context).width * 0.083 /2),
                  child: widget.user.avatar != null
                  ? Image.network(
                    widget.user.avatar!,
                    fit: BoxFit.cover,
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    errorBuilder:(context, error, stackTrace) {
                      return Icon(
                        Icons.person,
                        color: C6
                      );
                    },
                  )
                  : Icon(
                    Icons.person,
                    color: C6,
                  ),
                ) 
              ),
            ),
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
                    widget.user.customers[indexCustomerCubit.state].name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 10,
                    style: TextStyle(
                      color: C3,
                      fontSize: 12,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AutoSizeText(
                    widget.user.customers[indexCustomerCubit.state].email,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 10,
                    style: TextStyle(
                      color: C3,
                      fontSize: 12,
                      fontWeight: FontWeight.w400
                    ),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20)
                    )
                  ),
                  context: context,
                  builder: (context) => BottomSheetCustomerSetting(
                    indexCustomerCubit: indexCustomerCubit,
                    indexCustomer: indexCustomerCubit.state,
                    user: widget.user,
                  )
                );
              },
              iconSize: MediaQuery.of(context).size.width * 0.05,
              icon: Icon(
                Icons.add,
                color: C3,
              )
            )
          ],
        ),
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.only(
        //       right:MediaQuery.of(context).size.width * 0.03
        //     ),
        //     child: IconButton(
        //       onPressed: () {},
        //       iconSize: MediaQuery.of(context).size.width * 0.05,
        //       icon: Icon(
        //         Icons.notifications_rounded,
        //         color: C3,
        //       )
        //     ),
        //   )
        // ],
      ),
      body: RefreshIndicator(
        color: C3,
        onRefresh: () async {
          context.read<UserBloc>().add(InitialUserEvent());
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.04,
            bottom: MediaQuery.of(context).size.height * 0.025
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //card section
                CardHomeWidget(
                  customer: widget.user.customers[indexCustomerCubit.state]
                ),
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
                      PaketHomeWidget(
                        customer: widget.user.customers[indexCustomerCubit.state]
                      ),
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
                      BlocProvider(
                        create: (context) => IndexRecommendationCubit(),
                        child: const RecommedationHomeWidget(),
                      ),
                    ],
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}
