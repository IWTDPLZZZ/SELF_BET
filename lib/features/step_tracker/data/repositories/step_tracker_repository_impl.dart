import 'package:pedometer/pedometer.dart';
import 'package:self_bet/features/step_tracker/domain/entities/goal.dart';
import 'package:self_bet/features/step_tracker/domain/repositories/repositories.dart';

class StepTrackerRepositoryImpl implements StepTrackerRepository {
  final Stream<Goal> _currentGoalStream;

  StepTrackerRepositoryImpl({
    required Stream<Goal> currentGoalStream,
  }) : _currentGoalStream = currentGoalStream;

  Stream<Goal> get currentGoalStream => _currentGoalStream;

  void onStepCount(StepCount event) {
    final int step = event.steps;
    final DateTime time = event.timeStamp;
    if (step < 0 || time.isAfter(DateTime.now())) {
      return;
    }
    // Forward to stream/state when wiring Pedometer.stepCountStream.
  }
  @override
  Stream<int> getStepCount() {
    return Stream.value(0);
  }

  @override
  Future<Goal> getGoal() {
    return Future.value(Goal(goal: 10000, currentSteps: 0, deadLine: DateTime.now()));
  }
}
