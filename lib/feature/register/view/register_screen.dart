import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:top_snackbar_flutter/custom_snack_bar.dart";
import "package:top_snackbar_flutter/top_snack_bar.dart";

import '../../../route/routes_name.dart';

import '../../../theme/pallet_color.dart';
import '../bloc/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: Scaffold(
        backgroundColor: C13,
        body: const SingleChildScrollView(
          child: SafeArea(child: RegisterForm()),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool visibilityPassword = true;
  bool visibilityConfirmPassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final registerBloc = BlocProvider.of<RegisterBloc>(context);

    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.13,
          bottom: MediaQuery.of(context).size.height * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          //title
          Align(
            alignment: Alignment.topCenter,
            child: Text("create your account",
                style: TextStyle(
                    color: C3, fontSize: 22, fontWeight: FontWeight.w500)),
          ),
          //input section
          BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.14),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Email
                    TextField(
                      controller: emailController,
                      onChanged: (value) {
                        registerBloc.add(OnChangeEmailEvent(value));
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: C7, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: C7, fontSize: 14),
                        errorText: state is NullErrorEmailState ? 
                        "Email cannot be empty" :
                        null,
                        filled: true,
                        fillColor: C3,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: C3),
                          borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: C6,
                        )
                      )
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //nama lengkap
                    TextField(
                      controller: nameController,
                      onChanged: (value) {
                        registerBloc.add(OnChangeNameEvent(value));
                      },
                      keyboardType: TextInputType.name,
                      style: TextStyle(color: C7, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: "Nama Lengkap",
                        hintStyle: TextStyle(color: C7, fontSize: 14),
                        errorText: state is NullErrorNameState ?
                        "name cannot be empty":
                        null,
                        filled: true,
                        fillColor: C3,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: C3),
                          borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: C6,
                        )
                      )
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //password
                    TextField(
                      controller: passwordController,
                      onChanged: (value) {
                        registerBloc.add(OnChangePasswordEvent(value));
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: visibilityPassword,
                      style: TextStyle(color: C7, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: C7, fontSize: 14),
                        errorText: state is NullErrorPasswordState ?
                        "password cannot be empty":
                        null,
                        filled: true,
                        fillColor: C3,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: C3),
                          borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: C6,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            visibilityPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                            color: C7),
                          onPressed: () {
                            setState(() {
                              visibilityPassword = !visibilityPassword;
                            });
                          }
                        )
                      )
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //Confirm password
                    TextField(
                      controller: confirmPasswordController,
                      onChanged: (value) {
                        registerBloc.add(OnChangeConfirmPasswordEvent(value));
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: visibilityConfirmPassword,
                      style: TextStyle(color: C7, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(color: C7, fontSize: 14),
                        errorText: state is NullErrorConfirmPasswordState ?
                        "confirm password cannot be empty":
                        null,
                        filled: true,
                        fillColor: C3,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: C3),
                          borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: C6,
                          ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            visibilityConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                            color: C7),
                          onPressed: () {
                            setState(() {
                              visibilityConfirmPassword =
                              !visibilityConfirmPassword;
                            });
                          }
                        )
                      )
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //note rule password
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                    color: C3, shape: BoxShape.circle),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "min 8 character",
                                  style: TextStyle(
                                    color: C3,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                    color: C3, shape: BoxShape.circle),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "max 16 character",
                                  style: TextStyle(
                                    color: C3,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 6),
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                    color: C3, shape: BoxShape.circle),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    "include combination of uppercase letters, lowercase letters, numbers, and symbols",
                                    maxLines: 2,
                                    // softWrap: true,
                                    style: TextStyle(
                                      color: C3,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          //button register & login section
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: BlocConsumer<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      if(state is NullErrorSubmittedState){
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.info(
                            message: "Form register cannot be empty")
                        );
                      }
                      if(state is RegisterFailureState){
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.error(
                            message: state.error)
                        );
                      }
                      if(state is RegisterSuccessState){
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.success(
                            message: "Register Success\nPlease validate your email before login",
                            textStyle: TextStyle(fontSize: 15),
                          )
                        );
                        Navigator.pushReplacementNamed(context, LOGINFROMREGISTER);
                      }
                    },
                    builder: (context, state) {
                      if(state is OnSubmittedState){
                        return ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            padding:const EdgeInsetsDirectional.symmetric(vertical: 7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const CircularProgressIndicator()
                        );
                      }
                      return ElevatedButton(
                        onPressed: () {
                          registerBloc.add(OnSubmittedEvent(
                            emailController.text, 
                            nameController.text, 
                            passwordController.text, 
                            confirmPasswordController.text
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: C9,
                          padding: const EdgeInsetsDirectional.symmetric(vertical: 13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: C3,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                        )
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Sudah punya akun? ",
                      style: TextStyle(
                        color: C3, fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context, LOGINFROMREGISTER);
                      },
                      style: TextButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(0)),
                      child: Text(
                        " Login",
                        style: TextStyle(
                          color: C3,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      )
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
