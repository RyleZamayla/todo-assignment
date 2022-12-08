import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';

class CustomScrollBar extends StatefulWidget {
  final BoxScrollView Function (ScrollController controller) builder;

  const CustomScrollBar({Key? key, required this.builder}) : super(key: key);

  @override
  State<CustomScrollBar> createState() => _CustomScrollBarState();
}

class _CustomScrollBarState extends State<CustomScrollBar> {

  late ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: DraggableScrollbar(
        padding: const EdgeInsets.only(right: 5),
        controller: controller,
        heightScrollThumb: 200,
        scrollbarTimeToFade: const Duration(seconds: 1),
        backgroundColor: Colors.blue,
        scrollThumbBuilder: scrollThumbBuilder,
        child: widget.builder(controller)
      )
  );
  Widget scrollThumbBuilder(

      Color backgroundColor,
      Animation<double> thumbAnimation,
      Animation<double> labelAnimation,
      double height, {
        Text? labelText,
        BoxConstraints? labelConstraints,
      }) => FadeTransition(
      opacity: thumbAnimation,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: backgroundColor
        ),
        height: height,
        width: 12,
      )
  );
}
