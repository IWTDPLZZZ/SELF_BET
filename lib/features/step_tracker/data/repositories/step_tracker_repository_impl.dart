import 'dart:async';

import 'package:pedometer/pedometer.dart';
import 'package:self_bet/features/step_tracker/domain/entities/goal.dart';
import 'package:self_bet/features/step_tracker/domain/repositories/repositories.dart';

class StepTrackerRepositoryImpl implements StepTrackerRepository {
  StepTrackerRepositoryImpl({
    required Stream<Goal> currentGoalStream,
  }) : _currentGoalStream = currentGoalStream;

  final Stream<Goal> _currentGoalStream;

  final StreamController<int> _stepCountController =
      StreamController<int>.broadcast();

  StreamSubscription<StepCount>? _pedometerSubscription;

  Stream<Goal> get currentGoalStream => _currentGoalStream;

  void onStepCount(StepCount event) {
    final int step = event.steps;
    final DateTime time = event.timeStamp;
    if (step < 0 || time.isAfter(DateTime.now())) {
      return;
    }
    if (!_stepCountController.isClosed) {
      _stepCountController.add(step);
    }
  }

  void initStepCountStream() {
    _pedometerSubscription?.cancel();
    _pedometerSubscription = Pedometer.stepCountStream.listen(
      onStepCount,
      onError: (_) {
      },
    );
  }

  void dispose() {
    _pedometerSubscription?.cancel();
    _pedometerSubscription = null;
    _stepCountController.close();
  }

  @override
  Stream<int> getStepCount() => _stepCountController.stream;

  @override
  Future<Goal> getGoal() {
    return Future.value(
      Goal(goal: 10000, currentSteps: 0, deadLine: DateTime.now()),
    );
  }
}