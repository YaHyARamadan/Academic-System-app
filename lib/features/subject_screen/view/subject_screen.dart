import 'package:flutter/material.dart';
import 'package:gradu/core/routes/routes.dart';
import 'package:gradu/features/subject_screen/view/widgets/categories_container.dart';
import 'package:gradu/features/subject_screen/view_model/navigator_provider.dart';
import 'package:provider/provider.dart';
import '../../../core/style/my_text_style.dart';
import '../../../core/widgets/custom_text.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key, required this.subjectName});

  final String subjectName;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<NavigatorProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
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
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                        size: 32,
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
          CategoriesContainer(
            imgPath:
                'assets/img/subjects_screen/man-speaking-at-conference-free-vector-removebg-preview.png',
            title: 'Lectures',
            scale: 1,
            onTap: () {
              provider.lecNavigator(subjectName, context);
            },
          ),
          CategoriesContainer(
            imgPath:
                'assets/img/subjects_screen/463623950-removebg-preview.png',
            title: 'Tutorials',
            scale: 3.3,
            onTap: () {
              provider.tutorialsNavigator(subjectName, context);
            },
          ),
          CategoriesContainer(
            imgPath:
                'assets/img/subjects_screen/people-checking-giant-check-list-background_23-2148085522-removebg-preview.png',
            title: 'Assignment',
            scale: 0.3,
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.assignmentScreen);
            },
          ),
        ],
      ),
    );
  }
}

