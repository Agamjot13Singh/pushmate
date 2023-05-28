import 'package:flutter/material.dart';

class GifPageRoute<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;
  final String gifPath;

  GifPageRoute({required this.builder, required this.gifPath})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return Stack(
              children: [
                child,
                FadeTransition(
                  opacity: animation,
                  child: Image.asset(
                    gifPath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ],
            );
          },
        );
}
