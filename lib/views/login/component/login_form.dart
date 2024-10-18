import 'package:crawler_web/global/global_data.dart';
import 'package:crawler_web/presenters/user_presenter.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.userPresenter});

  final UserPresenter userPresenter;

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
          controller: widget.userPresenter.usernameController,
          decoration: const InputDecoration(labelText: 'Tên đăng nhập'),
        ),
        TextField(
          controller: widget.userPresenter.passwordController,
          decoration: const InputDecoration(labelText: 'Mật khẩu'),
          obscureText: true,
        ),
        if (widget.userPresenter.message.isNotEmpty)
          Text(
            widget.userPresenter.message,
            style: const TextStyle(color: Colors.red),
          ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            widget.userPresenter.login(() {
              setState(() {});
            }).then((user) => {
              if (user != null) {
                // Lưu user vào biến toàn cục
                userLogin = user,

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
