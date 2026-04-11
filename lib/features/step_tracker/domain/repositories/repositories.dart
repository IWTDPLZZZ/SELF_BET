import 'package:self_bet/features/step_tracker/domain/entities/goal.dart';

abstract class StepTrackerRepository {
  Stream<int> getStepCount();
  Future<Goal> getGoal();
}
