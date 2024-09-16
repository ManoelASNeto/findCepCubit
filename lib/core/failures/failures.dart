import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failures {}

class ServerFailure extends Failures {}
