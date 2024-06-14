import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/pallet_color.dart';
import '../../homeIndex/model/user_model.dart';
import '../bloc/delete_account_bloc.dart';

class ConfirmationDeleteAccountScreen extends StatelessWidget {
  const ConfirmationDeleteAccountScreen({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteAccountBloc(),
      child: ConfirmationDeleteAccountView(user: user),
    );
  }
}

class ConfirmationDeleteAccountView extends StatefulWidget {
  const ConfirmationDeleteAccountView({super.key, required this.user});
  final User user;

  @override
  State<ConfirmationDeleteAccountView> createState() => _ConfirmationDeleteAccountViewState();
}

class _ConfirmationDeleteAccountViewState extends State<ConfirmationDeleteAccountView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool visibilityPassword = true;

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C3,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          backgroundColor: C1,
          centerTitle: true,
          title: Text(
            "Hapus Akun",
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
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F4),
            borderRadius: BorderRadius.circular(8)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //note
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Konfirmasi Penghapusan Akun",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: C6,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Silahkan login untuk konfirmasi penghapusan akun anda",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: C6,
                        fontSize: 13,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              //TextInput
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Email
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
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: C7, fontSize: 15),
                        decoration: InputDecoration(
                          hintText: "Masukan Email",
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
                    ]
                  ),
                  const SizedBox(height: 10),
                  //password
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(
                            color: Color(0xFF374151),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                        )
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: password,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: visibilityPassword,
                        style: TextStyle(color: C7, fontSize: 15),
                        decoration: InputDecoration(
                          hintText: "Masukan Password",
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
                              visibilityPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                              color: C7
                            ),
                            onPressed: () {
                              setState(() {
                                visibilityPassword =
                                !visibilityPassword;
                              });
                            }
                          )
                        )
                      )
                    ]
                  ),
                ],
              ),
              const SizedBox(height: 15),
              //button
              SizedBox( 
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE11C1C),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                  child: Text(
                    "Hapus",
                    style: TextStyle(
                      color: C3,
                      fontSize: 15,
                      fontWeight: FontWeight.w500 
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}