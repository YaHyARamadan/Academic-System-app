import 'package:flutter/material.dart';
import 'package:gradu/features/auth_screen/login_screen/view_model/login_provider.dart';
import 'package:provider/provider.dart';
import '../../../../core/style/my_text_style.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context);

    var mediaHeight = MediaQuery.sizeOf(context).height;
    var mediaWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: provider.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                      "assets/img/auth_screen/Mobile login-rafiki (1) 1.png",
                      scale: 1.3),
                  CustomText(
                      text: "Login",
                      style: MyTextStyle.konkhmer40Size400Weight),
                  CustomTextForm(
                    title: 'Enter Your Email',
                    hint: 'Enter Your Email',
                    textEditingController: provider.emailController,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: mediaHeight * 0.01),
                  CustomTextForm(
                    title: 'Enter Password',
                    hint: 'Enter Your Password',
                    obscureText: true,
                    textEditingController: provider.passWordController,
                    textInputType: TextInputType.text,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        provider.emailController.clear();
                        provider.passWordController.clear();
                        forgetPasswordSheet(mediaWidth, mediaHeight, context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                            text: "Forget Password",
                            style: MyTextStyle.konkhmer40Size400Weight
                                .copyWith(fontSize: 14, color: Colors.grey)),
                      ),
                    ),
                  ),
                  SizedBox(height: mediaHeight * 0.01),
                  ElevatedButton(
                      onPressed: () {
                        if (provider.formKey.currentState!.validate()) {
                          provider.login(
                              email: provider.emailController.text,
                              password: provider.passWordController.text,
                              context: context);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        WidgetStateProperty.all(const Color(0xff11A7A4)),
                        padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 75, vertical: 8)),
                      ),
                      child: CustomText(
                          text: 'Login',
                          style: MyTextStyle.kanit24Size400Weight
                              .copyWith(color: Colors.white, fontSize: 28))),
                  SizedBox(height: mediaHeight * 0.01),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void forgetPasswordSheet(double mediaWidth, double mediaHeight, BuildContext context) {
    var provider = Provider.of<LoginProvider>(context, listen: false);

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: mediaHeight * 0.4,
          width: mediaWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: mediaHeight * 0.01,
              ),
              CustomText(
                text: "Forget Password",
                style: MyTextStyle.nunito24size800weight,
              ),
              SizedBox(
                height: mediaHeight * 0.01,
              ),
              CustomText(
                  text:
                  "Enter Your Email And We Will Send You\n           Link to Reset Your Password",
                  style: MyTextStyle.lalezar24Size400Weight
                      .copyWith(fontSize: 18, color: Colors.grey)),
              SizedBox(
                height: mediaHeight * 0.02,
              ),
              CustomTextForm(
                title: 'Enter Your Email',
                hint: 'Enter Your Email',
                textEditingController: provider.emailController,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: mediaHeight * 0.04,
              ),
              ElevatedButton(
                  onPressed: () async {
                    provider.resetPassword(provider.emailController, context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    WidgetStateProperty.all(const Color(0xff11A7A4)),
                    padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 75, vertical: 8)),
                  ),
                  child: CustomText(
                      text: 'Send',
                      style: MyTextStyle.kanit24Size400Weight
                          .copyWith(color: Colors.white, fontSize: 28))),
            ],
          ),
        );
      },
    );
  }
}
