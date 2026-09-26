import 'package:chat_app_final/constant_projet.dart';
import 'package:chat_app_final/helper/show_snack_bar.dart';
import 'package:chat_app_final/screens/chat_screen.dart';
import 'package:chat_app_final/widget/bottomWidget.dart';
import 'package:chat_app_final/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Logingscreen extends StatefulWidget {
  Logingscreen({super.key});

  @override
  State<Logingscreen> createState() => _LogingscreenState();
}

class _LogingscreenState extends State<Logingscreen> {
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  String? email;

  String? password;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: 100),
                Image.asset('assets/images/scholar.png', height: 120),

                Center(
                  child: Text(
                    'Scholar Chat',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'pacifico',
                    ),
                  ),
                ),
                SizedBox(height: 100),

                Row(
                  children: [
                    Text(
                      'Login ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'pacifico',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextFielFormValidator_dWidget(
                  textInside: 'Email',
                  onChanged: (data) {
                    email = data;
                  },
                ),
                SizedBox(height: 10),
                TextFielFormValidator_dWidget(
                  textInside: 'password',
                  onChanged: (data) {
                    password = data;
                  },
                ),
                SizedBox(height: 10),
                Bottomwidget(
                  messageBotom: 'Login',
                  ontap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});

                      try {
                        await loginMethode();
                        Navigator.pushNamed(context, ChatScreen.id);
                        showSnackBar(context, 'welcome to Your area ');
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'user-not-found') {
                          showSnackBar(context, 'User name unvalid');
                        } else if (ex.code == 'wrong-password') {
                          showSnackBar(context, 'the password is not correct');
                        }
                      } catch (ex) {
                        showSnackBar(context, 'There was an error');
                      }
                      isLoading = false;
                      setState(() {});
                    } else {}
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You don't have an account?",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'Sign Up');
                      },
                      child: Text(
                        ' Register',
                        style: TextStyle(
                          color: Color(0xffC7EDE6),
                          fontSize: 15,
                          fontFamily: 'pacifico',
                        ),
                      ),
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

  Future<void> loginMethode() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
