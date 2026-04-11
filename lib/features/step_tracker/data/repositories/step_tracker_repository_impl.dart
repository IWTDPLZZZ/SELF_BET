import 'package:self_bet/features/step_tracker/domain/entities/goal.dart';
import 'package:self_bet/features/step_tracker/domain/repositories/repositories.dart';

class StepTrackerRepositoryImpl implements StepTrackerRepository {
  
  @override
  Stream<int> getStepCount() {
    return Stream.value(0);
  }

  @override
  Future<Goal> getGoal() {
    return Future.value(Goal(goal: 10000, currentSteps: 0, deadLine: DateTime.now()));
  }
}
