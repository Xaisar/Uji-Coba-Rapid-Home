import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../theme/pallet_color.dart';
import '../bloc/forgot_password_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordBloc(),
      child: const ForgotPasswordView(),
    );
  }
}

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final forgotPasswordBloc = BlocProvider.of<ForgotPasswordBloc>(context);

    return Scaffold(
      backgroundColor: C3,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: C1,
        centerTitle: true,
        title: Text(
          "Atur Ulang Password",
          style: TextStyle(
            fontSize: 19, color: C3, fontWeight: FontWeight.bold),
        )
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.055,
          vertical: MediaQuery.sizeOf(context).height * 0.0248),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //note
            Text(
              "Masukan alamat email dari akun anda dan kami akan mengirimkan email konfirmasi untuk mengatur ulang password anda",
              style: TextStyle(
                color: C6, fontSize: 13, fontWeight: FontWeight.w500
              )
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.0248),
            //input email
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(
                      color: Color(0xFF374151),
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  )
                ),
                const SizedBox(height: 10),
                TextField(
                  onChanged: (value) {},
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: C7, fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "Masukan email anda",
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
                  )
                )
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.0248),
            //button
            BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
              listener: (context, state) {
                if (state is ResetPasswordFailureState) {
                  showTopSnackBar(Overlay.of(context),
                    CustomSnackBar.error(message: state.error)
                  );
                }
                if (state is ResetPasswordSuccesState) {
                  showTopSnackBar(Overlay.of(context),
                    CustomSnackBar.success(message: state.message)
                  );
                }
              },
              builder: (context, state) {
                if (state is ResetPasswordProccesState) {
                  return SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: C9,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        )
                      ),
                      child: const SizedBox(
                        height: 20,
                        width: 20,
                        child: Center(
                          child: CircularProgressIndicator(),
                        )
                      )
                    )
                  );
                }
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                    onPressed: () {
                      forgotPasswordBloc.add(ResetPasswordEvent(emailController.text));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: C9,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: C3,
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  )
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
