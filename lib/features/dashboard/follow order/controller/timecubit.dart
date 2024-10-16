import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flower_shop/features/dashboard/follow%20order/controller/timestate.dart';

import 'package:flower_shop/services%20api/apiser.dart';

class DistanceCubit extends Cubit<DistanceState> {
  final DistanceService distanceService;

  DistanceCubit(this.distanceService) : super(DistanceInitial());

  Future<void> fetchDistanceAndDuration(String destination) async {
    emit(DistanceLoading());
    try {
      final routes =
          await distanceService.fetchDistanceAndDuration(destination);

      if (routes != null && routes.legs != null && routes.legs!.isNotEmpty) {
        final firstLeg = routes.legs!.first;
        emit(DistanceLoaded(firstLeg.distance, firstLeg.duration));
      } else {
        emit(DistanceError('No routes found'));
      }
    } catch (e) {
      emit(DistanceError(e.toString()));
    }
  }
}
