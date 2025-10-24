// ignore_for_file: unused_local_variable, unused_catch_clause

import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/resources/validators.dart';
import 'package:evently_app/core/routes_manager/routes_manager.dart';
import 'package:evently_app/core/ui_utils/ui_utils.dart';
import 'package:evently_app/core/widgets/custom_filled_button.dart';
import 'package:evently_app/core/widgets/custom_text_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/firebase/firebase_services.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/models/login_request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool securePassword = true;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.only(
              left: 12.w,
              right: 12.w,
              top: 20.h,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(ImageAssets.eventlyLogo),
                  SizedBox(height: 24.h),
                  CustomTextFormField(
                    prefixIcon: Icon(Icons.email),
                    labelTitle: appLocalizations.email,
                    validator: Validators.emailValidator,
                    controller: _emailController,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    isObscure: securePassword,

                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: changePasswordVisibilityState,
                      icon: Icon(
                        securePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    labelTitle: appLocalizations.password,
                    validator: Validators.passwordValidator,
                    controller: _passwordController,
                  ),
                  SizedBox(height: 16.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomTextButton(
                      title: appLocalizations.forget_password,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 24.h),
                  CustomFilledButton(
                    text: appLocalizations.login,
                    onpress: _onLoginButtonClicked,
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${appLocalizations.donot_have_account}  ",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      CustomTextButton(
                        title: appLocalizations.create_account,

                        decoration: TextDecoration.underline,
                        fontStyle: FontStyle.italic,
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            RoutesManager.register,
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 34.h),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: ColorsManager.blue,
                          thickness: 1,
                          indent: 42.w,
                          endIndent: 16.w,
                        ),
                      ),
                      Text(
                        appLocalizations.or,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.blue,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: ColorsManager.blue,
                          thickness: 1,
                          indent: 16.w,
                          endIndent: 42.w,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),
                  OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImageAssets.googleIcon),
                        SizedBox(width: 5.w),
                        Text(
                          appLocalizations.login_with_google,
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: ColorsManager.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void changePasswordVisibilityState() {
    setState(() {
      securePassword = !securePassword;
    });
  }

  void _onLoginButtonClicked() async {
    if (_formKey.currentState?.validate() == false) return;
    try{
      UiUtils.showLoadingDialog(context);
    UserCredential userCredential = await FirebaseServices.login(LoginRequest(email: _emailController.text,password: _passwordController.text));
    UiUtils.hideLoadingDialog(context);
    UiUtils.showToastificationBar(context, "Logged-In Successfully", ColorsManager.white, Colors.green,Icons.check_circle, ToastificationType.success);
    Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
    }on FirebaseAuthException catch (exception){
      UiUtils.hideLoadingDialog(context);
      UiUtils.showToastificationBar(context, "Invalid Email or Password", Colors.white, ColorsManager.red, Icons.error, ToastificationType.error);
    }catch(ex){
      UiUtils.hideLoadingDialog(context);
      UiUtils.showToastificationBar(context, "Faild To Login", Colors.white, ColorsManager.red, Icons.error, ToastificationType.error);
      
    }
    
    
  }
}
