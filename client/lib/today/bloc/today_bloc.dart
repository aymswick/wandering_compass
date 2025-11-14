import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:schedule_repository/schedule_repository.dart'
    show ScheduleRepository;

part 'today_event.dart';
part 'today_state.dart';

class TodayBloc extends Bloc<TodayEvent, TodayState> {
  TodayBloc(this.repository) : super(TodayInitial()) {
    on<TodayEvent>((event, emit) {
      //  on<ZonesFetched>(
      //   (event, emit) async {
      //     final zones = (await repository
      //             .getZonesByUser(authId))
      //         .toList();

      //     emit(state.copyWith(
      //       day: Day(
      //         zones: zones,
      //         weather: (weather as Map<String, dynamic>)['current'],
      //       ),
      //     ));

      //     final dir = await getApplicationDocumentsDirectory();
      //     final isar = await Isar.open(
      //       [TaskSchema, ZoneSchema],
      //       directory: dir.path,
      //     );

      //     final newZone = Zone(name: 'TestZone123');

      //     await isar.writeTxn(() async {
      //       await isar.zones.put(newZone); // insert & update
      //     });

      //     final existingUser = await isar.zones.get(newZone.id); // get
      //     logger.d(existingUser!.name);
      //     await isar.writeTxn(() async {
      //       await isar.zones.delete(existingUser.id); // delete
      //     });
      //   },
      // );
      // on<PeriodicZoneCheckRequested>((event, emit) {
      //   emit(state.copyWith(currentZone: state.day.currentZone));
      // });
    });
  }
  ScheduleRepository repository;
}
