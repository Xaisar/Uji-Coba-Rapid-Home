import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isp_management_app/route/routes_name.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../theme/pallet_color.dart';
import '../../authentication/bloc/authentication_bloc.dart';
import '../../homeIndex/bloc/user_bloc.dart';
import '../../homeIndex/model/user_model.dart';
import '../bloc/edit_profile_bloc.dart';
import '../model/edit_user_model.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileBloc(),
      child: EditProfileView(user: user,),
    );
  }
}

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key, required this.user});
  final User user;

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  XFile? image; 
  
  @override
  void initState() {
    namaController = TextEditingController(text: widget.user.name);
    emailController = TextEditingController(text: widget.user.email);
    super.initState();
  }

  Future imagePick(String metode) async {
    final XFile? returneImage;
    if(metode == "camera") {
      returneImage = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      returneImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    }
     
    if(returneImage == null){
      return null;
    }
    setState(() {
      image = XFile(returneImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final editProfileBloc = BlocProvider.of<EditProfileBloc>(context);
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      backgroundColor: C1,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Profile",
            style: TextStyle(
              fontSize: 18,
              color: C3, 
              fontWeight: FontWeight.bold
            )
          )
        ),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: C3,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25) 
          )
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(context).height * 0.031,
            left: MediaQuery.sizeOf(context).width * 0.0555,
            right: MediaQuery.sizeOf(context).width * 0.0555,
            bottom: MediaQuery.sizeOf(context).height * 0.0248
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //avatar
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.148,
                width: MediaQuery.sizeOf(context).height * 0.148,
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    CircleAvatar(
                      backgroundColor: const  Color(0xFFD1D5DB),
                      radius: MediaQuery.sizeOf(context).height,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width),
                        child: image != null 
                        ? Image.file(
                          File(image!.path),
                          fit: BoxFit.cover,
                          height: MediaQuery.sizeOf(context).height,
                          width: MediaQuery.sizeOf(context).width,
                        ) 
                        : widget.user.avatar != null
                        ? Image.network(
                          widget.user.avatar!,
                          fit: BoxFit.cover,
                          height: MediaQuery.sizeOf(context).height,
                          width: MediaQuery.sizeOf(context).width,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              size: MediaQuery.sizeOf(context).height * 0.148,
                              Icons.person,
                              color: C6
                            );
                          },
                        ) 
                        : Icon(
                          size: MediaQuery.sizeOf(context).height * 0.148,
                          Icons.person,
                          color: C6
                        )
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () async {
                          //pop up pilih kamera atau gallery
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                alignment: Alignment.center,
                                backgroundColor: C3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextButton(
                                      onPressed: (){
                                        imagePick("camera");
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Ambil Foto",
                                        style:  TextStyle(
                                          color: C6,
                                        ),
                                      )
                                    ),
                                    TextButton(
                                      onPressed: (){
                                        imagePick("gallery");
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Pilih foto yang ada",
                                        style:  TextStyle(
                                          color: C6,
                                        ),
                                      )
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: C1,
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: C3,
                            size: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0248),
              //form
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //input nama
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Nama",
                          style: TextStyle(
                            color: Color(0xFF374151),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                        )
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: namaController,
                        keyboardType: TextInputType.name,
                        style: TextStyle(color: C7, fontSize: 15),
                        decoration: InputDecoration(
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
                  //input email
                  const SizedBox(height: 10),
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
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: C7, fontSize: 15),
                        decoration: InputDecoration(
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
                ],
              ),
              //customer
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0248),
              Container(
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(widget.user.customers.length, (index) {
                        return Column(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Customer ${index +1}",
                                    style: const TextStyle(
                                      color: Color(0xFF374151),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                  )
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: MediaQuery.sizeOf(context).width,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10
                                  ),
                                  decoration: BoxDecoration(
                                    color: C3,
                                    border: Border.all(
                                      color: const Color(0xFFD1D5DB),
                                      width: 1
                                    ),
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.user.customers[index].name,
                                        style: TextStyle(
                                          color: C6,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        widget.user.customers[index].email,
                                        style: TextStyle(
                                          color: C6,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                //seperator
                                index != widget.user.customers.length - 1
                                ? Container(
                                  height: 2,
                                  width: MediaQuery.sizeOf(context).width,
                                  margin: const EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                    color: C3,
                                    borderRadius: BorderRadius.circular(9)
                                  ),
                                )
                                : const SizedBox(),
                              ],
                            ),
                          ],
                        );
                      }),
                    ),
                    const SizedBox(height: 10),
                    //button tambah customer
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, ADDCUSTOMERFROMHOME);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF16A34A),
                          padding: const EdgeInsets.symmetric(
                            vertical: 5
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          )
                        ),
                        child: Text(
                          "Tambah Customer",
                          style: TextStyle(
                            color: C3,
                            fontSize: 15,
                            fontWeight: FontWeight.w500 
                          ),
                        )
                      ),
                    )
                  ],
                ) ,
              ),
              //button simpan
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0248),
              SizedBox( 
                width: MediaQuery.sizeOf(context).width,
                child: BlocConsumer<EditProfileBloc, EditProfileState>(
                  listener: (context, state) {
                    if(state is EditProfileUserFailureState) {
                      showTopSnackBar(Overlay.of(context),
                        CustomSnackBar.error(message: state.error)
                      );
                    }
                    if(state is EditProfielUserSuccesState) {
                      showTopSnackBar(Overlay.of(context),
                        const CustomSnackBar.success(message: "profile sudah diganti")
                      );
                      context.read<UserBloc>().add(InitialUserEvent());
                    }
                    if(state is EditProfileExpiredTokenState){
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.error(message: state.message)
                      );
                      authenticationBloc.add(UnAuthenticationEvent());
                    }
                  },
                  builder: (context, state) {
                    if(state is EditProfielUserProccesState) {
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
                        editProfileBloc.add(
                          EditProfileUserEvent(
                            id: widget.user.id,
                            avatar: image, 
                            editUser: EditUser(
                              name: namaController.text,
                              email: emailController.text
                            )
                          )
                        );
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
                        "Simpan",
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
      ),
    );
  }
}