import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meditation_app/commons/widgets/k_text.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/core/utils/formatter_utils.dart';
import 'package:meditation_app/features/audio/presentation/widgets/audio_leading_trailing_icon_btn.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  final AudioPlayer _player = AudioPlayer();
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();

    _player.setUrl(
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    );

    _player.durationStream.listen((d) {
      if (d != null) {
        setState(() => _duration = d);
      }
    });

    _player.positionStream.listen((p) {
      setState(() => _position = p);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.audioBgColor,
      body: Stack(
        children: [
          // Audio Top Left Vector
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              AppAssetsConstants.audioTopVector,
              fit: BoxFit.cover,
            ),
          ),

          // Audio Top Right Vector
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              AppAssetsConstants.audioRightVector,
              fit: BoxFit.cover,
            ),
          ),

          // Audio Bottom Right Vector
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              AppAssetsConstants.audioBottomVector,
              fit: BoxFit.cover,
            ),
          ),

          // Audio Bottom Left Vector
          Positioned(
            bottom: 0,
            left: 0,
            child: SvgPicture.asset(
              AppAssetsConstants.audioLeftVector,
              fit: BoxFit.cover,
            ),
          ),

          // Close
          Positioned(
            top: 80,
            left: 20,
            child: AudioLeadingTrailingIconBtn(
              bgColor: AppColors.bgColor,
              iconColor: AppColors.subTitleColor,
              icon: Icons.clear,
              onTap: () {
                GoRouter.of(context).pop();
              },
            ),
          ),

          // Favorite
          Positioned(
            top: 80,
            right: 20,
            child: AudioLeadingTrailingIconBtn(
              bgColor: AppColors.favoriteBgColor,
              iconColor: AppColors.bgColor,
              icon: Icons.favorite_outline,
              onTap: () {},
            ),
          ),

          // Content
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                KText(
                  maxLines: 4,
                  softWrap: true,
                  text: "Daily Meditation",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.visible,
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  color: AppColors.titleColor,
                ),

                const SizedBox(height: 16),

                // Sub Title
                KText(
                  maxLines: 2,
                  softWrap: true,
                  text: "7 days of calm",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.visible,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.subTitleParaColor,
                ),

                const SizedBox(height: 80),

                Row(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Before Audio
                    GestureDetector(
                      onTap: () async {
                        HapticFeedback.heavyImpact();

                        final current = _player.position;
                        final newPosition =
                            current - const Duration(seconds: 15);

                        await _player.seek(
                          newPosition > Duration.zero
                              ? newPosition
                              : Duration.zero,
                        );
                      },
                      child: SvgPicture.asset(
                        AppAssetsConstants.beforeAudio,
                        height: 44,
                        width: 44,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Play Pause Icon Btn
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.heavyImpact();

                        // Play Pause Functionality
                        _player.playing ? _player.pause() : _player.play();
                      },
                      child: CircleAvatar(
                        radius: 44,
                        backgroundColor: AppColors.playPauseBgColor,
                        child: CircleAvatar(
                          backgroundColor: AppColors.playPauseIconBgColor,
                          radius: 34,
                          child: Icon(
                            _player.playing
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            color: AppColors.playPauseIconColor,
                            size: 40,
                          ),
                        ),
                      ),
                    ),

                    // After Audio
                    GestureDetector(
                      onTap: () async {
                        HapticFeedback.heavyImpact();

                        final current = _player.position;
                        final duration = _player.duration;

                        if (duration == null) return;

                        final newPosition =
                            current + const Duration(seconds: 15);

                        await _player.seek(
                          newPosition < duration ? newPosition : duration,
                        );
                      },
                      child: SvgPicture.asset(
                        AppAssetsConstants.afterAudio,
                        height: 44,
                        width: 44,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                Slider(
                  min: 0,
                  max: _duration.inSeconds.toDouble(),
                  value: _position.inSeconds
                      .clamp(0, _duration.inSeconds)
                      .toDouble(),
                  onChanged: (value) {
                    _player.seek(Duration(seconds: value.toInt()));
                  },
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      KText(
                        maxLines: 1,
                        softWrap: true,
                        text: audioTimeFormatter(_position),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.visible,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),

                      KText(
                        maxLines: 1,
                        softWrap: true,
                        text: audioTimeFormatter(_duration),
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.visible,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
