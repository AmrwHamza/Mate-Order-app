import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/cart/cart/presentation/model_view/cart_cubit/cart_cubit.dart';
import 'package:mate_order_app/Features/cart/cart/presentation/model_view/edit_amount/edit_amount_cubit.dart';
import 'package:mate_order_app/Features/cart/cart/presentation/view/edit_sheet/edit_sheet_view.dart';
import 'package:mate_order_app/Features/cart/cart/presentation/view/widgets/delete_button_from_cart.dart';
import 'package:mate_order_app/constants.dart';

import '../../../data/models/cart_products_model.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({super.key, required this.product});
  final ProductInCart product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditAmountCubit(
          product.totalAmount!, product.amount!, product.id!, product.price!),
      child: Builder(builder: (context) {
        final editAmountCubit = context.read<EditAmountCubit>();

        return Container(
          width: MediaQuery.of(context).size.width * 0.9,
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          height: 120,
          decoration: BoxDecoration(
              color: kPrimaryColor8, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imge(),
                divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    name(context),
                    BlocBuilder<EditAmountCubit, EditAmountState>(
                      builder: (context, state) {
                        return Text(
                          "Price: ${context.read<EditAmountCubit>().totalPrice} "
                          r'SYP',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                    AmountText(product: product),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        deleteButton(context),
                        const SizedBox(
                          width: 10,
                        ),
                        BlocBuilder<EditAmountCubit, EditAmountState>(
                          builder: (context, state) {
                            return ElevatedButton(
                                onPressed: () async {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Colors.black.withOpacity(0.5),
                                    builder: (context) {
                                      return BlocProvider.value(
                                        value: editAmountCubit,
                                        child: EditSheetView(product: product),
                                      );
                                    },
                                  );
                                },
                                child: const Icon(Icons.edit));
                          },
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
      
      
        );
      }),
    );
  }

  SizedBox deleteButton(BuildContext context) {
    return SizedBox(
      child: DeleteButtonFromCart(
        id: product.id!,
      ),
    );
  }

  SizedBox name(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.55,
      child: Text(
        'Name: ${product.name}',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  VerticalDivider divider() {
    return const VerticalDivider(
      color: kPrimaryColor10,
      thickness: 5,
      indent: 5,
      endIndent: 5,
    );
  }

  AspectRatio imge() {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: "$baseurlImg"
              "${product.imagePath!}",
          placeholder: (context, url) => const Align(
            alignment: Alignment.center,
            child: SizedBox(
                height: 60, width: 60, child: CircularProgressIndicator()),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

class AmountText extends StatelessWidget {
  const AmountText({
    super.key,
    required this.product,
  });

  final ProductInCart product;

  @override
  Widget build(BuildContext context) {
    

    return BlocBuilder<EditAmountCubit, EditAmountState>(
      builder: (context, state) {
        return Text('amount:${context.read<EditAmountCubit>().currentAmount}');
      },
    );
  }
}
