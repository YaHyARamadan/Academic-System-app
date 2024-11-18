import 'package:flutter/material.dart';
import 'package:gradu/core/routes/routes.dart';
import '../../../core/style/my_text_style.dart';
import '../../../core/widgets/custom_text.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key, required this.subjectName});

  final String subjectName;

  lecNavigator(subjectName, context) {
    switch (subjectName) {
      case "C++":
        Navigator.of(context).pushNamed(AppRoutes.cPlusScreen);
        break;
      case "Database":
        Navigator.of(context).pushNamed(AppRoutes.dataBaseScreen);
        break;
      case "Linux":
        Navigator.of(context).pushNamed(AppRoutes.linuxScreen);
        break;
      case "    Digital\nEngineering":
        Navigator.of(context).pushNamed(AppRoutes.digitalScreen);
        break;
      case "OS":
        Navigator.of(context).pushNamed(AppRoutes.osScreen);
        break;
      case "Web":
        Navigator.of(context).pushNamed(AppRoutes.webScreen);
        break;
    }
  }

  tutorialsNavigator(subjectName, context) {
    switch (subjectName) {
      case "C++":
        Navigator.of(context).pushNamed(AppRoutes.cPlusTutorialScreen);
        break;
      case "Database":
        Navigator.of(context).pushNamed(AppRoutes.dataBaseTutorialScreen);
        break;
      case "Linux":
        Navigator.of(context).pushNamed(AppRoutes.linuxTutorialScreen);
        break;
      case "    Digital\nEngineering":
        Navigator.of(context).pushNamed(AppRoutes.digitalTutorialScreen);
        break;
      case "OS":
        Navigator.of(context).pushNamed(AppRoutes.osTutorialScreen);
        break;
      case "Web":
        Navigator.of(context).pushNamed(AppRoutes.webTutorialScreen);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
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
              lecNavigator(subjectName, context);
            },
          ),
          CategoriesContainer(
            imgPath:
                'assets/img/subjects_screen/463623950-removebg-preview.png',
            title: 'Tutorials',
            scale: 3.3,
            onTap: () {
              tutorialsNavigator(subjectName, context);
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

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({
    super.key,
    required this.imgPath,
    required this.title,
    this.scale,
    required this.onTap,
  });

  final String imgPath;
  final String title;
  final double? scale;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.2,
          decoration: BoxDecoration(
              color: const Color(0xffF2F2F4),
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              Image.asset(
                imgPath,
                scale: scale,
              ),
              const VerticalDivider(
                thickness: 0.4,
                color: Colors.black,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              CustomText(
                  text: title,
                  style: MyTextStyle.kanit24Size400Weight
                      .copyWith(fontWeight: FontWeight.w600))
            ],
          ),
        ),
      ),
    );
  }
}
