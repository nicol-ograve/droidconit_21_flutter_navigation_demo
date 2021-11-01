import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final bool mustGoAhead;
  SplashState({
    required this.mustGoAhead,
  });

  @override
  List<Object?> get props => [mustGoAhead];
}
