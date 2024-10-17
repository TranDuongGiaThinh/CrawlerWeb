import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  //late LoginPresenter presenter;

  @override
  void initState() {
    super.initState();

    //presenter = LoginPresenter(reload: () {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    //presenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextField(
          //controller: presenter.usernameController,
          decoration: const InputDecoration(labelText: 'Tên đăng nhập'),
        ),
        TextField(
          //controller: presenter.passwordController,
          decoration: const InputDecoration(labelText: 'Mật khẩu'),
          obscureText: true,
        ),
        // if (presenter.message.isNotEmpty)
        //   Text(
        //     presenter.message,
        //     style: const TextStyle(color: Colors.red),
        //   ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            //UserModel? user = await presenter.login();
            // if (user != null) {
            //   // Lưu user vào biến toàn cục
            //   userLogin = user;

              // Chuyển trang khi đang nhập thành công
              Navigator.pushReplacementNamed(context, '/home');
            // }
          },
          child: const Text('Đăng nhập'),
        ),
      ],
    );
  }
}
