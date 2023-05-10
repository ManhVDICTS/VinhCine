import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinhcine/src/components/button/app_button.dart';
import 'package:vinhcine/src/features/profile/domain/model/my_profile.dart';
import 'package:barcode_widget/barcode_widget.dart';

class ProfileCard extends StatelessWidget {
  MyProfile myProfile;

  ProfileCard({super.key, required this.myProfile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildAvatar(),
              const SizedBox(width: 5),
              _buildInfo(),
            ],
          ),
          const SizedBox(height: 15),
          _buildBarCode()
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
            colorFilter:
                const ColorFilter.mode(Colors.blueGrey, BlendMode.colorBurn),
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  Widget _buildInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          myProfile.fullName,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        _buildInfoItem("Tổng chi tiêu:", "${myProfile.totalPay}đ"),
        _buildInfoItem("Số phim đã xem:", "${myProfile.seenFilmNumber}"),
        _buildInfoItem("Điểm tích luỹ:", "${myProfile.point}"),
      ],
    );
  }

  Widget _buildInfoItem(String title, String text) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildBarCode() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: AspectRatio(
            aspectRatio: 4 / 1,
            child: BarcodeWidget(
              barcode: Barcode.code128(),
              data: myProfile.barCode,
              errorBuilder: (context, error) => Center(child: Text(error)),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.only(left: 20),
            child: AppWhiteButton(
              title: 'Cập nhật',
              onPressed: () => {},
              isLoading: false,
            ),
          ),
        ),
      ],
    );
  }
}
