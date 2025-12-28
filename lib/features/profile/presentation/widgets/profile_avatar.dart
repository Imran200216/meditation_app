import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';

class ProfileAvatar extends StatelessWidget {
  final double height;
  final double width;
  final String personImageUrl;

  const ProfileAvatar({
    super.key,
    required this.personImageUrl,
    required this.height,
    required this.width,
  });

  bool _isLocalFile(String path) {
    return path.isNotEmpty &&
        !path.startsWith('http') &&
        !path.startsWith('https');
  }

  bool _isValidUrl(String path) {
    return path.isNotEmpty &&
        (path.startsWith('http') || path.startsWith('https'));
  }

  @override
  Widget build(BuildContext context) {
    // Handle empty or invalid paths
    if (personImageUrl.isEmpty) {
      return ClipOval(
        child: Image.asset(
          AppAssetsConstants.personPlaceHolder,
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      );
    }

    final isFile = _isLocalFile(personImageUrl);

    return ClipOval(
      child: isFile
          ? Image.file(
              File(personImageUrl),
              width: width,
              height: height,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Image.asset(
                AppAssetsConstants.personPlaceHolder,
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
            )
          : CachedNetworkImage(
              imageUrl: personImageUrl,
              width: width,
              height: height,
              fit: BoxFit.cover,
              placeholder: (_, __) => Image.asset(
                AppAssetsConstants.personPlaceHolder,
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
              errorWidget: (_, __, ___) => Image.asset(
                AppAssetsConstants.personPlaceHolder,
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
