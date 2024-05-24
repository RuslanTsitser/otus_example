import 'package:flutter/material.dart';

class CustomMultiChildLayoutExample extends StatelessWidget {
  const CustomMultiChildLayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomMultiChildLayout Example'),
      ),
      body: Center(
        child: CustomMultiChildLayout(
          delegate: CustomMultiChildLayoutDelegate(),
          children: [
            LayoutId(
              id: 0,
              child: Container(
                color: Colors.blue,
                child: const Center(
                  child: Text('This is a blue container'),
                ),
              ),
            ),
            LayoutId(
              id: 1,
              child: Container(
                color: Colors.red,
                child: const Center(
                  child: Text('This is a red container'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  CustomMultiChildLayoutDelegate();

  @override
  void performLayout(Size size) {
    layoutChild(0, BoxConstraints.loose(size));
    positionChild(0, Offset.zero);
    layoutChild(1, BoxConstraints.loose(size));
    positionChild(1, Offset(size.width / 2, size.height / 2));
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return constraints.biggest;
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}
