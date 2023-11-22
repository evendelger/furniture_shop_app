import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

const _padding = 52.0;
// поскольку только после создания бэка я понял, что картинки изначально
// должны были быть в вертикальном виде, то решил немного прийти к общему
// значению обрезания
const _aspectRatio = 0.74;

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: _padding),
      child: AspectRatio(
        aspectRatio: _aspectRatio,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) {
            return DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
                image: DecorationImage(
                  image: imageProvider,
                  alignment: FractionalOffset.topLeft,
                  fit: BoxFit.fitHeight,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
