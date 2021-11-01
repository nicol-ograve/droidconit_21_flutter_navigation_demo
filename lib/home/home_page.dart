import 'package:droidconit_21_flutter_navigation_demo/common/routing/app_pages.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_bloc.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Padding(
            padding: EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                  child: MaterialButton(
                onPressed: () {
                  context
                      .read<RoutingBloc>()
                      .add(RoutePushed(newPage: Login_LoginFormConfig));
                },
                child: Text('Login'),
                color: Colors.orange,
              )),
              SizedBox(
                height: 16,
              ),
              Center(
                  child: MaterialButton(
                      onPressed: () {
                        context.read<RoutingBloc>().add(RoutePushed(
                            newPage: AccountRegistrationPageConfig));
                      },
                      child: Text('Register'),
                      color: Colors.orange))
            ])));
  }
}
