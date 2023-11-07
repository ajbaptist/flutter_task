import 'package:flutter/material.dart';
import 'package:flutter_task/utils/styles.dart';

import '../../model/product_model.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key, required this.detail});
  final Product detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.network(
                      detail.thumbnail!,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          padding: const EdgeInsets.all(08),
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.grey,
                          ),
                          child: const Icon(Icons.favorite_border)),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                child: Text(
                  detail.title!,
                  style: Styles.textStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                child: Text(
                  detail.description!,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                child: Text(
                  '\$${detail.price}',
                  style: Styles.textStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                child: Row(
                    children: [1, 2, 3, 4]
                        .map((e) => const Icon(Icons.star))
                        .toList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
