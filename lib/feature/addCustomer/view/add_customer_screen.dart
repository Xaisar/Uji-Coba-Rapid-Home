import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../route/routes_name.dart';

import '../../home/bloc/home_bloc/home_bloc.dart';
import '../model/merchant_model.dart';
import '../bloc/add_customer_bloc.dart';
import '../bloc/cubit/customer_id_cubit/customer_id_cubit.dart';
import '../../../theme/pallet_color.dart';
import '../../authentication/bloc/authentication_bloc.dart';

// ignore: must_be_immutable
class AddCustomerScreen extends StatelessWidget {
  AddCustomerScreen({
    super.key,
    required this.routeState,
    this.homebloc
  });

  final bool routeState;
  HomeBloc? homebloc;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if(state is AuthenticationUnAuthenticationState){
          Navigator.pushReplacementNamed(context, LOGIN);
        }
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AddCustomerBloc()),
          BlocProvider(create: (context) => CustomerIdCubit()),
        ],
        child: Scaffold(
          backgroundColor: C13,
          body: SingleChildScrollView(
            child: SafeArea(child: AddCustomerForm(routeState: routeState, homeBloc: homebloc))
          ),
        )
      ),
    );
  }
}

// ignore: must_be_immutable
class AddCustomerForm extends StatefulWidget {
  AddCustomerForm({
    super.key,
    required this.routeState,
    this.homeBloc  
    });
  
  final bool routeState;
  HomeBloc? homeBloc;

  @override
  State<AddCustomerForm> createState() => _AddCustomerFormState();
}

class _AddCustomerFormState extends State<AddCustomerForm> {
  List<Merchant> merchants = [];
  Merchant? merchantValue;

  TextEditingController customerIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<AddCustomerBloc>().add(InitialAddCustomerEvent());
  }

  @override
  Widget build(BuildContext context) {
    final addCustomerBloc = BlocProvider.of<AddCustomerBloc>(context);
    final customerIdCubit = BlocProvider.of<CustomerIdCubit>(context);

    return BlocConsumer<AddCustomerBloc, AddCustomerState>(
      listener: (context, state) {
        if (state is AddMerhantFailureState) {
          showTopSnackBar(
            Overlay.of(context), 
            CustomSnackBar.error(message: state.error)
          );
        }
        if (state is AddMerhantSuccessState) {
          merchants.addAll(state.merchants);
        }
      },
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.13,
            bottom: MediaQuery.of(context).size.height * 0.1),
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
                      height: MediaQuery.of(context).size.height * 0.18,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    //title
                    Text(
                      "Customer",
                      style: TextStyle(fontSize: 20, color: C3),
                    )
                  ],
                )
              ),
              // input section
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.13),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //branch id field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "ISP",
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
                            hintText: "Select ISP",
                            hintStyle: TextStyle(
                            color: C7,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                            filled: true,
                            fillColor: C3,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: C3),
                              borderRadius: BorderRadius.circular(0)),
                            suffixIcon: Icon(
                              Icons.arrow_drop_down_rounded,
                              color: C7, 
                              size: 21 * 2
                            )
                          ),
                          items: merchants.map((value) {
                            return DropdownMenuItem<Merchant>(
                              value: value,
                              child: Row(
                                crossAxisAlignment:CrossAxisAlignment.center,
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    value.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ]
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              merchantValue = value;
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //Customer ID Field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "ID Pelanggan",
                          style: TextStyle(
                            color: C3,
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        BlocBuilder<CustomerIdCubit, CustomerIdState>(
                          builder: (context, state) {
                            return TextField(
                              onChanged: (value) {
                                customerIdCubit.onChangeCustomerId(value);
                              },
                              controller: customerIdController,
                              keyboardType: TextInputType.visiblePassword,
                              style: TextStyle(color: C7, fontSize: 14),
                              decoration: InputDecoration(
                                hintText: "Enter ID Pelanggan",
                                hintStyle: TextStyle(
                                  color: C7,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                                errorText: state is NullErrorCustomerIdState
                                  ? "ID Pelanggan cannot be empty"
                                  : null,
                                filled: true,
                                fillColor: C3,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: C3),
                                  borderRadius: BorderRadius.circular(0)
                                ),
                              )
                            );
                          },
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
                  horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: BlocConsumer<AddCustomerBloc, AddCustomerState>(
                        listener: (context, state) {
                          if (state is NullErrorSubmittedState) {
                            showTopSnackBar(
                              Overlay.of(context),
                              const CustomSnackBar.info(
                                message:"Add customer form cannot be empty"
                              )
                            );
                          }
                          if (state is AddCustomerFailureState) {
                            showTopSnackBar(
                              Overlay.of(context),
                              CustomSnackBar.error(message: state.error)
                            );
                          }
                          if (state is AddCustomerSuccesState) {
                            showTopSnackBar(
                              Overlay.of(context),
                              const CustomSnackBar.success(message: "Customer added successfully")
                            );
                            addCustomerBloc.add(OnValidateTokenEvent());
                          }
                          if (state is ValidateTokenFailureState){
                            showTopSnackBar(
                              Overlay.of(context),
                              CustomSnackBar.error(message: state.error)
                            );
                          }
                          if (state is ValidateTokenSuccesState){
                            if (widget.routeState) {
                              widget.homeBloc!.add(InitialHomeEvent());
                              Navigator.pop(context);
                              Navigator.pop(context);
                            } else {
                              Navigator.pushReplacementNamed(context, HOME);                              
                            }
                          }
                        },
                        builder: (context, state) {
                          if (state is OnSubmiteState || state is OnValidateTokenState) {
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
                              addCustomerBloc.add(OnSubmiteEvent(
                                merchantValue == null ? ""
                                : merchantValue!.id,
                                customerIdController.text
                                )
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: C9,
                              padding: const EdgeInsetsDirectional.symmetric(vertical: 13),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Text(
                              "Tambah ",
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
                    widget.routeState
                    ? const SizedBox()
                    : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Ingin Keluar? ",
                          style: TextStyle(
                            color: C3,
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        BlocConsumer<AuthenticationBloc, AuthenticationState>(
                          listener: (context, state) {
                            if (state is LogoutFailureState) {
                              showTopSnackBar(
                                Overlay.of(context),
                                CustomSnackBar.error(message: state.error)
                              );
                            }
                            if (state is LogoutSuccessState) {
                              context.read<AuthenticationBloc>().add(UnAuthenticationEvent());
                            }
                          },
                          builder: (context, state) {
                            return TextButton(
                              onPressed: () {
                                context.read<AuthenticationBloc>().add(IsLogoutEvent());
                              },
                              style: TextButton.styleFrom(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.all(0)),
                              child: Text(
                                " Logout",
                                style: TextStyle(
                                  color: C3,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            );
                          },
                        )

                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}