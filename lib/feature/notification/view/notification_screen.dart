import 'package:flutter/material.dart';

import '../../../theme/pallet_color.dart';
import '../../homeIndex/model/user_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key, required this.user});
  final User user;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          backgroundColor: C1,
          centerTitle: true,
          title: Text(
            "Notification",
            style: TextStyle(
              fontSize: 18,
              color: C3, 
              fontWeight: FontWeight.bold
            ),
          )
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Today notification
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.0466,
                    vertical: MediaQuery.sizeOf(context).height * 0.008
                  ),
                  color: C3,
                  child: Text(
                    "Today",
                    style: TextStyle(
                      color: C6,
                      fontSize: 17,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                // notification section
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(2, (index) {
                    return GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        margin: const EdgeInsets.only(bottom: 3),
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width * 0.0466,
                          vertical: MediaQuery.sizeOf(context).height * 0.0124
                        ),
                        color: index % 2 == 0 ? const Color(0xFF96FF56).withOpacity(0.3): C3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CircleAvatar(
                                backgroundColor: index % 2 == 0? const Color(0xFF006C38) : Colors.transparent,
                                radius: 5
                              ),
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "anda mendapatkan kesempatan untuk bergabung dengan survey kami dalam rangka menjadi bagian dari kami",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: C6,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300
                                    )
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    "3 min ago",
                                    style: TextStyle(
                                      color: index % 2 == 0 ? const Color(0xFF006C38): const Color(0xFF898989),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500
                                    ),
                                  )
                                ],
                              ) 
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.0466,
                    vertical: MediaQuery.sizeOf(context).height * 0.008
                  ),
                  color: C3,
                  child: Text(
                    "Last Week",
                    style: TextStyle(
                      color: C6,
                      fontSize: 17,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                // notification section
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(2, (index) {
                    return GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        margin: const EdgeInsets.only(bottom: 3),
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width * 0.0466,
                          vertical: MediaQuery.sizeOf(context).height * 0.0124
                        ),
                        color: index % 2 == 0 ? const Color(0xFF96FF56).withOpacity(0.3): C3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CircleAvatar(
                                backgroundColor: index % 2 == 0? const Color(0xFF006C38) : Colors.transparent,
                                radius: 5
                              ),
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "anda mendapatkan kesempatan untuk bergabung dengan survey kami dalam rangka menjadi bagian dari kami",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: C6,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300
                                    )
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    "3 min ago",
                                    style: TextStyle(
                                      color: index % 2 == 0 ? const Color(0xFF006C38): const Color(0xFF898989),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500
                                    ),
                                  )
                                ],
                              ) 
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}