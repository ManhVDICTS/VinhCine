import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerSlider extends StatefulWidget {
  BannerSlider(
      {super.key,
      required this.imgList,
      required this.width,
      required this.height,
      required this.index});

  final List<String> imgList;
  final double width;
  final double height;
  int index;

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(children: [
          Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
              clipBehavior: Clip.hardEdge,
              child: CarouselSlider.builder(
                itemCount: widget.imgList.length,
                itemBuilder: (ctx, itemIndex, pageViewIndex) {
                  return CachedNetworkImage(
                    width: widget.width,
                    height: widget.height,
                    fit: BoxFit.fill,
                    imageUrl: widget.imgList[itemIndex],
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  );
                },
                options: CarouselOptions(
                  height: widget.height,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      widget.index = index;
                    });
                  },
                ),
              )),
          Positioned.fill(
            bottom: -widget.height + 20,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.imgList.asMap().entries.map((entry) {
                  return Container(
                    width: 25,
                    height: 4,
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(
                            widget.index == entry.key ? 0.9 : 0.4)),
                  );
                }).toList()),
          )
        ]),
      ],
    );
  }
}
