import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/features/meditation/domain/entities/meditation_audio_list_entity.dart';
import 'package:meditation_app/features/meditation/domain/usecase/meditation_audio_list_use_case.dart';

part 'meditation_audio_list_event.dart';

part 'meditation_audio_list_state.dart';

class MeditationAudioListBloc
    extends Bloc<MeditationAudioListEvent, MeditationAudioListState> {
  final MeditationAudioListUseCase meditationAudioListUseCase;

  MeditationAudioListBloc({required this.meditationAudioListUseCase})
    : super(MeditationAudioListInitial()) {
    // Get Meditation Audio List
    on<GetMeditationAudioList>((event, emit) async {
      emit(GetMeditationAudioListLoading());

      try {
        // Await the async call
        final meditationAudioList = await meditationAudioListUseCase.call(
          userId: event.userId,
          categoryName: event.categoryName,
        );

        LoggerUtils.logInfo(
          "Audios fetched: ${meditationAudioList.audios.length}",
        );
        // Emit the success state with the list of audios
        emit(GetMeditationAudioListSuccess(audios: meditationAudioList));
      } catch (e) {
        emit(GetMeditationAudioListFailure(message: e.toString()));
      }
    });
  }
}
