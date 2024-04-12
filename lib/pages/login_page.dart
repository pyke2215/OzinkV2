import 'package:flutter/material.dart';
import 'package:fooddelivtute/components/my_button.dart';
import 'package:fooddelivtute/components/my_textfield.dart';
import 'package:fooddelivtute/services/auth/auth_service.dart';


class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editting controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // phương thức đăng nhập
  void login() async {
    // get instance
    final _authService = AuthService();

    // try sign in
    try {
      await _authService.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    }

    // bắt lỗi
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  // forgot password
  void forgotPw() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("User tapped forgot password."),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Icon(
                  Icons.lock_open_rounded,
                  size: 100,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),

                const SizedBox(height: 25),

                // message, slogan
                Text(
                  "App Đặt Đồ Uống",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),

                const SizedBox(height: 25),

                // Nhập email
                MyTextField(controller: emailController, hintText: "Email", obscureText: false),

                const SizedBox(height: 10),

                // Nhập pass
                MyTextField(controller: passwordController, hintText: "Mật Khẩu", obscureText: true),

                const SizedBox(height: 10,),

                // Nút đăng nhập
                MyButton(
                  text: "Đăng Nhập",
                  onTap: login,
                ),

                const SizedBox(height: 25),

                // Chưa có tài khoản? Đăng kí ngay
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Chưa có tài khoản?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Đăng kí ngay",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold,
                          ),
                      )
                    )
                  ],
                )
              ],
            ),
          )
        ),
      )
    );
  }
}