import 'package:equatable/equatable.dart';

class RegistrationState extends Equatable {
  final int pageIndex;

  final String username;
  final String password;

  final String firstName;
  final String lastName;

  final bool registrationCompleted;

  RegistrationState(
      {required this.pageIndex,
      required this.username,
      required this.password,
      required this.firstName,
      required this.lastName,
      this.registrationCompleted = false});

  RegistrationState.initial()
      : pageIndex = 0,
        firstName = '',
        lastName = '',
        password = '',
        username = '',
        registrationCompleted = false;

  RegistrationState copyWith({
    int? pageIndex,
    String? username,
    String? password,
    String? firstName,
    String? lastName,
    bool? registrationCompleted,
  }) {
    return RegistrationState(
        pageIndex: pageIndex ?? this.pageIndex,
        username: username ?? this.username,
        password: password ?? this.password,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        registrationCompleted:
            registrationCompleted ?? this.registrationCompleted);
  }

  @override
  List<Object?> get props => [
        pageIndex,
        username,
        password,
        firstName,
        lastName,
        registrationCompleted
      ];
}
