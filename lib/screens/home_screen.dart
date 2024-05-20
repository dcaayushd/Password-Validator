import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  bool success = false;
  bool _obscureText = true; // New state variable

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: success ? Colors.green : Colors.red,
          title: Column(
            children: [
              Text(
                "Password Validation",
                style: GoogleFonts.mPlus1(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.5),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: success
                        ? Lottie.network(
                            "https://lottie.host/b72d482a-8285-41a6-aed9-19ff59a21d4f/2un8X2czPh.json",
                          )
                        : Lottie.asset(
                            "assets/animation_lnt9yuim.json",
                          ),
                  ),
                ),
                SizedBox(
                  height: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: TextField(
                          controller: controller,
                          obscureText: _obscureText, // Use the state variable
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 207, 207, 207),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            floatingLabelStyle: GoogleFonts.mPlus1(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: success ? Colors.green : Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "Password",
                            hintStyle: GoogleFonts.mPlus1(color: Colors.black),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off 
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Flexible(
                        child: FlutterPwValidator(
                          defaultColor: Colors.grey.shade300,
                          controller: controller,
                          successColor: Colors.green.shade700,
                          minLength: 8,
                          uppercaseCharCount: 2,
                          numericCharCount: 3,
                          specialCharCount: 1,
                          normalCharCount: 3,
                          width: 400,
                          height: 180,
                          onSuccess: () {
                            setState(() {
                              success = true;
                            });
                          },
                          onFail: () {
                            setState(() {
                              success = false;
                            });
                          },
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
    );
  }
}