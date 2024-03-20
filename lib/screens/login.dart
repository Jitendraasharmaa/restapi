import 'package:flutter/material.dart';
// import 'package:restapi/screens/user_list.dart';
import 'package:http/http.dart' as http;
import 'package:restapi/screens/user_list.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isvisible = false;
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController;
    passwordController;
  }

  Future<void> login(String email, String password) async {
    const url = 'https://reqres.in/api/register';

    if (emailController.text.isNotEmpty || passwordController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      try {
        final uri = Uri.parse(url);
        final body = {
          'email': email,
          'password': password,
        };
        final response = await http.post(uri, body: body);
        if (response.statusCode == 200) {
          if (mounted) {
            showSuccessMessage('You have successfully logged in');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const UserListScreen(),
              ),
            );
            emailController.text = '';
            passwordController.text = '';
          }
        } else {
          showErrorMessage('Entered incorrect email and password');
        }
      } catch (e) {
        showErrorMessage('$e');
      }
      setState(() {
        isLoading = false;
      });
    } else {
      showErrorMessage('Fields are required');
    }
  }

  void showSuccessMessage(String message) {
    final snacks = SnackBar(
      backgroundColor: Colors.green,
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snacks);
  }

  void showErrorMessage(String message) {
    final snacks = SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snacks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(hintText: 'Enter Email'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: isvisible,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isvisible = !isvisible;
                      });
                    },
                    icon: Icon(isvisible == true
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              isLoading == true
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        login(emailController.text.toString(),
                            passwordController.text.toString());
                      },
                      child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
