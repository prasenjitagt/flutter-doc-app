import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medi/views/forgot_pass.dart';
import 'package:medi/views/signup_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //password obscure changer with the eye icon eg. ****
  bool _isobscureText = true;
  void changePasswordObscure() {
    setState(() {
      _isobscureText = !_isobscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Text("You can search clinic and book appointment",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(FontAwesomeIcons.google),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: const Text("Google",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(FontAwesomeIcons.facebookF),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: const Text(
                                "Facebook",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.green,
                            ),
                            hintText: "Email",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.green)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.black26))),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _isobscureText,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.password,
                              color: Colors.green,
                            ),
                            suffixIcon: GestureDetector(
                                onTap: changePasswordObscure,
                                child: _isobscureText
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.green,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.green,
                                      )),
                            hintText: "Password",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.green)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.black26))),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      width: 200,
                      child: const TextButton(
                          onPressed: null,
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => const ForgotPass());
                        },
                        child: const Text("Forgot Password!",
                            style: TextStyle(color: Colors.green))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                        TextButton(
                            onPressed: () {
                              Get.to(() => const SignUp());
                            },
                            child: const Text("Sing up",
                                style: TextStyle(color: Colors.green)))
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
