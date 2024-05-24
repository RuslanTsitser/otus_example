import 'package:flutter/material.dart';

class CustomSingleChildLayoutExample extends StatelessWidget {
  const CustomSingleChildLayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomSingleChildLayout Example'),
      ),
      body: Center(
        child: CustomSingleChildLayout(
          delegate: const CustomSingleChildLayoutDelegate(),
          child: Container(
            color: Colors.blue,
            child: const Center(
              child: Text('This is a CustomSingleChildLayout Example'),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSingleChildLayoutDelegate extends SingleChildLayoutDelegate {
  const CustomSingleChildLayoutDelegate();

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return const BoxConstraints(
      minWidth: 20,
      maxWidth: 400,
      minHeight: 20,
      maxHeight: 400,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    print(childSize);
    return Offset(
      (size.width - childSize.width) / 2,
      (size.height - childSize.height),
    );
  }

  @override
  bool shouldRelayout(covariant CustomSingleChildLayoutDelegate oldDelegate) {
    return true;
  }
}
