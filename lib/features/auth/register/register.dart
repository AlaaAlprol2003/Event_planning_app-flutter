import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/validators.dart';
import 'package:evently_app/core/routes_manager/routes_manager.dart';
import 'package:evently_app/core/widgets/custom_filled_button.dart';
import 'package:evently_app/core/widgets/custom_text_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isVisiblePassword = true;
  bool isVisibleRePassword = true;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _rePasswordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text(appLocalizations.register)),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.only(
            left: 12,
            right: 12,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(ImageAssets.eventlyLogo),
                SizedBox(height: 24.h),
                CustomTextFormField(
                  controller: _nameController,
                  validator: Validators.nameValidator,
                  labelTitle:appLocalizations.name,
                  prefixIcon: Icon(Icons.person),
                ),
                SizedBox(height: 16.h),
                CustomTextFormField(
                  controller: _emailController,
                  validator: Validators.emailValidator,
                  labelTitle:appLocalizations.email,
                  prefixIcon: Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16.h),
                CustomTextFormField(
                  controller: _passwordController,
                  validator: Validators.passwordValidator,
                  isObscure: isVisiblePassword,
                  labelTitle: appLocalizations.password,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: changePasswordVisibilityState,
                    icon: Icon(
                      isVisiblePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 16.h),
                CustomTextFormField(
                  controller: _rePasswordController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return "This field is required";
                    }
                    if (input != _passwordController.text) {
                      return "Password does't match";
                    }
                    return null;
                  },
                  isObscure: isVisibleRePassword,
                  labelTitle: appLocalizations.repassword,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: changeRePasswordVisibilityState,
                    icon: Icon(
                      isVisibleRePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 16.h),
                CustomFilledButton(
                  text:appLocalizations.create_account,
                  onpress: _onCreateAccountClicked,
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                     "${appLocalizations.already_have_account}  ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    CustomTextButton(
                      title:appLocalizations.login,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RoutesManager.login,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
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

  void _onCreateAccountClicked() {
    if (_formKey.currentState?.validate() == false) return;
  }
}
