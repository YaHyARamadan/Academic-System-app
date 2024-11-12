import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradu/features/auth_screen/register_screen/view_model/register_provider.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/style/my_text_style.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.sizeOf(context).width;
    var mediaHeight = MediaQuery.sizeOf(context).height;
    var provider = Provider.of<RegisterProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff11a7a4),
      body: SafeArea(
        child: Form(
          key: provider.formKey,
          child: SizedBox(
            height: mediaHeight,
            width: mediaWidth,
            child: Stack(
              children: [
                Positioned(
                  right: mediaWidth * 0,
                  bottom: mediaHeight * 0,
                  child: Image.asset("assets/img/auth_screen/Ellipse 5.png"),
                ),
                Positioned(
                  right: mediaWidth * 0,
                  bottom: mediaHeight * 0,
                  child: SvgPicture.asset(
                    "assets/img/auth_screen/Ellipse 6.svg",
                  ),
                ),
                Positioned(
                  top: mediaHeight * 0.05,
                  left: mediaHeight * 0.020,
                  child: Container(
                    width: 80,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xff81E2E0),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  top: 3,
                  right: 70,
                  child: Container(
                    alignment: Alignment.center,
                    width: 180,
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Color(0xff81E2E0),
                      shape: BoxShape.circle,
                    ),
                    child: CustomText(
                      text: "R",
                      style: MyTextStyle.kanit24Size400Weight.copyWith(
                        fontSize: 120,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 30,
                  child: SizedBox(
                    width: mediaWidth * 1,
                    height: mediaHeight * 1,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextForm(
                              title: 'Enter Your Email',
                              hint: 'Enter Your Email',
                              textEditingController: provider.emailController,
                              textInputType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextForm(
                              title: 'Enter Password',
                              hint: 'Enter Your Password',
                              textEditingController:
                                  provider.passWordController,
                              textInputType: TextInputType.text,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 80,
                  child: SizedBox(
                    width: mediaWidth * 1,
                    height: mediaHeight * 1,
                    child: Row(
                      children: [
                        SizedBox(
                          width: mediaWidth * 0.3,
                          child: const Divider(
                            height: 1,
                            color: Colors.black,
                            thickness: 0.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CustomText(
                              text: "OR",
                              style: MyTextStyle.konkhmer40Size400Weight
                                  .copyWith(fontSize: 14)),
                        ),
                        SizedBox(
                          width: mediaWidth * 0.3,
                          child: const Divider(
                            height: 1,
                            color: Colors.black,
                            thickness: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 210,
                  left: 80,
                  child: Row(
                    children: [
                      PlatformRegisterButton(
                        imgPath: 'assets/img/auth_screen/facebook.png',
                        title: 'Facebook',
                        color: const Color(0xff0C83E8),
                        onTap: () {
                          provider.signInWithFacebook(context);
                        },
                      ),
                      const SizedBox(width: 27),
                      PlatformRegisterButton(
                        imgPath: 'assets/img/auth_screen/search.png',
                        title: 'Google',
                        color: const Color(0xff676464),
                        onTap: () async {
                          await provider.signInWithGoogle(context);
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 100,
                  right: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        if (provider.formKey.currentState!.validate()) {
                          provider.register(
                              email: provider.emailController.text,
                              password: provider.passWordController.text,
                              context: context);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(const Color(0xff26CCC9)),
                        padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 8)),
                      ),
                      child: CustomText(
                          text: 'Register',
                          style: MyTextStyle.kanit24Size400Weight
                              .copyWith(color: Colors.white, fontSize: 28))),
                ),
                Positioned(
                  bottom: 75,
                  right: 75,
                  child: Row(
                    children: [
                      CustomText(
                          text: "I Have Account  ",
                          style: MyTextStyle.konkhmer40Size400Weight.copyWith(
                              fontSize: 14, color: const Color(0xff26CCC9))),
                      InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.loginScreen);
                          },
                          child: CustomText(
                              text: "Login",
                              style: MyTextStyle.konkhmer40Size400Weight
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900)))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlatformRegisterButton extends StatelessWidget {
  const PlatformRegisterButton({
    super.key,
    required this.imgPath,
    required this.title,
    required this.color,
    required this.onTap,
  });

  final String imgPath;
  final String title;
  final GestureTapCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            imgPath,
            scale: 15,
          ),
          const SizedBox(width: 2),
          CustomText(
              text: title,
              style: MyTextStyle.kanit24Size400Weight.copyWith(color: color))
        ],
      ),
    );
  }
}
