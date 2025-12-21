part of 'recovery_select_cubit.dart';

sealed class RecoverySelectState extends Equatable {
  const RecoverySelectState();

  @override
  List<Object?> get props => [];
}

/// Initial state
final class RecoverySelectInitial extends RecoverySelectState {
  const RecoverySelectInitial();
}

/// State when options are selected
final class RecoverySelectLoaded extends RecoverySelectState {
  final List<String> selectedOptions;

  const RecoverySelectLoaded(this.selectedOptions);

  @override
  List<Object?> get props => [selectedOptions];
}
