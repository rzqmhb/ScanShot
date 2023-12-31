import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  // const LoadingWidget({super.key});

  final Widget widget;

  LoadingWidget({required this.widget});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget,
        Positioned.fill(
            child: Center(
          child: Container(
            padding: EdgeInsets.all(8.0),
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Center(
                child: LoadingAnimationWidget.discreteCircle(
                    color: Color.fromARGB(255, 255, 198, 11), size: 70)),
          ),
        )),
      ],
      // child:
    );
  }
}
