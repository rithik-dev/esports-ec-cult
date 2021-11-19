import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyCachedNetworkImage extends StatelessWidget {
  final String? url;
  final double borderRadius;
  final double? width;
  final double? height;
  final double padding;
  final bool zoomToFit;
  final bool isCircle;
  final double radius;

  static const _fallbackUrl =
      'https://images.unsplash.com/photo-1534423861386-85a16f5d13fd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80';

  const MyCachedNetworkImage({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.radius = 30,
    this.isCircle = false,
    this.zoomToFit = true,
    this.borderRadius = 10,
    this.padding = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final errImage = _errorImage(height: height, width: width);
    final _borderRadius = isCircle ? null : BorderRadius.circular(borderRadius);

    return SizedBox(
      height: isCircle ? radius * 2 : height,
      width: isCircle ? radius * 2 : width,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        ),
        // child: url == null
        //     ? errImage
        //     :
        child: AspectRatio(
          aspectRatio: 1.0,
          child: CachedNetworkImage(
            imageUrl: url ?? _fallbackUrl,
            fit: zoomToFit ? BoxFit.cover : null,
            placeholder: (context, _) => Shimmer.fromColors(
              baseColor: Theme.of(context).cardColor,
              highlightColor: Theme.of(context).scaffoldBackgroundColor,
              period: const Duration(milliseconds: 250),
              child: const Material(color: Colors.white),
            ),
            errorWidget: (_, __, ___) => MyCachedNetworkImage(
              url: _fallbackUrl,
              zoomToFit: true,
              padding: 0,
              isCircle: isCircle,
              borderRadius: _borderRadius!.topLeft.x,
            ),
          ),
        ),
      ),
    );
  }

// Widget _errorImage({
//   double? height,
//   double? width,
// }) =>
//     Image.asset(
//       "assets/images/app-home.png",
//       height: height,
//       width: width,
//       fit: isCircle ? BoxFit.cover : null,
//     );
}
