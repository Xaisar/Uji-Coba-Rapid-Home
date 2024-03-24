import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../route/routes_name.dart';

import '../../feature/authentication/bloc/authentication_bloc.dart';
import '../../theme/pallet_color.dart';

class OnBoarding4Screen extends StatelessWidget{
  const OnBoarding4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        //gambar
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width *0.1,
            left: MediaQuery.of(context).size.width *0.025,
            right: MediaQuery.of(context).size.width *0.025
          ),
          child: Image.asset(
            "assets/images/Image_OnBoarding3.png",
            width: MediaQuery.of(context).size.width
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //note text
              AutoSizeText(
                "Layanan internet terbaik untuk rumahmu",
                maxLines: 1,
                style: TextStyle(
                  color: C10,
                  fontSize: 12
                )
              ),
              const SizedBox(
                height: 30,
              ),
              AutoSizeText.rich(
                maxLines: 3,
                style: const TextStyle(
                  fontSize: 30
                ),
              //title
              TextSpan(
                children: [
                  TextSpan(
                    text: "Harga Terjangkau \n",
                    style: TextStyle(
                      color: C1,
                      fontWeight: FontWeight.w600
                    )
                  ),
                  TextSpan(
                    text: "Dengan Berbagai Pilihan Paket",
                    style: TextStyle(
                      color: C10,
                    )
                  ),
                ]
              )
            )
            ],
          )
        ),
        //button section
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationBloc>().add(IsFirstTimeDoneEvent());
                  Navigator.of(context).pushReplacementNamed(LOGIN);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: C9,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40
                  )
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: C3,
                    fontSize: 16
                  ),
                )
              ),
              ElevatedButton(
                onPressed: (){
                  context.read<AuthenticationBloc>().add(IsFirstTimeDoneEvent());
                  Navigator.of(context).pushReplacementNamed(REGISTER);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: C9,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 34
                  )
                ),
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: C3,
                    fontSize: 16
                  ),
                )
              ),
            ]
          ),
        )
      ],
    );
  }

}