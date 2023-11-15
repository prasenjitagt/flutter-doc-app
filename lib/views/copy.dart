// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:medi/views/login_screen.dart';
// import 'package:medi/views/terms_screen.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   //password obscure changer with the eye icon eg. ****
//   bool _isobscureText = true;
//   void changePasswordObscure() {
//     setState(() {
//       _isobscureText = !_isobscureText;
//     });
//   }

//   //checkbox handler for terms and conditions

//   bool _isBoxChecked = false;
//   void _checkBoxHandler(bool? newValue) {
//     setState(() {
//       _isBoxChecked = newValue!;
//     });
//   }

//   //controllers for text field
//   TextEditingController _userNameController = TextEditingController();
//   TextEditingController _userPhoneController = TextEditingController();
//   TextEditingController _userEmailController = TextEditingController();
//   TextEditingController _userPasswordController = TextEditingController();

//   //current user in firebase
//   User? currentUser = FirebaseAuth.instance.currentUser;

//   // handling signup
//   void _handleSignUp() async {
//     var userName = _userNameController.text.trim();
//     var userPhone = _userPhoneController.text.trim();
//     var userEmail = _userEmailController.text.trim();
//     var userPassword = _userPasswordController.text.trim();
//     if (_isBoxChecked == true) {
//       try {} catch (e) {}

//       FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: userEmail, password: userPassword)
//           .then((value) => {
//                 //printing user created

//                 debugPrint("User created"),

//                 FirebaseFirestore.instance
//                     .collection("users")
//                     .doc(currentUser!.uid)
//                     .set({
//                   'userName': userName,
//                   'userPhone': userPhone,
//                   'userEmail': userEmail,
//                   'timeStamp': DateTime.now(),
//                   'userId': currentUser!.uid,
//                 }).then((value) => {
//                           FirebaseAuth.instance.signOut(),
//                           Get.to(() => const Login())
//                         }),

//                 //printing document created
//                 debugPrint("doc created"),

//                 //
//               })
//           .onError((error, stackTrace) =>
//               {debugPrint("Error! ${error.toString()}")});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("assets/images/bg.png"),
//                   fit: BoxFit.cover)),
//           child: SafeArea(
//             child: Center(
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Join us",
//                       style: TextStyle(
//                         fontSize: 23,
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//                     const Text("You can search clinic and book appointment",
//                         style: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.w500)),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Row(
//                           children: [
//                             const Icon(FontAwesomeIcons.google),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             Container(
//                               child: const Text("Google",
//                                   style: TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w500)),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             const Icon(FontAwesomeIcons.facebookF),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             Container(
//                               child: const Text(
//                                 "Facebook",
//                                 style: TextStyle(
//                                     fontSize: 15, fontWeight: FontWeight.w500),
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                       child: TextField(
//                         controller: _userNameController,
//                         keyboardType: TextInputType.name,
//                         textInputAction: TextInputAction.next,
//                         // autofocus: true,
//                         decoration: InputDecoration(
//                             prefixIcon: const Icon(
//                               Icons.person,
//                               color: Colors.green,
//                             ),
//                             hintText: "Name",
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: const BorderSide(
//                                     width: 2, color: Colors.green)),
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: const BorderSide(
//                                     width: 2, color: Colors.black26))),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                       child: TextField(
//                         controller: _userPhoneController,
//                         keyboardType: TextInputType.phone,
//                         textInputAction: TextInputAction.next,
//                         decoration: InputDecoration(
//                             prefixIcon: const Icon(
//                               Icons.phone,
//                               color: Colors.green,
//                             ),
//                             hintText: "Phone",
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: const BorderSide(
//                                     width: 2, color: Colors.green)),
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: const BorderSide(
//                                     width: 2, color: Colors.black26))),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                       child: TextField(
//                         controller: _userEmailController,
//                         keyboardType: TextInputType.emailAddress,
//                         textInputAction: TextInputAction.next,
//                         decoration: InputDecoration(
//                             prefixIcon: const Icon(
//                               Icons.email,
//                               color: Colors.green,
//                             ),
//                             hintText: "Email",
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: const BorderSide(
//                                     width: 2, color: Colors.green)),
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: const BorderSide(
//                                     width: 2, color: Colors.black26))),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                       child: TextField(
//                         controller: _userPasswordController,
//                         textInputAction: TextInputAction.done,
//                         keyboardType: TextInputType.visiblePassword,
//                         obscureText: _isobscureText,
//                         decoration: InputDecoration(
//                             prefixIcon: const Icon(
//                               Icons.password,
//                               color: Colors.green,
//                             ),
//                             suffixIcon: GestureDetector(
//                                 onTap: changePasswordObscure,
//                                 child: _isobscureText
//                                     ? const Icon(
//                                         Icons.visibility_off,
//                                         color: Colors.green,
//                                       )
//                                     : const Icon(
//                                         Icons.visibility,
//                                         color: Colors.green,
//                                       )),
//                             hintText: "Password",
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: const BorderSide(
//                                     width: 2, color: Colors.green)),
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: const BorderSide(
//                                     width: 2, color: Colors.black26))),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                       child: Row(
//                         children: [
//                           Checkbox(
//                               value: _isBoxChecked,
//                               shape: const CircleBorder(),
//                               onChanged: _checkBoxHandler),
//                           const Text("I agree with the ",
//                               style: TextStyle(
//                                   fontSize: 15, fontWeight: FontWeight.w500)),
//                           GestureDetector(
//                             onTap: () {
//                               Get.to(() => const Terms());
//                             },
//                             child: const Text("Terms and conditions",
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.green)),
//                           )
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           color: Colors.green,
//                           borderRadius: BorderRadius.circular(10)),
//                       width: 200,
//                       child: TextButton(
//                           onPressed: _handleSignUp,
//                           child: const Text(
//                             "Sign Up",
//                             style: TextStyle(color: Colors.white),
//                           )),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text("Have an account? ",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.w500)),
//                         TextButton(
//                             onPressed: () {
//                               Get.off(const Login(),
//                                   transition: Transition.cupertinoDialog,
//                                   duration: Duration(milliseconds: 1000));
//                             },
//                             child: const Text("Log in",
//                                 style: TextStyle(color: Colors.green)))
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           )),
//     );
//   }
// }
