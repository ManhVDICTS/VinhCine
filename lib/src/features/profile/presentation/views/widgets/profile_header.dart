import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinhcine/src/configs/app_themes/app_colors.dart';
import 'package:vinhcine/src/features/profile/domain/model/my_profile.dart';
import 'package:barcode_widget/barcode_widget.dart';

class ProfileHeader extends StatelessWidget {
  MyProfile myProfile;

  ProfileHeader({super.key, required this.myProfile});
  late AppColors? appColors;

  @override
  Widget build(BuildContext context) {
    appColors = Theme.of(context).extension<AppColors>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          _buildAvatar(),
          const SizedBox(height: 12),
          Text(
            myProfile.fullName,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: appColors!.profileTextColor),
          ),
          const SizedBox(height: 12),
          _buildBarCode(),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                  child: _buildInfoItem(
                      "${'profile.total_pay'.tr()}:", "${myProfile.totalPay} đ")),
              Expanded(
                  child:
                      _buildInfoItem("${'profile.point'.tr()}:", "${myProfile.point}")),
              Expanded(
                child: _buildInfoItem(
                    "${'profile.watched_film_number'.tr()}:", "${myProfile.seenFilmNumber}"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return CachedNetworkImage(
        width: 80,
        height: 80,
        imageUrl: myProfile.avatar,
        imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                      Colors.blueGrey, BlendMode.colorBurn),
                ),
              ),
            ),
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: AppColorss.borderColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.error_outline,
              color: Colors.white,
              size: 40,
            )));
  }

  Widget _buildInfoItem(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: appColors!.profileTextColor),
        ),
        const SizedBox(height: 2),
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: appColors!.profileTextColor),
        ),
      ],
    );
  }

  Widget _buildBarCode() {
    return Container(
      color: appColors!.profileBarCodeBg,
      padding: const EdgeInsets.all(12),
      child: AspectRatio(
        aspectRatio: 5 / 1,
        child: BarcodeWidget(
          // color: appColors!.profileSeparateColor,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: appColors!.profileBarCodeText),
          barcode: Barcode.code128(),
          data: myProfile.barCode,
          errorBuilder: (context, error) => Center(child: Text(error)),
        ),
      ),
    );
  }
}
