  // Widget _backgroundAnimation() {
  //   return AnimatedSwitcher(
  //       duration: const Duration(milliseconds: 500),
  //       switchOutCurve: Curves.easeInOut,
  //       child: CachedNetworkImage(
  //         width: double.maxFinite,
  //         height: double.maxFinite,
  //         key: ValueKey(_indexBanner),
  //         fit: BoxFit.cover,
  //         imageUrl: imgList[_indexBanner],
  //         placeholder: (context, url) => CircularProgressIndicator(),
  //         errorWidget: (context, url, error) => Icon(Icons.error),
  //       ));
  // }

  // Widget _backgroundShadow() {
  //   return Positioned.fill(
  //     child: Container(
  //       decoration: const BoxDecoration(
  //         gradient: LinearGradient(
  //           begin: Alignment.topCenter,
  //           end: Alignment.bottomCenter,
  //           stops: [0.2, 0.5, 0.7, 1],
  //           colors: [
  //             Color.fromRGBO(0, 0, 0, 0.6),
  //             Color.fromRGBO(0, 0, 0, 0.45),
  //             Color.fromRGBO(0, 0, 0, 0.3),
  //             Colors.transparent,
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
