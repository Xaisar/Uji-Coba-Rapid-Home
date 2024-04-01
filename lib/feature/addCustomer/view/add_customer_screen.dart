import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../../theme/pallet_color.dart';

class AddCustomerScreen extends StatefulWidget{
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class Model{
  final String name;
  final String id;

  const Model({
    required this.name,
    required this.id
  });
}
class _AddCustomerScreenState extends State<AddCustomerScreen> {
 
 final List<Model> myFriends = [
  const Model(name: "clara", id: "1234567"),
  const Model(name: "dungeon", id: "1222134"),
  const Model(name: "domestik", id: "5465755"),
  const Model(name: "senayan", id: "5465476"),
  const Model(name: "kampoeng", id: "9873662"),
  const Model(name: "admin", id: "1827336"),
  const Model(name: "ankara", id: "1928336"),
 ];

  Model? modelvalue;
  
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C13,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.13,
              bottom: MediaQuery.of(context).size.height * 0.14
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                //logo and title section
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //logo
                      Image.asset(
                        "assets/logos/Front_Logo.png",
                        height: MediaQuery.of(context).size.height *  0.12,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      //title
                      Text(
                        "Customer",
                        style: TextStyle(
                          fontSize: 20,
                          color: C3
                        ),
                      )
                    ],
                  )
                ),
                // input section
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width *0.13
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //branch id field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Branch ID",
                            style: TextStyle(
                              color: C3,
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          DropdownButtonFormField(
                            style: TextStyle(
                              color: C19,
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                            ),
                            dropdownColor: C3,
                            menuMaxHeight: MediaQuery.of(context).size.height * 0.21,
                            decoration: InputDecoration(
                              hintText: "Select Branch ID",
                              hintStyle: TextStyle(
                                color: C7,
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                              ),
                              // errorText: state is NullErrorEmailState ? 
                              // "Email cannot be empty":
                              // null,
                              filled: true,
                              fillColor: C3,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: C3),
                                borderRadius:BorderRadius.circular(0)
                              ),
                              suffixIcon: Icon(
                                Icons.arrow_drop_down_rounded,
                                color: C7,
                                size: 21 * 2
                              )
                            ),
                            items: myFriends.map((value){
                              return DropdownMenuItem<Model>(
                                // alignment: Alignment.topCenter,
                                value: value,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      value.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    // Text(
                                    //   value.id,
                                    //   maxLines: 1,
                                    //   overflow: TextOverflow.ellipsis,
                                    // )
                                  ]
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              modelvalue = value as Model;
                              debugPrint(modelvalue!.name);
                              debugPrint(modelvalue!.id);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10
                      ),
                      //Customer ID Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Customer ID",
                            style: TextStyle(
                              color: C3,
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          TextField(
                            onChanged: (value) {},
                            // controller: emailController,
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(color: C7, fontSize: 14),
                            decoration: InputDecoration(
                              hintText: "Enter the Customer ID",
                              hintStyle: TextStyle(
                                color: C7,
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                              ),
                              // errorText: state is NullErrorEmailState ? 
                              // "Email cannot be empty":
                              // null,
                              filled: true,
                              fillColor: C3,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: C3),
                                borderRadius:BorderRadius.circular(0)
                              ),
                            )
                          ),
                        ],
                      ),
                    ],
                  )
                ),
                //button 
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: C9,
                      padding:const EdgeInsetsDirectional.symmetric(vertical: 13),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: C3,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}