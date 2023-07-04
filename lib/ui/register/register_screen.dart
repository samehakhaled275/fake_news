import 'package:fakenews2/api/api_manger.dart';
import 'package:fakenews2/providers/appConfigProvider.dart';
import 'package:fakenews2/ui/dialog_utils.dart';
import 'package:fakenews2/ui/login/login_screen.dart';
import 'package:fakenews2/ui/widget/custom_form_field.dart';
import 'package:fakenews2/ui/widget/form_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

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
              'Register',
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
                    'name',
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please enter full name";
                      }
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
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
                        text: 'REGISTER',
                        onPressed: () {
                          register();
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

  void register() async {
    AppConfigProvider configProvider =
        Provider.of<AppConfigProvider>(context, listen: false);
    //validate form
    if (formKey.currentState?.validate() == false) {
      return;
    }
    showMessage(context, 'loading..');
    try {
      var response = await ApiManger.register(
          nameController.text, emailController.text, passwordController.text);
      hideLoading(
        context,
      );

      if (response.errors != null) {
        showMessage(context, response.mergeErrors(), posActionName: 'Ok');
      } else {
        configProvider.updateToken(response.token);
        //configProvider.updateUser(response?.data);
        showMessage(context, 'succesful login', posActionName: 'Ok',
            posAction: () {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        }, isCancelable: false);
      }
      //DialogUtils.showMessage(context, response.token??'',
      //postActionTitle: 'Ok',
      //onPostActionClicked: (){
      // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      //  Navigator.pushReplacementNamed(context, HomeScreen.ro);
      // }
      // on click??
      // );
    } catch (e) {
      hideLoading(context);
      print(emailController.text);

      showMessage(context, 'some thing went error  ${e.toString()}',
          posActionName: 'Ok');
    }
  }
}
