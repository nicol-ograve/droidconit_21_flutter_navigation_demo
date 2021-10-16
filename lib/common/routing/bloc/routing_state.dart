import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class RoutingState extends Equatable {
  final List<Page> pages;

  const RoutingState({required this.pages});

  @override
  List<Object?> get props => [pages];
}
