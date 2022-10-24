part of 'hyper_node_bloc.dart';

abstract class HyperNodeState extends Equatable {
  const HyperNodeState();
}

class HyperNodeInitial extends HyperNodeState {
  @override
  List<Object> get props => [];
}

class Loading extends HyperNodeState {
  @override
  List<Object?> get props => [];
}

class Loaded extends HyperNodeState {
  final HyperNodeEntity hyperNodeEntity;

  const Loaded({required this.hyperNodeEntity});

  @override
  List<Object?> get props => [hyperNodeEntity];
}

class Error extends HyperNodeState {
  final String message;

  const Error({required this.message});

  @override
  List<Object?> get props => [message];
}
