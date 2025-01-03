import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/Home/Products/data/models/products_with_category_model/products_with_category/products_with_category.dart';
import 'package:mate_order_app/Features/Home/oredr/presentation/model_view/bloc/order_bloc.dart';
import 'package:mate_order_app/Features/Home/oredr/presentation/view/oreder_sheet_body.dart';
import 'package:mate_order_app/constants.dart';

class OrderSheet extends StatefulWidget {
  const OrderSheet({super.key, required this.product});
  final Product product;
  @override
  State<OrderSheet> createState() => _OrderSheetState();
}

class _OrderSheetState extends State<OrderSheet> {
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
  Widget build(BuildContext context) {
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
                color: Colors.white,
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
              child: BlocProvider(
                create: (context) => OrderBloc(widget.product),
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    topButtonIndicator(),
                    OrederSheetBody(
                      product: widget.product,
                    )
                  ],
                ),
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
