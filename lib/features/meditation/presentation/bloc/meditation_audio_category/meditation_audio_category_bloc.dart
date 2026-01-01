import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meditation_app/features/meditation/domain/entities/meditation_audio_category_entity.dart';
import 'package:meditation_app/features/meditation/domain/usecase/meditation_audio_category_use_case.dart';

part 'meditation_audio_category_event.dart';

part 'meditation_audio_category_state.dart';

class MeditationAudioCategoryBloc
    extends Bloc<MeditationAudioCategoryEvent, MeditationAudioCategoryState> {
  final MeditationAudioCategoryUseCase meditationAudioCategoryUseCase;

  MeditationAudioCategoryBloc({required this.meditationAudioCategoryUseCase})
    : super(MeditationAudioCategoryInitial()) {
    // ================= GET Meditation Audio Category =================
    on<GetMeditationAudioCategoryEvent>((event, emit) async {
      emit(MeditationAudioCategoryLoading());

      try {
        final meditationAudioCategory = await meditationAudioCategoryUseCase
            .call(userId: event.userId);

        emit(
          MeditationAudioCategorySuccess(
            meditationAudioCategory: meditationAudioCategory,
          ),
        );
      } catch (e) {
        emit(MeditationAudioCategoryFailure(message: e.toString()));
      }
    });
  }
}
