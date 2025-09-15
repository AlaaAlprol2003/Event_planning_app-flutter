import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/widgets/custom_filled_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isVisiblePassword = true;
  bool isVisibleRePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16,vertical:MediaQuery.of(context).viewInsets.top ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(ImageAssets.eventlyLogo),
              SizedBox(height: 24.h),
              CustomTextFormField(
                labelTitle: "Name",
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                labelTitle: "E-Mail",
                prefixIcon: Icon(Icons.email),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                isObscure: isVisiblePassword,
                labelTitle: "Password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: changePasswordVisibilityState,
                  icon: Icon(
                    isVisiblePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                isObscure: isVisibleRePassword,
                labelTitle: "Re-Password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: changeRePasswordVisibilityState,
                  icon: Icon(
                    isVisibleRePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 16.h),
              CustomFilledButton(text: "Create Account", onpress: () {}),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have Account ?  ",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Text(
                      "Login",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ColorsManager.blue,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                        decorationColor: ColorsManager.blue,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changePasswordVisibilityState() {
    setState(() {
      isVisiblePassword = !isVisiblePassword;
    });
  }

  void changeRePasswordVisibilityState() {
    setState(() {
      isVisibleRePassword = !isVisibleRePassword;
    });
  }
}
