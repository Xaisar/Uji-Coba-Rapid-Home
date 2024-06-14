import 'package:flutter/material.dart';

import '../../../homeIndex/bloc/cubit/index_customer_cubit/index_customer_cubit.dart';
import '../../../../route/routes_name.dart';
import '../../../../theme/pallet_color.dart';
import '../../../homeIndex/model/user_model.dart';

// ignore: must_be_immutable
class BottomSheetCustomerSetting extends StatefulWidget {
  BottomSheetCustomerSetting({
    super.key,
    required this.indexCustomerCubit,
    required this.indexCustomer,
    required this.user
  });
  
  IndexCustomerCubit indexCustomerCubit;
  int indexCustomer;
  User user;

  @override
  State<BottomSheetCustomerSetting> createState() => _BottomSheetCustomerSettingState();
}

class _BottomSheetCustomerSettingState extends State<BottomSheetCustomerSetting> {

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: widget.user.customers.length > 3
            ? MediaQuery.of(context).size.height * 0.5  
            : null,
          padding: const EdgeInsets.symmetric(
            vertical: 10
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: C3,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              //slider line
              Container(
                width: MediaQuery.of(context).size.width * 0.116,
                height: 2,
                decoration: BoxDecoration(
                  color: const Color(0xFFAFACAC),
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              //header bottom sheet
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: C13,
                      width: 1,
                    )
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: C6,
                        size: 13 *2,
                      )
                    ),
                    Text(
                      "Pilih Customer",
                      style: TextStyle(
                        color: C6,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(
                      width: 13 * 2,
                    )
                  ],
                ),
              ),
              //body bottom sheet
              widget.user.customers.length > 3
              ? Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: C13,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisSize: widget.user.customers.length > 3 
                        ? MainAxisSize.max
                        : MainAxisSize.min,
                      children: List.generate(widget.user.customers.length, (index) {
                        return Container(
                          margin: EdgeInsets.only(
                            top: index != 0 ? 2 : 0
                          ),
                          width: MediaQuery.of(context).size.width,
                          color: index == widget.indexCustomer ? C15 : C3,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 10
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.user.customers[index].name,
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        color: C6,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      widget.user.customers[index].code,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: C6,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      widget.user.customers[index].city,
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        color: C6,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: index == widget.indexCustomer 
                                ? null
                                : (){
                                  setState(() {
                                    widget.indexCustomerCubit.changeCustomer(index);
                                    widget.indexCustomer = index;
                                  });
                                },
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: index == widget.indexCustomer ? const Color(0xFF00C62B) : C3,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: index == widget.indexCustomer ?const Color(0xFF00C62B) :const Color(0xFF6A6868) 
                                    )
                                  ),
                                  child: index == widget.indexCustomer 
                                  ?Icon(
                                    Icons.check_outlined,
                                    color: C3,
                                    size: 8 * 2,
                                  )
                                  : const SizedBox(),
                                ),
                              )
                            ],
                          ),
                        );
                      })
                    ),
                  ),
                ),
              )
              : Container(
                color: C13,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: widget.user.customers.length > 3 
                    ? MainAxisSize.max
                    : MainAxisSize.min,
                  children: List.generate(widget.user.customers.length, (index) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: index != 0 ? 2 : 0
                      ),
                      width: MediaQuery.of(context).size.width,
                      color: index == widget.indexCustomer ? C15 : C3,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.user.customers[index].name,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    color: C6,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  widget.user.customers[index].code,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: C6,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  widget.user.customers[index].city,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    color: C6,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300
                                  ),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: index == widget.indexCustomer
                            ? null
                            : () {
                              setState(() {
                                widget.indexCustomerCubit.changeCustomer(index);
                                widget.indexCustomer = index;
                              });
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: index == widget.indexCustomer ? const Color(0xFF00C62B) : C3,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: index == widget.indexCustomer ?const Color(0xFF00C62B) :const Color(0xFF6A6868) 
                                )
                              ),
                              child: index == widget.indexCustomer 
                              ? Icon(
                                Icons.check_outlined,
                                color: C3,
                                size: 8 * 2,
                              )
                              : const SizedBox(),
                            ),
                          )
                        ],
                      ),
                    );
                  })
                ),
              ),           
              //footer bottom sheet
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: C13,
                      width: 1,
                    )
                  )
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ADDCUSTOMERFROMHOME);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10
                    ),
                    elevation: 0,
                    animationDuration: const Duration(milliseconds: 500),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.add,
                        color: C6,
                        size: 16 *2,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Tambahkan Customer",
                        style: TextStyle(
                          color: C6,
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),
                      ),                 
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
