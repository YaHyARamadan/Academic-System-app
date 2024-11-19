import 'package:flutter/material.dart';
import 'package:gradu/core/routes/routes.dart';
import 'package:gradu/core/style/my_text_style.dart';
import 'package:gradu/core/widgets/custom_text.dart';
import 'package:gradu/features/main_screen/view/widgets/subject_container.dart';
import 'package:gradu/features/subject_screen/view/subject_screen.dart';
import 'package:provider/provider.dart';

import '../../auth_screen/login_screen/view_model/login_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: const BoxDecoration(
              color: Color(0xff11A7A4),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25)),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext dialogContext) {
                            return AlertDialog(
                              backgroundColor: const Color(0xff11A7A4),
                              title: CustomText(
                                text: "Are You Sure You Want To Logout",
                                style: MyTextStyle.kanit24Size400Weight.copyWith(color: Colors.white),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child:  CustomText(
                                    text: "Cancel",
                                    style: MyTextStyle.cairo20Size500Weight.copyWith(color: Colors.red),
                                  ),
                                  onPressed: () {
                                    Navigator.of(dialogContext)
                                        .pop(); // Dismiss alert dialog
                                  },
                                ),
                                TextButton(
                                  child:  CustomText(
                                    text: "Sure",
                                    style: MyTextStyle.cairo20Size500Weight.copyWith(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    provider.logout(context: context);
                                  },
                                ),
                              ],
                            );
                          },
                        );

                      },
                      icon: Image.asset(
                        "assets/img/main_screen/logout.png",
                        scale: 20,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    CustomText(
                      text: " Hi, Programmer",
                      style: MyTextStyle.konkhmer40Size400Weight.copyWith(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 45,
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Image.asset(
                                "assets/img/main_screen/search.png"),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: Colors.lightBlueAccent),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CustomText(
            text: "   Courses",
            style: MyTextStyle.kanit24Size400Weight.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height * 0.5),
              children: const [
                SubjectContainer(
                  imgPath: 'assets/img/main_screen/c++.png',
                  title: "C++",
                  scale: 12,
                ),
                SubjectContainer(
                    imgPath: 'assets/img/main_screen/DataBase.png',
                    title: "Database",
                    scale: 0.5),
                SubjectContainer(
                    imgPath: 'assets/img/main_screen/Digital_Enginner.png',
                    title: "    Digital\nEngineering",
                    scale: 5),
                SubjectContainer(
                    imgPath: 'assets/img/main_screen/Linux.png',
                    title: "Linux",
                    scale: 1.05),
                SubjectContainer(
                    imgPath: 'assets/img/main_screen/operating-system.png',
                    title: "OS",
                    scale: 4),
                SubjectContainer(
                  imgPath: 'assets/img/main_screen/web.png',
                  title: "Web",
                  scale: 1.5,
                  height: 20,
                  height1: 7,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
        ],
      ),
    );
  }
}
