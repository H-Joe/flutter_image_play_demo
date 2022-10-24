import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_image_play_demo/features/home/domain/entities/hyper_node_entity.dart';

import '../../domain/usecases/get_hyper_node.dart';

part 'hyper_node_event.dart';

part 'hyper_node_state.dart';

class HyperNodeBloc extends Bloc<HyperNodeEvent, HyperNodeState> {
  HyperNodeBloc({required GetHyperNode hyperNodeUsecase})
      : _getHyperNode = hyperNodeUsecase,
        super(HyperNodeInitial()) {
    on<GetHyperNodes>(_getHyperNodes);
  }

  final GetHyperNode _getHyperNode;

  void _getHyperNodes(
    GetHyperNodes event,
    Emitter<HyperNodeState> emit,
  ) async {
    emit(Loading());
    final res = await _getHyperNode(NoParams());
    print(res);
    emit(Loaded(hyperNodeEntity: res));
  }
}
