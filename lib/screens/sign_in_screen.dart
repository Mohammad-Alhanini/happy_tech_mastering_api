import 'package:flutter/material.dart';
import 'package:happy_tech_mastering_api/cubit/user_cubit.dart';
import 'package:happy_tech_mastering_api/screens/profile_screen.dart';
import 'package:happy_tech_mastering_api/widgets/custom_form_button.dart';
import 'package:happy_tech_mastering_api/widgets/custom_input_field.dart';
import 'package:happy_tech_mastering_api/widgets/dont_have_an_account.dart';
import 'package:happy_tech_mastering_api/widgets/forget_password_widget.dart';
import 'package:happy_tech_mastering_api/widgets/page_header.dart';
import 'package:happy_tech_mastering_api/widgets/page_heading.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const PageHeader(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: context.read<UserCubit>().signInFormKey,
                    child: Column(
                      children: [
                        const PageHeading(title: 'Sign-in'),
                        //!Email
                        CustomInputField(
                          labelText: 'Email',
                          hintText: 'Your email',
                          controller: context.read<UserCubit>().signInEmail,
                        ),
                        const SizedBox(height: 16),
                        //!Password
                        CustomInputField(
                          labelText: 'Password',
                          hintText: 'Your password',
                          obscureText: true,
                          suffixIcon: true,
                          controller: context.read<UserCubit>().signInPassword,
                        ),
                        const SizedBox(height: 16),
                        //! Forget password?
                        ForgetPasswordWidget(size: size),
                        const SizedBox(height: 20),
                        //!Sign In Button
                        CustomFormButton(
                          innerText: 'Sign In',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 18),
                        //! Dont Have An Account ?
                        DontHaveAnAccountWidget(size: size),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
