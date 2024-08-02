import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:madang/features/auth/controller/auth_controller.dart';
import 'package:madang/utils/constants/constants.dart';
import 'package:madang/utils/theme/theme.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  AuthController authController = AuthController();
  List<TextEditingController> _controllers = [];
  List<FocusNode> _focusNodes = [];
  Timer? _timer;
  int _start = 60; // Countdown duration in seconds
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
    _initControllers();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _disposeControllers();
    super.dispose();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void _initControllers() {
    _controllers = List.generate(4, (index) => TextEditingController());
    _focusNodes = List.generate(4, (index) => FocusNode());
  }

  void _disposeControllers() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
  }

  void _resendOTP() {
    setState(() {
      _start = 60; // Reset timer
      _startTimer(); // Start countdown again
      // Implement logic to resend OTP here
    });
  }

  void _submitOTP() async {
    setState(() {
      _isLoading = true;
    });
    var email = GetStorage().read(Constants.User_Email) ?? '';
    String enteredOTP =
        _controllers.map((controller) => controller.text).join();
    // Implement validation and submission logic here
    print("User email: $email");
    print("Entered OTP: $enteredOTP");
    await authController.validateEmail(email, enteredOTP);
    setState(() {
      _isLoading = false;
    });
  }

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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter OTP",
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return _buildOTPDigitField(index);
                  }),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Resend OTP in $_start seconds",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: _start == 0 ? _resendOTP : null,
                      child: const Text(
                        "Resend",
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: TextButton(
                    onPressed: _submitOTP,
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
                              "Submit",
                              style: TextStyle(
                                color: primaryColorLT,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
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
    );
  }

  Widget _buildOTPDigitField(int index) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: Center(
        child: TextField(
          cursorColor: primaryColorDK,
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: mainColor,
                width: 1.0,
              ),
            ),
          ),
          style: const TextStyle(fontSize: 24, color: Colors.black),
          onChanged: (value) {
            if (value.length == 1 && index < 3) {
              _focusNodes[index].unfocus();
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            }
          },
        ),
      ),
    );
  }
}
