import 'package:equatable/equatable.dart';

abstract class UseCase<T, P> {
  Future<T> call(P param);
}

class NoParam extends Equatable {
  const NoParam();

  @override
  List<Object?> get props => [];
}
