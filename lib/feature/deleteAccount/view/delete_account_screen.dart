import 'package:flutter/material.dart';
import 'package:isp_management_app/route/routes_name.dart';

import '../../../theme/pallet_color.dart';
import '../../homeIndex/model/user_model.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C3,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: C1,
        centerTitle: true,
        title: Text(
          "Hapus Akun",
          style: TextStyle(
            fontSize: 19,
            color: C3, 
            fontWeight: FontWeight.bold
          ),
        )
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.0248,
          left: MediaQuery.sizeOf(context).width * 0.0555,
          right: MediaQuery.sizeOf(context).width * 0.0555,
          bottom: MediaQuery.sizeOf(context).height * 0.0248,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // note
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Catatan",
                  style: TextStyle(
                    color: C6,
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  "Menghapus akun anda akan menghapus semua informasi yang terhubung dengan profile anda secara permanen dan tidak dapat dipulihkan kembali.",
                  style: TextStyle(
                    color: C6,
                    fontSize: 13,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.0248,
            ),
            //button
            SizedBox( 
              width: MediaQuery.sizeOf(context).width,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, CONFIRMATIONDELETEACCOUNT, arguments: user);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: C3,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color(0xFFE11C1C),
                      width: 2
                    ),
                    borderRadius: BorderRadius.circular(8)
                  )
                ),
                child: const Text(
                  "Hapus Akun Saya",
                  style: TextStyle(
                    color: Color(0xFFE11C1C),
                    fontSize: 15,
                    fontWeight: FontWeight.w500 
                  ),
                )
              ),
            ) 
          ],
        ),
      )
    );
  }
}