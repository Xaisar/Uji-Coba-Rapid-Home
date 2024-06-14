import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../theme/pallet_color.dart';
import '../../homeIndex/model/user_model.dart';
import '../bloc/change_password_bloc.dart';
import '../model/change_password_model.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordBloc(),
      child: ChangePasswordView(user: user),
    );
  }
}

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key, required this.user});
  final User user;

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  TextEditingController passwordBaru = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();

  bool visibilityPasswordBaru = true;
  bool visibilityPasswordConfirm = true;

  @override
  Widget build(BuildContext context) {
    final changePasswordBloc = BlocProvider.of<ChangePasswordBloc>(context);

    return Scaffold(
      backgroundColor: C3,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          backgroundColor: C1,
          centerTitle: true,
          title: Text(
            "Ubah Kata Sandi",
            style: TextStyle(
              fontSize: 18,
              color: C3, 
              fontWeight: FontWeight.bold
            ),
          )
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.031,
          left: MediaQuery.sizeOf(context).width * 0.0555,
          right: MediaQuery.sizeOf(context).width * 0.0555,
          bottom: MediaQuery.sizeOf(context).height * 0.0248,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // //kata sandi lama
                // Column(
                //   mainAxisSize: MainAxisSize.min,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     const Align(
                //       alignment: Alignment.topLeft,
                //       child: Text(
                //         "Kata Sandi Lama",
                //         style: TextStyle(
                //           color: Color(0xFF374151),
                //           fontSize: 14,
                //           fontWeight: FontWeight.w600),
                //       )
                //     ),
                //     const SizedBox(height: 10),
                //     TextField(
                //       controller: passwordLama,
                //       keyboardType: TextInputType.visiblePassword,
                //       obscureText: visibilityPasswordLama,
                //       style: TextStyle(color: C7, fontSize: 15),
                //       decoration: InputDecoration(
                //         hintText: "Masukan kata sandi lama",
                //         hintStyle: TextStyle(color: C7, fontSize: 15),
                //         errorText: null,
                //         filled: true,
                //         fillColor: C3,
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(8)),
                //         focusedBorder: OutlineInputBorder(
                //           borderSide: BorderSide(color: C7),
                //           borderRadius: BorderRadius.circular(8)
                //         ),
                //         suffixIcon: IconButton(
                //           icon: Icon(
                //             visibilityPasswordLama
                //             ? Icons.visibility_off
                //             : Icons.visibility,
                //             color: C7
                //           ),
                //           onPressed: () {
                //             setState(() {
                //               visibilityPasswordLama =
                //               !visibilityPasswordLama;
                //             });
                //           }
                //         )
                //       )
                //     )
                //   ]
                // ),
                // const SizedBox(height: 10),
                //kata sandi baru
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Kata Sandi Baru",
                        style: TextStyle(
                          color: Color(0xFF374151),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      )
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: passwordBaru,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: visibilityPasswordBaru,
                      style: TextStyle(color: C7, fontSize: 15),
                      decoration: InputDecoration(
                        hintText: "Masukan kata sandi Baru",
                        hintStyle: TextStyle(color: C7, fontSize: 15),
                        errorText: null,
                        filled: true,
                        fillColor: C3,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: C7),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            visibilityPasswordBaru
                            ? Icons.visibility_off
                            : Icons.visibility,
                            color: C7
                          ),
                          onPressed: () {
                            setState(() {
                              visibilityPasswordBaru =
                              !visibilityPasswordBaru;
                            });
                          }
                        )
                      )
                    )
                  ]
                ),
                const SizedBox(height: 10),
                //confirm password
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(
                          color: Color(0xFF374151),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      )
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: passwordConfirm,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: visibilityPasswordConfirm,
                      style: TextStyle(color: C7, fontSize: 15),
                      decoration: InputDecoration(
                        hintText: "Masukan Confirm Password",
                        hintStyle: TextStyle(color: C7, fontSize: 15),
                        errorText: null,
                        filled: true,
                        fillColor: C3,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: C7),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            visibilityPasswordConfirm
                            ? Icons.visibility_off
                            : Icons.visibility,
                            color: C7
                          ),
                          onPressed: () {
                            setState(() {
                              visibilityPasswordConfirm =
                              !visibilityPasswordConfirm;
                            });
                          }
                        )
                      )
                    )
                  ]
                ),
                const SizedBox(height: 10),
              ],
            ),
            const SizedBox(height: 10),
            //note
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\u2022 minimal 8 karakter",
                    style: TextStyle(
                      color: C6,
                      fontSize: 13,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    "\u2022 harus mengandung kombinasi dari huruf besar, huruf kecil, angka, dan simbol",
                    style: TextStyle(
                      color: C6,
                      fontSize: 13,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            //button
            SizedBox( 
              width: MediaQuery.sizeOf(context).width,
              child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
                listener: (context, state) {
                  if(state is ChangePasswordFailureState){
                    showTopSnackBar(Overlay.of(context),
                      CustomSnackBar.error(message: state.error)
                    );
                  }
                  if(state is ChangePasswordSuccesState){
                    showTopSnackBar(Overlay.of(context),
                      const CustomSnackBar.success(message: "password sudah diganti")
                    );
                  }
                },
                builder: (context, state) {
                  if(state is ChangePasswordProccesState) {
                    return ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        )
                      ),
                      child: const SizedBox(
                        height: 20,
                        width: 20,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    );
                  }
                  return ElevatedButton(
                    onPressed: (){
                      if(passwordBaru.text != "" && passwordConfirm.text != "") {
                         changePasswordBloc.add(
                          ChangePasswordUserEvent(
                            widget.user.id,
                            ChangePassword(
                              name: widget.user.name,
                              email: widget.user.email,
                              password: passwordBaru.text,
                              passwordConfirm: passwordConfirm.text
                            )
                          )
                        );
                      } else {
                        showTopSnackBar(Overlay.of(context),
                          const CustomSnackBar.error(message: "Password dan Confirm Password tidak boleh kosong")
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF407BFF),
                      padding: const EdgeInsets.symmetric(
                        vertical: 5
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    child: Text(
                      "Ubah kata sandi",
                      style: TextStyle(
                        color: C3,
                        fontSize: 15,
                        fontWeight: FontWeight.w500 
                      ),
                    )
                  );
                }
              ),
            ) 
          ],
        ),
      ),
    );
  }
}