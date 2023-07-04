import 'package:fakenews2/api/api_manger.dart';
import 'package:fakenews2/providers/appConfigProvider.dart';
import 'package:fakenews2/ui/dialog_utils.dart';
import 'package:fakenews2/ui/home/home_screen.dart';
import 'package:fakenews2/ui/widget/custom_form_field.dart';
import 'package:fakenews2/ui/widget/form_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(28),
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(
          'assets/images/Group3.png',
        ),
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Spacer(),
            Text(
              'Welcome Back',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontFamily: 'outfit',
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomFormField(
                    'EmailAddrees',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please enter email";
                      }
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomFormField(
                    'password',
                    controller: passwordController,
                    hideText: true,
                    validator: (text) {
                      if (text == null || text!.trim().isEmpty) {
                        return "Please enter password";
                      }
                    },
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    child: FormSubmitButton(
                        text: 'SIGN IN',
                        onPressed: () {
                          login();
                        }),
                  )
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  void login() async {
    AppConfigProvider appConfig =
        Provider.of<AppConfigProvider>(context, listen: false);

    //validate form
    if (formKey.currentState?.validate() == false) {
      return;
    }
    try {
      showLoading(context, 'loading..');

      var response = await ApiManger.login(
        emailController.text,
        passwordController.text,
      );
      hideLoading(
        context,
      );

      if (response.statusMsg == 'error') {
        showMessage(context, response.message ?? "", posActionName: 'Ok');
      } else {
        appConfig.updateToken(response.token);
        showMessage(context, 'succesful login', posActionName: 'Ok',
            negAction: () {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        }
            //click
            );
      }
      //  DialogUtils.showMessage(context, response.token??'',
      //    postActionTitle: 'Ok');
    } catch (e) {
      hideLoading(context);
      showMessage(context, 'some thing went error  ${e.toString()}',
          posActionName: 'Ok');
    }
  }
}
