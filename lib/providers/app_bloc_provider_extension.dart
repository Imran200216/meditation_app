import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_app/core/bloc/connectivity/connectivity_bloc.dart';
import 'package:meditation_app/features/intro/presentation/bloc/get_user_auth_details/get_user_auth_details_bloc.dart';
import 'package:meditation_app/features/intro/presentation/bloc/login/login_bloc.dart';
import 'package:meditation_app/features/meditation/presentation/bloc/meditation_audio_category/meditation_audio_category_bloc.dart';
import 'package:meditation_app/features/meditation/presentation/bloc/meditation_audio_list/meditation_audio_list_bloc.dart';

extension AppBlocProviderExtension on BuildContext {
  // =======================  CONNECTIVITY BLOC =====================
  ConnectivityBloc get readConnectivityBloc => read<ConnectivityBloc>();

  // =======================  GET USER AUTH DETAILS BLOC =====================
  GetUserAuthDetailsBloc get readGetUserAuthDetailsBloc =>
      read<GetUserAuthDetailsBloc>();

  //  =======================  LOGIN BLOC =====================
  LoginBloc get readLoginBloc => read<LoginBloc>();

  //  =======================  MEDITATION AUDIO CATEGORY BLOC =====================
  MeditationAudioCategoryBloc get readMeditationAudioCategoryBloc =>
      read<MeditationAudioCategoryBloc>();

  //  =======================  MEDITATION AUDIO LIST BLOC =====================
  MeditationAudioListBloc get readMeditationAudioListBloc =>
      read<MeditationAudioListBloc>();
}
