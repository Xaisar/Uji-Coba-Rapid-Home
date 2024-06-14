import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:top_snackbar_flutter/custom_snack_bar.dart";
import "package:top_snackbar_flutter/top_snack_bar.dart";

import "../../../route/routes_name.dart";

import "../bloc/cubit/email_cubit/email_cubit.dart";
import "../bloc/cubit/password_cubit/password_cubit.dart";
import "../../authentication/bloc/authentication_bloc.dart";
import "../bloc/login_bloc.dart";
import "../../../theme/pallet_color.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => EmailCubit()),
        BlocProvider(create: (context) => PasswordCubit()),
      ],
      child: Scaffold(
        backgroundColor: C13,
        body: const SingleChildScrollView(child: SafeArea(child: LoginForm())),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key,});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool visibilityPassword = true;
  bool checkBoxStatus = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LoginBloc>(context).add(InitialLoginEvent());
  }

  @override
  Widget build(BuildContext context) {
    final loginbloc = BlocProvider.of<LoginBloc>(context);
    final emailCubit = BlocProvider.of<EmailCubit>(context);
    final passwordCubit = BlocProvider.of<PasswordCubit>(context);

    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.14,
        bottom: MediaQuery.of(context).size.height * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          //logo
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/logos/Front_Logo.png",
              height: MediaQuery.of(context).size.height * 0.21,
            ),
          ),
          //Form Login
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is StoredAccountExistState) {
                emailController = TextEditingController(text: state.loginModel.email);
                passwordController = TextEditingController(text: state.loginModel.password);
                checkBoxStatus = true;
              }
            }, 
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.14),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //email
                        BlocBuilder<EmailCubit, EmailState>(
                          builder: (context, state) {
                            return TextField(
                              onChanged: (value) {
                                emailCubit.onChangeEmail(value);
                              },
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: C7, fontSize: 14),
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(color: C7, fontSize: 14),
                                errorText: state is NullErrorEmailState
                                  ? "Email cannot be empty"
                                  : null,
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
                            );
                          },
                        ),
                        const SizedBox(height: 26),
                        //password
                        BlocBuilder<PasswordCubit, PasswordState>(
                          builder: (context, state) {
                            return TextField(
                              onChanged: (value) {
                                passwordCubit.onChangePassword(value);
                              },
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: visibilityPassword,
                              style: TextStyle(color: C7, fontSize: 14),
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(color: C7, fontSize: 14),
                                errorText: state is NullErrorPasswordState
                                  ? "Password cannot be empty"
                                  : null,
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
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  // remember & forgot password
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.14 - 12,
                      right: MediaQuery.of(context).size.width * 0.14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        //remember
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              value: checkBoxStatus,
                              onChanged: (value) {
                                setState(() {
                                  checkBoxStatus = !checkBoxStatus;
                                });
                              },
                              shape: const CircleBorder(),
                              side: BorderSide(color: C3),
                              activeColor: C3,
                              checkColor: C13,
                            ),
                            AutoSizeText(
                              "Remember me",
                              maxLines: 1,
                              minFontSize: 10,
                              style: TextStyle(
                                color: C3,
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                              )
                            )
                          ],
                        ),
                        //forgot password
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, FORGOTPASSWORD);
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0)
                          ),
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(
                              color: C3,
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                            ),
                          )
                        )
                      ],
                    )
                  )
                ],
              );
            }
          ),
          // button login dan register section
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is NullErrorSubmittedState) {
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.info(
                            message: "Email and Password cannot be empty"
                          )
                        );
                      }
                      if (state is LoginSuccessState) {
                        loginbloc.add(OnValidateTokenEvent(state.sessionToken));
                      }
                      if (state is LoginFailureState) {
                        showTopSnackBar(Overlay.of(context),
                          CustomSnackBar.error(message: state.error)
                        );
                      }
                      if (state is ValidateTokenSuccessWithNoCustomerState) {
                        context.read<AuthenticationBloc>().add(IsAuthenticationEvent());
                        Navigator.pushReplacementNamed(context, ADDCUSTOMERFROMLOGIN);
                      }
                      if (state is ValidateTokenSuccessWithCustomerState) {
                        context.read<AuthenticationBloc>().add(IsAuthenticationEvent());
                        Navigator.pushReplacementNamed(context, HOME);
                      }
                      if (state is ValidateTokenFailureState) {
                        showTopSnackBar(Overlay.of(context),
                          CustomSnackBar.error(message: state.error)
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is OnSubmittedState ||
                          state is OnValidateTokenState) {
                        return ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsetsDirectional.symmetric(vertical: 7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const CircularProgressIndicator()
                        );
                      }
                      return ElevatedButton(
                        onPressed: () {
                          loginbloc.add(OnSubmittedEvent(
                            emailController.text,
                            passwordController.text, 
                            checkBoxStatus)
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: C9,
                          padding: const EdgeInsetsDirectional.symmetric(vertical: 13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Text("Login",
                          style: TextStyle(
                            color: C3,
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                          )
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
                      "Belum punya akun? ",
                      style: TextStyle(
                        color: C3, 
                        fontSize: 12, 
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, REGISTERFROMLOGIN);
                      },
                      style: TextButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(0)
                      ),
                      child: Text(
                        " Register",
                        style: TextStyle(
                          color: C3,
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                        ),
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
