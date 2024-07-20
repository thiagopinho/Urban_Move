import 'package:urban_move/models/position_model.dart';

abstract class PositionState {
  final List<PositionModel> listPositions;
  PositionState({required this.listPositions});
}

class PositionInitialState extends PositionState {
  PositionInitialState() : super(listPositions: []);
}

class PositionLoadingState extends PositionState {
  PositionLoadingState() : super(listPositions: []);
}

class PositionLoadedState extends PositionState {
  PositionLoadedState({required List<PositionModel> listLoaded})
      : super(listPositions: listLoaded);
}

class PositionErrorState extends PositionState {
  final String message;
  PositionErrorState({required this.message, required super.listPositions});
}
