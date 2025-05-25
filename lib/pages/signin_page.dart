import 'dart:developer';

import 'package:course_motobike/common/info.dart';
import 'package:course_motobike/sources/auth_source.dart';
import 'package:course_motobike/widget/button_primary.dart';
import 'package:course_motobike/widget/button_secondary.dart';
import 'package:course_motobike/widget/input.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final edtEmail = TextEditingController();
  final edtPassword = TextEditingController();

  signInAccount() {
    if (edtEmail.text == '') return Info.error("Email is required");
    if (edtPassword.text == '') return Info.error("Password is required");

    Info.netral("Loading ...");

    // Sign In dari AuthSource
    AuthSource.signIn(edtEmail.text, edtPassword.text).then((message) {
      if (message == "success") {
        Info.success("Account created successfully");
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            log("Navigating to Dashboard");
            Navigator.pushReplacementNamed(context, "/discover");
          }
        });
      } else {
        Info.error(message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        children: [
          Gap(100),
          Image.asset("assets/logo_text.png", height: 38, width: 171),
          Gap(70),
          Text(
            'Sign In Account',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xff070623),
            ),
          ),
          Gap(30),
          Text(
            'Email Address',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff070623),
            ),
          ),
          Gap(12),
          Input(
            icon: "assets/ic_email.png",
            hint: "Write your real email",
            editingController: edtEmail,
          ),
          Gap(30),
          Text(
            'Password',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff070623),
            ),
          ),
          Gap(12),
          Input(
            icon: "assets/ic_key.png",
            hint: "Write your password",
            editingController: edtPassword,
            obsecure: true,
          ),
          Gap(60),
          ButtonPrimary(onTap: signInAccount, text: "Sign In"),
          Gap(30),
          DottedLine(
            dashLength: 6,
            dashGapLength: 6,
            dashColor: Color.fromARGB(255, 176, 176, 182),
          ),
          Gap(30),
          ButtonSecondary(
            onTap: () {
              Navigator.pushReplacementNamed(context, "/signup");
            },
            text: "Create New Account",
          ),
        ],
      ),
    );
  }
}
