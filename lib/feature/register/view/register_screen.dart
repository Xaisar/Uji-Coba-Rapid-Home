// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../route/routes_name.dart';

import '../../../theme/pallet_color.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool visibilityPassword = true;
  bool visibilityConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C13,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.13,
              bottom: MediaQuery.of(context).size.height * 0.1
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                //title
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "create your account",
                    style: TextStyle(
                      color:C3,
                      fontSize: 22,
                      fontWeight: FontWeight.w500
                    ) 
                  ),
                ),
                //input section
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.14
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Email
                      InputField(
                        title: "Email",
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //nama lengkap
                      InputField(
                        title: "Nama Lengkap",
                        icon: Icons.person,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //password
                      TextField(
                        onChanged: (value) {},
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: visibilityPassword,
                        style: TextStyle(
                          color: C7,
                          fontSize: 14
                        ),
                        decoration: InputDecoration( 
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: C7,
                            fontSize: 14
                          ),
                          filled: true,
                          fillColor: C3,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10) 
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: C3),
                            borderRadius: BorderRadius.circular(10) 
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: C6,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              visibilityPassword? Icons.visibility_off : Icons.visibility,
                              color:C7
                            ),
                            onPressed: (){
                              setState(() {
                                visibilityPassword = !visibilityPassword;
                              });
                            })
                        )
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //Confirm password
                      TextField(
                          onChanged: (value) {},
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: visibilityConfirmPassword,
                          style: TextStyle(
                            color: C7,
                            fontSize: 14
                          ),
                          decoration: InputDecoration( 
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(
                              color: C7,
                              fontSize: 14
                            ),
                            filled: true,
                            fillColor: C3,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10) 
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: C3),
                              borderRadius: BorderRadius.circular(10) 
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: C6,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                visibilityConfirmPassword? Icons.visibility_off : Icons.visibility,
                                color:C7
                                ),
                              onPressed: (){
                                setState(() {
                                  visibilityConfirmPassword = !visibilityConfirmPassword;
                                });
                              })
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
                                      color: C3,
                                      shape: BoxShape.circle
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "min 8 character",
                                    style: TextStyle(
                                      color: C3,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500 
                                    ),
                                  )
                                ],
                               ),
                             ),
                             Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.only(left: 5),
                              // alignment: ,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 6),
                                    height: 5,
                                    width: 5,
                                    decoration: BoxDecoration(
                                      color: C3,
                                      shape: BoxShape.circle
                                    ),
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
                                        fontWeight: FontWeight.w500 
                                      ),
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
                ),
                //button register & login section
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: C9,
                              padding: const EdgeInsetsDirectional.symmetric(
                                vertical: 13
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: C3,
                                fontSize: 17,
                                fontWeight:FontWeight.bold
                              ),
                              )
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
                                color: C3,
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            TextButton(
                              onPressed: (){
                                Navigator.pushReplacementNamed(context, LOGINFROMREGISTER);
                              },
                              style: TextButton.styleFrom(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.all(0)
                              ),
                              child: Text(
                                " Login",
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
          ) 
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  InputField({
    super.key,
    required this.title,
    required this.icon,
    required this.keyboardType
  });
  String title;
  IconData icon;
  TextInputType keyboardType;
  // void input;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      keyboardType: keyboardType,
      style: TextStyle(
        color: C7,
        fontSize: 14
      ),
      decoration: InputDecoration( 
        hintText: title,
        hintStyle: TextStyle(
          color: C7,
          fontSize: 14
        ),
        filled: true,
        fillColor: C3,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10) 
        ),
          focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: C3),
          borderRadius: BorderRadius.circular(10) 
        ),
        prefixIcon: Icon(
          icon,
          color: C6,
        )
      )
    );
  }
}