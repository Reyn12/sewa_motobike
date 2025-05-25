import 'dart:developer';

import 'package:course_motobike/common/info.dart';
import 'package:course_motobike/sources/auth_source.dart';
import 'package:course_motobike/widget/button_primary.dart';
import 'package:course_motobike/widget/button_secondary.dart';
import 'package:course_motobike/widget/input.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final edtName = TextEditingController();
  final edtEmail = TextEditingController();
  final edtPassword = TextEditingController();

  createNewAccount() {
    if (edtName.text == '') return Info.error("Name is required");
    if (edtEmail.text == '') return Info.error("Email is required");
    if (edtPassword.text == '') return Info.error("Password is required");

    Info.netral("Loading ...");

    // Sign Up dari AuthSource
    AuthSource.signUp(edtName.text, edtEmail.text, edtPassword.text).then((
      message,
    ) {
      if (message == "success") {
        Info.success("Account created successfully");
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            log("Navigating to Sign In");
            Navigator.pushReplacementNamed(context, "/signin");
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
            'Sign Up Account',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xff070623),
            ),
          ),
          Gap(30),
          Text(
            'Complete Name',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff070623),
            ),
          ),
          Gap(12),
          Input(
            icon: "assets/ic_profile.png",
            hint: "Write your real name",
            editingController: edtName,
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
          ButtonPrimary(onTap: createNewAccount, text: "Create New Account"),
          Gap(30),
          DottedLine(
            dashLength: 6,
            dashGapLength: 6,
            dashColor: Color.fromARGB(255, 176, 176, 182),
          ),
          Gap(30),
          ButtonSecondary(
            onTap: () {
              Navigator.pushReplacementNamed(context, "/signin");
            },
            text: "Sign In",
          ),
        ],
      ),
    );
  }
}
