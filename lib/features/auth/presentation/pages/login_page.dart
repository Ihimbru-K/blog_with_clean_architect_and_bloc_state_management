import 'dart:html';

import 'package:bloggy/core/theme/colors.dart';
import 'package:bloggy/features/auth/presentation/pages/signup.dart';
import 'package:bloggy/features/auth/presentation/widgets/auth_field.dart';
import 'package:bloggy/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static route() => MaterialPageRoute(builder: (context) => const LoginPage());

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        body: Padding(padding: EdgeInsets.all(15),
            child: Center(
              child: Form(    // Validates widgets under the widget tree
                key: formKey,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    const Text("Sign In", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 30,),
                    AuthField(hintText: 'Email', controller: emailController,),
                    const SizedBox(height: 15,),
                    AuthField(hintText: 'Password',controller: passwordController, isObscureText: true,),
                    const SizedBox(height: 20,),
                    const  AuthGradientButton(buttonText: "Sign In",),
                    const SizedBox(height: 20),
   GestureDetector(
    onTap: (){Navigator.push(context, SignUp.route());},
     child:  RichText(text: TextSpan(text: 'Don\'t have an account? ',
       style: Theme.of(context).textTheme.titleMedium,
       children: [

         TextSpan(text: 'Sign Up', style: Theme.of(context).textTheme.titleMedium?.copyWith(

             color: AppColor.gradient2,
             fontWeight: FontWeight.bold
         ),)
       ]

   )),)




                  ],
                ),),
            )
        )
    );
  }
}
