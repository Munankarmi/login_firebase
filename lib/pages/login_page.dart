// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:login_firebasep/pages/my_text.dart';
// import 'package:login_firebasep/pages/my_textfield.dart';
// import 'package:login_firebasep/pages/register_page.dart';
// import 'package:login_firebasep/pages/signin_button.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   // void signinButton() async {
//   //   showDialog(
//   //     context: context,
//   //     builder: (context) {
//   //       return const Center(child: CircularProgressIndicator());
//   //     },
//   //   );

//   //   try {
//   //     await FirebaseAuth.instance.signInWithEmailAndPassword(
//   //       email: emailController.text.trim(),
//   //       password: passwordController.text.trim(),
//   //     );
//   //     Navigator.pop(context);
//   //   } on FirebaseAuthException catch (e) {
//   //     Navigator.pop(context);

//   //     if (e.code == 'user-not-found') {
//   //       wrongEmail();
//   //       print("wrong email on catch block");
//   //     } else if (e.code == 'wrong-password') {
//   //       wrongPassword();
//   //       print("worng pw in catch block");
//   //     }
//   //   }
//   // }
//   void signinButton() async {
//   showDialog(
//     barrierDismissible: false,
//     context: context,
//     builder: (context) => const Center(child: CircularProgressIndicator()),
//   );

//   try {
//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//     );
//     Navigator.pop(context); // remove loading dialog
//     // AuthPage's StreamBuilder will handle navigation to HomePage
//   } on FirebaseAuthException catch (e) {
//     if (!mounted) return;
//     Navigator.pop(context); // remove loading dialog

//     if (e.code == 'user-not-found') {
//       wrongEmail();
//     } else if (e.code == 'wrong-password') {
//       wrongPassword();
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: const Text("Login Failed"),
//           content: Text(e.message ?? "An unknown error occurred."),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("OK"),
//             ),
//           ],
//         ),
//       );
//     }
//   }
// }


//   void wrongEmail() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const AlertDialog(title: Text("Wrong Email"));
//       },
//     );
//     print("wrong email original method");
//   }

//   void wrongPassword() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const AlertDialog(title: Text("Wrong Password"));
//       },
//     );
//     print("wrong pw original method");
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 40),
//             //logo
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Icon(Icons.accessibility_new, size: 100),
//             ),
//             SizedBox(height: 20),

//             //welcome back you have been missed
//             MyText(text: 'Welcome Back'),
//             MyText(text: 'you were missed'),
//             //username textfield
//             SizedBox(height: 20),

//             MyTextfield(
//               textController: emailController,
//               hintText: 'Email',
//               obscureTextPW: false,
//             ),
//             //password textfield
//             SizedBox(height: 8),
//             MyTextfield(
//               textController: passwordController,
//               hintText: 'Password',
//               obscureTextPW: true,
//             ),
//             // forgot password?
//             SizedBox(height: 2),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     "forgot password?",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//               ],
//             ),
//             // sign in button
//             SizedBox(height: 20),
//             SigninButton(onTap: signinButton),
//             // or continue witj
//             SizedBox(height: 40),
//             Row(
//               children: [
//                 Expanded(child: Divider(thickness: 1, color: Colors.black)),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     "or continue with",
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ),
//                 Expanded(child: Divider(thickness: 1, color: Colors.black)),
//               ],
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.mail, size: 100, color: Colors.black),
//                 ),
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.apple, size: 100, color: Colors.black),
//                 ),
//               ],

//               //google + android button
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'not a member ?',
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => RegisterPage()),
//                     );
//                   },
//                   child: Text(
//                     'Register now',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ),
//               ],
//             ),

//             // not a member? register now
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_firebasep/pages/home_page.dart';
import 'package:login_firebasep/pages/my_text.dart';
import 'package:login_firebasep/pages/my_textfield.dart';
import 'package:login_firebasep/pages/register_page.dart';
import 'package:login_firebasep/pages/signin_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  void signinButton() async {
    // Prevent multiple simultaneous login attempts
    if (isLoading) return;
    
    // Basic validation
    if (emailController.text.trim().isEmpty || passwordController.text.trim().isEmpty) {
      showErrorDialog('Please fill in all fields');
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),

      );
      // No need to navigate here - StreamBuilder will handle it automatically
    } on FirebaseAuthException catch (e) {
      String errorMessage = getFirebaseErrorMessage(e.code);
      showErrorDialog(errorMessage);
    } catch (e) {
      showErrorDialog('An unexpected error occurred. Please try again.');
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  String getFirebaseErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'No user found with this email address.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'too-many-requests':
        return 'Too many failed attempts. Please try again later.';
      case 'invalid-credential':
        return 'Invalid email or password. Please check your credentials.';
      case 'network-request-failed':
        return 'Network error. Please check your internet connection.';
      default:
        return 'Login failed. Please try again.';
    }
  }

  void showErrorDialog(String message) {
    if (!mounted) return;
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Login Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  /* void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Logo
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.accessibility_new, size: 100),
            ),
            const SizedBox(height: 20),

            // Welcome back messages
            const MyText(text: 'Welcome Back'),
            const MyText(text: 'you were missed'),
            const SizedBox(height: 20),

            // Email textfield
            MyTextfield(
              textController: emailController,
              hintText: 'Email',
              obscureTextPW: false,
            ),
            const SizedBox(height: 8),
            
            // Password textfield
            MyTextfield(
              textController: passwordController,
              hintText: 'Password',
              obscureTextPW: true,
            ),
            const SizedBox(height: 2),
            
            // Forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // TODO: Implement forgot password functionality
                  },
                  child: const Text(
                    "forgot password?",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Sign in button with loading state
            isLoading
                ? const CircularProgressIndicator()
                : SigninButton(onTap: signinButton),
            
            const SizedBox(height: 40),
            
            // Divider
            Row(
              children: [
                const Expanded(child: Divider(thickness: 1, color: Colors.black)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "or continue with",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const Expanded(child: Divider(thickness: 1, color: Colors.black)),
              ],
            ),
            const SizedBox(height: 20),
            
            // Social login buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // TODO: Implement Google sign-in
                  },
                  icon: const Icon(Icons.mail, size: 100, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {
                    // TODO: Implement Apple sign-in
                  },
                  icon: const Icon(Icons.apple, size: 100, color: Colors.black),
                ),
              ],
            ),
            
            // Register link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'not a member ?',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                    );
                  },
                  child: const Text(
                    'Register now',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}