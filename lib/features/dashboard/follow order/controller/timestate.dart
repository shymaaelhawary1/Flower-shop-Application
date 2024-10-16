
abstract class DistanceState {}

class DistanceInitial extends DistanceState {}

class DistanceLoading extends DistanceState {}

class DistanceLoaded extends DistanceState {
  final String distance;
  final String duration;

  DistanceLoaded(this.distance, this.duration);
}

class DistanceError extends DistanceState {
  final String error;
  DistanceError(this.error);
}
