import 'package:flutter/widgets.dart';

class RegistrationBackDispatcher extends ChildBackButtonDispatcher{
  RegistrationBackDispatcher(BackButtonDispatcher parent) : super(parent);

@override
  Future<bool> notifiedByParent(Future<bool> defaultValue) {
    // TODO: implement notifiedByParent
    return super.notifiedByParent(defaultValue);
  }

}