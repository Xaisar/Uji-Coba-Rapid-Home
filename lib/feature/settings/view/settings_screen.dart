import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../route/routes_name.dart';
import '../../../theme/pallet_color.dart';
import '../../authentication/bloc/authentication_bloc.dart';
import '../../editProfile/view/edit_profile_screen.dart';
import '../../homeIndex/bloc/user_bloc.dart';
import '../../homeIndex/model/user_model.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.user});
  final User user;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    final userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
        backgroundColor: C3,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75),
          child: AppBar(
            backgroundColor: C1,
            centerTitle: true,
            title: Text(
              "Setting",
              style: TextStyle(
                fontSize: 18, color: C3, fontWeight: FontWeight.bold),
            )
          ),
        ),
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * 0.031,
              horizontal: MediaQuery.sizeOf(context).width * 0.0555),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //pusat akun
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Pusat akun",
                      style: TextStyle(
                          color: C6, fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  //edit profile
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
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 10),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFB3B3B3), width: 2.5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/icons/avatar_icon.png",
                                width: 25,
                                height: 25,
                              ),
                              Text(
                                " Edit profile",
                                style: TextStyle(
                                    color: C6,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFB3B3B3),
                            size: 23,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  //ganti passsword
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CHANGEPASSWORD, arguments: widget.user);
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color(0xFFB3B3B3), width: 2.5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/icons/change_password_icon.png",
                                width: 25,
                                height: 25,
                              ),
                              Text(
                                " Ubah kata sandi",
                                style: TextStyle(
                                    color: C6,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFB3B3B3),
                            size: 23,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  //delete akun
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, DELETEACCOUNT, arguments: widget.user);
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 10),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                color: Color(0xFFB3B3B3), width: 2.5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/icons/delete_account_icon.png",
                                width: 25,
                                height: 25,
                              ),
                              Text(
                                " Hapus akun saya",
                                style: TextStyle(
                                    color: C6,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFB3B3B3),
                            size: 23,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.031),
              //info dan dukungan
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Info dan dukungan",
                      style: TextStyle(
                          color: C6, fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  //kebijakan privasi
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color(0xFFB3B3B3), width: 2.5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Kebijakan privasi",
                                style: TextStyle(
                                    color: C6,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFB3B3B3),
                            size: 23,
                          )
                        ],
                      ),
                    ),
                  ),
                  //ketentuan pengguna
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color(0xFFB3B3B3), width: 2.5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Ketentuan pengguna",
                                style: TextStyle(
                                    color: C6,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFB3B3B3),
                            size: 23,
                          )
                        ],
                      ),
                    ),
                  ),
                  //pusat bantuan
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color(0xFFB3B3B3), width: 2.5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Pusat Bantuan",
                                style: TextStyle(
                                    color: C6,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFB3B3B3),
                            size: 23,
                          )
                        ],
                      ),
                    ),
                  ),
                  //kebijakan privasi
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color(0xFFB3B3B3), width: 2.5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "tentang kami",
                                style: TextStyle(
                                    color: C6,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFB3B3B3),
                            size: 23,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.031),

              BlocConsumer<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if(state is LogoutFailureState) {
                    showTopSnackBar(
                      Overlay.of(context), CustomSnackBar.error(message: state.error));
                  }
                  if(state is LogoutSuccessState) {
                    authenticationBloc.add(UnAuthenticationEvent());
                  }
                },
                builder: (context, state) {
                  if(state is LogoutProccesState) {
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: ElevatedButton(
                        onPressed: null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE11C1C),
                          padding: const EdgeInsetsDirectional.symmetric(
                            vertical: 8
                          )
                        ),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: C3,
                            ),
                          ),
                        )
                      ),
                    );
                  }
                  return SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: ElevatedButton(
                      onPressed: () {
                        authenticationBloc.add(IsLogoutEvent());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE11C1C),
                        padding: const EdgeInsetsDirectional.symmetric(
                          vertical: 8
                        )
                      ),
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          color: C3,
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                        ),
                      )
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
