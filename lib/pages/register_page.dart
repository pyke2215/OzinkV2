import 'package:flutter/material.dart';
import 'package:fooddelivtute/services/auth/auth_service.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();

}

class _RegisterPageState extends State<RegisterPage> {
  // text editting controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // rergister method
  void register() async {

    // get auth service
    final _authService = AuthService();

    // kiểm tra nếu mật khẩu khớp sẽ tạo user
    if (passwordController.text == confirmPasswordController.text) {
      // cố tạo user
      try {
        await _authService.signUpWithEmailAndPassword(
          emailController.text,
          passwordController.text,
        );
      }

      // hiển thị lỗi
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    // pass ko khớp báo lỗi
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Mật khẩu không khớp!"),
        ),
      );
    }
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
                      "Hãy tạo acc nào",
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
                          
                    const SizedBox(height: 10),
                          
                    // Nhập lại pass
                    MyTextField(controller: confirmPasswordController, hintText: "xác nhận Mật Khẩu", obscureText: true),
                          
                    const SizedBox(height: 25),
                          
                    // Nút đăng Kí
                    MyButton(
                      text: "Đăng Ký",
                      onTap: register,
                    ),
                          
                    const SizedBox(height: 25),
                          
                    // Đã có tài khoản? Đăng nhập ngay
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Đã có tài khoản?",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.inversePrimary),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                            onTap: widget.onTap,
                            child: Text(
                              "Đăng nhập ngay",
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