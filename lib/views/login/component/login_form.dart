import 'package:crawler_web/global/global_data.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextField(
          controller: userPresenter.usernameController,
          decoration: const InputDecoration(labelText: 'Tên đăng nhập'),
        ),
        TextField(
          controller: userPresenter.passwordController,
          decoration: const InputDecoration(labelText: 'Mật khẩu'),
          obscureText: true,
        ),
        if (userPresenter.message.isNotEmpty)
          Text(
            userPresenter.message,
            style: const TextStyle(color: Colors.red),
          ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            userPresenter.login(() {
              setState(() {});
            }).then((user) => {
              if (user != null) {
                // Lưu user vào biến toàn cục
                userLogin = user,
                packageUserPresenter.getAllPackageUserOfUser(user.id),

                // Chuyển trang khi đang nhập thành công
                Navigator.pushReplacementNamed(context, '/')
              }
            });
          },
          child: const Text('Đăng nhập'),
        ),
      ],
    );
  }
}
