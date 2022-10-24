import 'package:equatable/equatable.dart';
import 'package:flutter_image_play_demo/features/home/domain/entities/hyper_node_entity.dart';
import 'package:flutter_image_play_demo/features/home/domain/repositories/hyper_node_repository.dart';

import '../../../../core/usercases/usecase.dart';

class GetHyperNode implements UseCase<HyperNodeEntity, NoParams> {
  final HyperNodeRepository repository;

  GetHyperNode(this.repository);

  @override
  Future<HyperNodeEntity> call(NoParams params) async {
    return await repository.getHyperNode();
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
