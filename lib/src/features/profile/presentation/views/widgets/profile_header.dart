import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinhcine/src/components/button/app_button.dart';
import 'package:vinhcine/src/configs/app_themes/app_colors.dart';
import 'package:vinhcine/src/features/profile/domain/model/my_profile.dart';
import 'package:barcode_widget/barcode_widget.dart';

class ProfileHeader extends StatelessWidget {
  MyProfile myProfile;

  ProfileHeader({super.key, required this.myProfile});

  @override
  Widget build(BuildContext context) {
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
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          const SizedBox(height: 12),
          _buildBarCode(),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buildInfoItem("Tổng chi tiêu:", "${myProfile.totalPay} đ")),
              Expanded(child: _buildInfoItem("Điểm tích luỹ:", "${myProfile.point}")),
              Expanded(child: _buildInfoItem("Số phim đã xem:", "${myProfile.seenFilmNumber}"),),
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
              color: AppColors.borderColor,
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
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        const SizedBox(height: 2),
        Text(
          text,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildBarCode() {
    return Container(
      color: AppColors.borderColor.withAlpha(50),
      padding: const EdgeInsets.all(12),
      child: AspectRatio(
        aspectRatio: 5 / 1,
        child: BarcodeWidget(
          barcode: Barcode.code128(),
          data: myProfile.barCode,
          errorBuilder: (context, error) => Center(child: Text(error)),
        ),
      ),
    );
  }
}
