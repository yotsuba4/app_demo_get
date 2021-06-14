import 'package:app_demo_get/components/form-error.dart';
import 'package:app_demo_get/controllers/auth-controller.dart';

import 'package:app_demo_get/helper/keyboard.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/shared/form-error.dart';
import 'package:flutter/material.dart';

import '../../../components/default-button.dart';
import '../../../size_config.dart';
import 'package:get/get.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String username;
  String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildUsernameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: AppColor.primary,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("keep_login".tr),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "forgot_password".tr,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "next".tr,
            press: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                KeyboardUtil.hideKeyboard(context);
                AuthController.instance.signIn(username, password);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "password".tr,
        hintText: "enter_password".tr,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
      ),
    );
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => username = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kUserNameNullError);
        } else if (userNameValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidUserNameError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kUserNameNullError);
          return "";
        } else if (!userNameValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidUserNameError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "user_name".tr,
          hintText: "enter_user_name".tr,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.account_box)),
    );
  }
}
