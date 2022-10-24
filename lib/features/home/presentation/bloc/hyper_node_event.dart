part of 'hyper_node_bloc.dart';

abstract class HyperNodeEvent extends Equatable {
  const HyperNodeEvent();
}

class GetHyperNodes extends HyperNodeEvent {
  @override
  List<Object?> get props => [];
}
