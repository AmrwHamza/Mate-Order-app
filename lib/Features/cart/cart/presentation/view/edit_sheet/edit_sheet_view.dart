import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/cart/cart/data/models/cart_products_model.dart';
import 'package:mate_order_app/Features/cart/cart/presentation/view/edit_sheet/edit_sheet_body.dart';
import 'package:mate_order_app/constants.dart';

class EditSheetView extends StatefulWidget {
  const EditSheetView({super.key, required this.product});
  final ProductInCart product;
  @override
  State<EditSheetView> createState() => _EditSheetViewState();
}

class _EditSheetViewState extends State<EditSheetView> {
  final sheet = GlobalKey();
  final controller = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    controller.addListener(onChanged);
  }

  void onChanged() {
    final currentSize = controller.size;
    if (currentSize <= 0.05) collapse();
  }

  void collapse() => animateSheet(getSheet.snapSizes!.first);
  void anchor() => animateSheet(getSheet.snapSizes!.last);
  void expand() => animateSheet(getSheet.maxChildSize);
  void hide() => animateSheet(getSheet.minChildSize);

  void animateSheet(double size) {
    controller.animateTo(size,
        duration: const Duration(microseconds: 50), curve: Curves.easeInOut);
  }

  DraggableScrollableSheet get getSheet =>
      (sheet.currentWidget as DraggableScrollableSheet);

  @override
  Widget build(context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return DraggableScrollableSheet(
          key: sheet,
          initialChildSize: 0.3,
          maxChildSize: 0.95,
          minChildSize: 0.0,
          expand: true,
          snap: true,
          snapSizes: [60 / constraints.maxHeight, 0.5],
          builder: (context, scrollController) {
            return DecoratedBox(
              decoration: const BoxDecoration(
                // color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: kPrimaryColor6,
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(0, 1))
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  topButtonIndicator(),
                  EditSheetBody(
                    product: widget.product,
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  SliverToBoxAdapter topButtonIndicator() {
    return SliverToBoxAdapter(
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: Center(
                child: Wrap(
                  children: [
                    Container(
                      width: 100,
                      margin: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      height: 5,
                      decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
