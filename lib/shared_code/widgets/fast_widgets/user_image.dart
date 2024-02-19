// ignore_for_file: invalid_use_of_visible_for_testing_member, depend_on_referenced_packages, implementation_imports

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/src/types/image_options.dart';
import 'package:shared_code/shared_code/constants/styles.dart';
import 'package:shared_code/shared_code/widgets/buttons/button_wrapper.dart';

class UserImage extends StatelessWidget {
  final File? pickedImage;
  final String? imageLink;
  final Function(File pickedFile)? onPick;
  final double? radius;
  final String? placeHolderPath;
  final double? pickMaxWidth;
  final double? pickMaxHeight;

  const UserImage({
    super.key,
    this.pickedImage,
    required this.imageLink,
    this.onPick,
    this.radius,
    this.placeHolderPath,
    this.pickMaxWidth,
    this.pickMaxHeight,
  });

  void handlePickImage(Function(File pickedFile)? onPick) async {
    var res = await ImagePicker.platform.getImageFromSource(
      source: ImageSource.gallery,
      options: ImagePickerOptions(
        maxHeight: pickMaxHeight ?? 96 * 1.5,
        maxWidth: pickMaxWidth ?? 96 * 1.5,
      ),
    );
    if (res == null) return;
    File file = File(res.path);
    onPick!(file);
  }

  double placeholderWidth(double rad) {
    if (24 > rad) {
      return rad / 2;
    } else {
      return 24;
    }
  }

  @override
  Widget build(BuildContext context) {
    double rad = radius ?? 96;
    return ButtonWrapper(
      onTap: onPick == null ? null : () => handlePickImage(onPick),
      width: rad,
      height: rad,
      borderRadius: 1000,
      child: pickedImage != null
          ? Image.file(
              pickedImage!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            )
          : imageLink == null
              ? Container(
                  width: rad,
                  height: rad,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    border: Border.all(
                      width: 1,
                      color: secondaryColor(context),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      placeHolderPath == null
                          ? Icon(
                              Icons.person,
                              color: secondaryColor(context),
                              size: rad / 2,
                            )
                          : Image.asset(
                              placeHolderPath!,
                              width: placeholderWidth(rad),
                              height: placeholderWidth(rad),
                              color: hintColor(context),
                            ),
                    ],
                  ),
                )
              : CachedNetworkImage(
                  imageUrl: imageLink!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
    );
  }
}
