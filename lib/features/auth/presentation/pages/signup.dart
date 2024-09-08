import 'dart:html';
import 'dart:js';

import 'package:bloggy/core/theme/colors.dart';
import 'package:bloggy/features/auth/presentation/widgets/auth_field.dart';
import 'package:bloggy/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class SignUp extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignUp());

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(


      ),

      body: Padding(padding: EdgeInsets.all(15),
        child: Center(
          child: Form(    // Validates widgets under the widget tree
            key: formKey,

    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        const Text("Sign Up", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
       const SizedBox(height: 30,),

        AuthField(hintText: 'Name', controller: nameController,),
        const SizedBox(height: 15,),
        AuthField(hintText: 'Email', controller: emailController,),
        const SizedBox(height: 15,),
        AuthField(hintText: 'Password',controller: passwordController, isObscureText: true,),
        const SizedBox(height: 20,),
       const  AuthGradientButton(buttonText:"Sign Up",),
        const SizedBox(height: 20),
        GestureDetector(
          onTap:(){Navigator.push(context, LoginPage.route() ); },


          child: RichText(text: TextSpan(text: 'Already have an account? ',
            style: Theme.of(context).textTheme.titleMedium,
            children: [

              TextSpan(text: 'Sign In', style: Theme.of(context).textTheme.titleMedium?.copyWith(

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
