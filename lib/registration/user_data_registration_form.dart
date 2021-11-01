import 'package:droidconit_21_flutter_navigation_demo/registration/cubit/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class UserDataRegistrationPage extends StatelessWidget {
  final firstNameController = TextEditingController(text:'Name');
  final lastNameController = TextEditingController(text:'Surname');

  UserDataRegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email'),
            TextFormField(controller: firstNameController),
            SizedBox(height: 16),
            Text('Password'),
            TextFormField(controller: lastNameController),
            SizedBox(height: 16),
            Center(
                child: MaterialButton(
                    child: Text('Go ahead'),
                    color: Colors.orange,
                    onPressed: () {
                      context.read<RegistrationCubit>().goAhead();
                    })),
          ],
        ));
  }
}