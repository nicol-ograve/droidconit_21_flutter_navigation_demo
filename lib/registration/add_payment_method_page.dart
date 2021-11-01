import 'package:droidconit_21_flutter_navigation_demo/registration/cubit/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AddPaymentMethodPage extends StatelessWidget {
  const AddPaymentMethodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add payment method'),
            Center(
                child: MaterialButton(
                    child: Text('Finish'),
                    color: Colors.orange,
                    onPressed: () {
                      context.read<RegistrationCubit>().finish();
                    })),
          ],
        ));  }
}