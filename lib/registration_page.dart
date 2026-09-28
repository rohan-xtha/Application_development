import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() =>
      _RegistrationPageState();
}

class _RegistrationPageState
    extends State<RegistrationPage> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController =
  TextEditingController();

  final TextEditingController emailController =
  TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  final TextEditingController confirmPasswordController =
  TextEditingController();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  void register() {
    if (_formKey.currentState!.validate()) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Account created successfully!',
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Registration'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(24),

        child: Form(

          key: _formKey,

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.stretch,

            children: [

              const SizedBox(height: 20),

              // Application Logo
              const Icon(
                Icons.person_add_outlined,
                size: 90,
                color: const Color(0xFF10B981),
              ),

              const SizedBox(height: 20),

              // Application Name
              const Text(
                'Create Account',
                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Register to create a new account.',
                textAlign: TextAlign.center,

                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 35),

              // Full Name
              TextFormField(

                controller: nameController,

                decoration: InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',

                  prefixIcon: const Icon(
                    Icons.person_outline,
                  ),

                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(12),
                  ),
                ),

                validator: (value) {

                  if (value == null ||
                      value.isEmpty) {

                    return 'Please enter your full name';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Email
              TextFormField(

                controller: emailController,

                keyboardType:
                TextInputType.emailAddress,

                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',

                  prefixIcon: const Icon(
                    Icons.email_outlined,
                  ),

                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(12),
                  ),
                ),

                validator: (value) {

                  if (value == null ||
                      value.isEmpty) {

                    return 'Please enter your email';
                  }

                  if (!value.contains('@')) {

                    return 'Please enter a valid email';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Password
              TextFormField(

                controller: passwordController,

                obscureText: hidePassword,

                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Create a password',

                  prefixIcon: const Icon(
                    Icons.lock_outline,
                  ),

                  suffixIcon: IconButton(

                    icon: Icon(
                      hidePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),

                    onPressed: () {

                      setState(() {
                        hidePassword =
                        !hidePassword;
                      });

                    },
                  ),

                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(12),
                  ),
                ),

                validator: (value) {

                  if (value == null ||
                      value.isEmpty) {

                    return 'Please enter a password';
                  }

                  if (value.length < 6) {

                    return 'Password must be at least 6 characters';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Confirm Password
              TextFormField(

                controller:
                confirmPasswordController,

                obscureText:
                hideConfirmPassword,

                decoration: InputDecoration(

                  labelText: 'Confirm Password',
                  hintText: 'Re-enter your password',

                  prefixIcon: const Icon(
                    Icons.lock_reset_outlined,
                  ),

                  suffixIcon: IconButton(

                    icon: Icon(
                      hideConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),

                    onPressed: () {

                      setState(() {
                        hideConfirmPassword =
                        !hideConfirmPassword;
                      });

                    },
                  ),

                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(12),
                  ),
                ),

                validator: (value) {

                  if (value == null ||
                      value.isEmpty) {

                    return 'Please confirm your password';
                  }

                  if (value !=
                      passwordController.text) {

                    return 'Passwords do not match';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 30),

              // Register Button
              SizedBox(

                height: 55,

                child: ElevatedButton(

                  onPressed: register,

                  style: ElevatedButton.styleFrom(

                    backgroundColor:
                    Colors.deepPurple,

                    foregroundColor:
                    Colors.white,

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                    ),
                  ),

                  child: const Text(
                    'CREATE ACCOUNT',

                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Back to Login
              Row(

                mainAxisAlignment:
                MainAxisAlignment.center,

                children: [

                  const Text(
                    'Already have an account?',
                  ),

                  TextButton(

                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: const Text(
                      'Login',

                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}