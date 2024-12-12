import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:madang/features/auth/controller/auth_controller.dart';
import 'package:madang/routes/routes.dart';
import 'package:madang/utils/constants/constants.dart';
import 'package:madang/utils/theme/theme.dart';
import 'package:madang/utils/validator/validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey _formKey = GlobalKey<FormState>();
  bool _invisiblePassword = true;
  String? _name, _email, _password, _confirmPassword;
  bool _isLoading = false;
  late AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColorLT,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white, // Set the status bar color to white
            statusBarIconBrightness: Brightness.dark,
          ),
          child: SafeArea(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: AbsorbPointer(
                absorbing: _isLoading,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 24,
                            ),
                            onPressed: () {
                              // Navigator.pop(context);
                              Get.back();
                            },
                          ),
                          const SizedBox(
                              width:
                                  10), // Adjust this value to control spacing
                          const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      autovalidateMode: _autoValidateMode,
                      child: Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Name",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  style: const TextStyle(
                                    color: textColor,
                                    fontSize: 16,
                                  ),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  onChanged: (String val) {
                                    _name = val;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Name",
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                        color: mainColor,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  validator: Validator.nameValidator,
                                  cursorColor: mainColorDK,
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  "Email",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  style: const TextStyle(
                                    color: textColor,
                                    fontSize: 16,
                                  ),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (String val) {
                                    _email = val;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                        color: mainColor,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  validator: Validator.emailValidator,
                                  cursorColor: mainColorDK,
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  "Password",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  style: const TextStyle(
                                    color: textColor,
                                    fontSize: 16,
                                  ),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.visiblePassword,
                                  onChanged: (String val) {
                                    _password = val;
                                  },
                                  obscureText: _invisiblePassword,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    suffixIcon:
                                        _showHideIcon(PasswordField.password),
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                        color: mainColor,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  validator: Validator.passwordValidator,
                                  cursorColor: mainColorDK,
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  "Confirmation Password",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  style: const TextStyle(color: Colors.black),
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.visiblePassword,
                                  onChanged: (val) {
                                    _confirmPassword = val;
                                  },
                                  obscureText: _invisiblePassword,
                                  decoration: InputDecoration(
                                    hintText: "Confirmation Password",
                                    suffixIcon:
                                        _showHideIcon(PasswordField.password),
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                        color: mainColor,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  validator: (val) =>
                                      Validator.confirmPasswordValidator(
                                          _confirmPassword, _password),
                                ),
                                const SizedBox(height: 30),
                                TextButton(
                                  onPressed: () async {
                                    setState(() {
                                      _autoValidateMode =
                                          AutovalidateMode.always;
                                    });

                                    if (_email != null && _password != null) {
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      await _authController.register(
                                        _name!,
                                        _email!,
                                        _password!,
                                      );
                                    }
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: (_name != null &&
                                              _email != null &&
                                              _password != null &&
                                              _confirmPassword != null)
                                          ? mainColorDK
                                          : neutralGrey, // Change color based on field completion
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                    ),
                                    child: Center(
                                      child: _isLoading
                                          ? const SizedBox(
                                              width: 24.0,
                                              height: 24.0,
                                              child: CircularProgressIndicator(
                                                color: primaryColorLT,
                                              ),
                                            )
                                          : const Text(
                                              "Sign Up Now",
                                              style: TextStyle(
                                                color: primaryColorLT,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Already have an account? ",
                                        style: TextStyle(
                                          color: Colors
                                              .black, // Set the color for the first part
                                          fontSize: 16,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.login);
                                        },
                                        child: const Text(
                                          "Login",
                                          style: TextStyle(
                                              color:
                                                  mainColor, // Set the color for the second part
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _showHideIcon(PasswordField passwordField) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (passwordField == PasswordField.password) {
            _invisiblePassword = !_invisiblePassword;
          } else {
            _invisiblePassword = !_invisiblePassword;
          }
        });
      },
      child: Container(
        height: 40.0,
        width: 40.0,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: SvgPicture.asset(
          passwordField == PasswordField.password
              ? !_invisiblePassword
                  ? 'assets/svgs/eye.svg'
                  : 'assets/svgs/private.svg'
              : !_invisiblePassword
                  ? 'assets/svgs/eye.svg'
                  : 'assets/svgs/private.svg',
          color: hintColor,
        ),
      ),
    );
  }
}
