import 'package:chat_app_final/constant_projet.dart';
import 'package:chat_app_final/helper/show_snack_bar.dart';
import 'package:chat_app_final/screens/chat_screen.dart';
import 'package:chat_app_final/widget/bottomWidget.dart';
import 'package:chat_app_final/widget/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegestretionPage extends StatefulWidget {
  RegestretionPage({super.key});

  @override
  State<RegestretionPage> createState() => _RegestretionPageState();
}

class _RegestretionPageState extends State<RegestretionPage> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

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
                SizedBox(height: 120),

                Row(
                  children: [
                    Text(
                      'Registeration',
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
                  onChanged: (dataEmail) {
                    email = dataEmail;
                  },
                ),
                SizedBox(height: 10),
                TextFielFormValidator_dWidget(
                  textInside: 'password',
                  onChanged: (dataPass) {
                    password = dataPass;
                  },
                ),
                SizedBox(height: 10),
                Bottomwidget(
                  messageBotom: 'Register',
                  ontap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await registrationMethode();
                        Navigator.pushNamed(context, ChatScreen.id);
                        showSnackBar(
                          context,
                          'The account has been activated succefley',
                        );
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          showSnackBar(context, 'The pasword is so week');
                        } else if (ex.code == 'email-already-in-use') {
                          showSnackBar(
                            context,
                            'The account already exists for that email.',
                          );
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
                      'already have an account ? ',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        ' Loging',
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

  Future<void> registrationMethode() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
