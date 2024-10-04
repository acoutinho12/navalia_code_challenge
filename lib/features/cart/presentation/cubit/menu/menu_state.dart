import 'package:equatable/equatable.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';

enum MenuStatus { initial, loading, failure, success }

final class MenuState extends Equatable {
  final MenuStatus status;
  final MenuEntity? entity;
  final String? failureMessage;
  const MenuState({
    required this.status,
    this.failureMessage,
    this.entity,
  });
  const MenuState._initial()
      : status = MenuStatus.initial,
        failureMessage = null,
        entity = null;
  factory MenuState.initial() => const MenuState._initial();
  @override
  List<Object?> get props => [status, entity, failureMessage];

  MenuState copyWith(
          {MenuStatus? status, String? failureMessage, MenuEntity? entity}) =>
      MenuState(
        entity: entity ?? this.entity,
        status: status ?? this.status,
        failureMessage: failureMessage ?? this.failureMessage,
      );
}
