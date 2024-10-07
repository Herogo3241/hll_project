import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameCtlr = TextEditingController();
  TextEditingController usernameCtlr = TextEditingController();
  TextEditingController emailCtlr = TextEditingController();
  TextEditingController passwordCtlr = TextEditingController();
  TextEditingController confirmPasswordCtlr = TextEditingController();
  TextEditingController dobCtlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          // title: const Text('SIGN UP'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      const Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: nameCtlr,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(Icons.person, size: 20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: dobCtlr,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'Date of Birth',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(Icons.calendar_today, size: 20),
                          ),
                        ),
                        onTap: () => _selectDate(context),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: nameCtlr,
                        decoration: const InputDecoration(
                          labelText: 'School',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(Icons.school, size: 20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: usernameCtlr,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(Icons.person, size: 20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: emailCtlr,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(Icons.email, size: 20),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passwordCtlr,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(Icons.lock, size: 20),
                          ),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: confirmPasswordCtlr,
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(Icons.lock, size: 20),
                          ),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: signUp,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(184, 121, 222, 178),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 5,
                            shadowColor: Colors.grey[300],
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            textStyle: const TextStyle(fontSize: 18),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      // SizedBox(height: 1),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Already have an account? Sign in",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Date picker function
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        dobCtlr.text = formattedDate;
      });
    }
  }

  void signUp() {
    if (nameCtlr.text.isEmpty ||
        dobCtlr.text.isEmpty ||
        usernameCtlr.text.isEmpty ||
        emailCtlr.text.isEmpty ||
        passwordCtlr.text.isEmpty ||
        confirmPasswordCtlr.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }
    if (passwordCtlr.text != confirmPasswordCtlr.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }
  }
}
