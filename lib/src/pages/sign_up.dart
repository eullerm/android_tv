import 'package:android_tv/src/widget/credit_card_input.dart';
import 'package:android_tv/src/widget/date_input.dart';
import 'package:android_tv/src/widget/focus_input.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/sign-up';
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isLoading = false;

  void navigateTo(String path, {Object? arguments}) {
    if (path.isNotEmpty) {
      Navigator.pushNamed(context, path, arguments: arguments);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF00695C)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 0),
                  ),
                ],
                gradient: LinearGradient(
                  colors: [Color(0x5543A047), Color(0x5500695C)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      flex: 1,
                      child: FocusInput(
                        label: 'E-mail',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Flexible(
                          flex: 1,
                          child: FocusInput(
                            label: 'Senha',
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          flex: 1,
                          child: FocusInput(
                            label: 'Confirme a senha',
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Flexible(
                          flex: 3,
                          child: CreditCardInput(label: 'Cartão de crédito', lengthLimit: 16),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          flex: 1,
                          child: CreditCardInput(
                            label: 'CVV',
                            lengthLimit: 3,
                            obscureText: true,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          flex: 1,
                          child: DateInput(
                            label: 'Data',
                            lengthLimit: 4,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Flexible(
                      flex: 1,
                      child: FocusInput(
                        label: 'Nome',
                      ),
                    ),
                    const SizedBox(height: 32),
                    _isLoading
                        ? const Center(child: CircularProgressIndicator(color: Color(0xFF00695c)))
                        : ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              maximumSize: MaterialStateProperty.all<Size>(
                                Size(MediaQuery.of(context).size.width / 4, 40.0),
                              ),
                              elevation: MaterialStateProperty.all<double>(5.0),
                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00695c)),
                            ),
                            onPressed: () async {
                              setState(() {
                                _isLoading = true;
                              });

                              Future.delayed(const Duration(seconds: 3), () {
                                setState(() {
                                  _isLoading = false;
                                });
                                navigateTo('/home');
                              });
                            },
                            child: Text('Create'),
                          ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
