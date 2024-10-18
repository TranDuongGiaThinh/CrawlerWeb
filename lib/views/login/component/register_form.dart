import 'package:crawler_web/global/global_data.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: userPresenter.fullnameController,
            decoration: const InputDecoration(labelText: 'Họ và tên'),
          ),
          TextField(
            controller: userPresenter.usernameController,
            decoration: const InputDecoration(labelText: 'Tên đăng nhập'),
          ),
          TextField(
            controller: userPresenter.passwordController,
            decoration: const InputDecoration(labelText: 'Mật khẩu'),
            obscureText: true,
          ),
          TextField(
            controller: userPresenter.emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: userPresenter.phoneController,
            decoration: const InputDecoration(labelText: 'Số điện thoại'),
          ),
          if (userPresenter.message.isNotEmpty)
            Text(
              userPresenter.message,
              style: const TextStyle(color: Colors.red),
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              userPresenter.register(() {
                setState(() {});
              }).then((user) {
                if (user != null) {
                  userLogin = user;

                  Navigator.pushReplacementNamed(context, '/');
                }
              });
            },
            child: const Text('Đăng ký'),
          ),
        ],
      ),
    );
  }
}
