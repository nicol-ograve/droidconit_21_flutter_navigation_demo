import 'package:droidconit_21_flutter_navigation_demo/common/routing/app_pages.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_bloc.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'username',
              ),
              TextField(
                controller: TextEditingController(text: 'nicol_ograve'),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'password',
              ),
              TextField(
                obscureText: true,
                controller: TextEditingController(text: 'Password1!'),
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                  child: MaterialButton(
                onPressed: () {
                  context
                      .read<RoutingBloc>()
                      .add(RoutePushed(newPage: TodosListPageConfig));
                },
                child: Text('Login'),
                color: Colors.green,
              ))
            ],
          )),
    );
  }
}
