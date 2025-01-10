import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../utils/assets.dart';
import '../../../Features/profile/presentation/view/widget/check_botton.dart';
import 'cancel_button.dart';

class ProductOptionSheet extends StatefulWidget {
  final int numberOfproducts;
  const ProductOptionSheet({super.key, required this.numberOfproducts});

  @override
  State<ProductOptionSheet> createState() => _ProductOptionSheetState();
}

class _ProductOptionSheetState extends State<ProductOptionSheet> {
  late int numberOfproducts;
  @override
  void initState() {
    super.initState();
    numberOfproducts = widget.numberOfproducts;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              height: 100,
              width: 100,
              AssetsData.store,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 40),
          Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'Product Name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ).tr(),
              Text(
                'Price :   ${numberOfproducts * 100}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (numberOfproducts > 1) {
                          numberOfproducts--;
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                      color: kPrimaryColor3,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '$numberOfproducts',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(
                      Icons.add_circle,
                      color: kPrimaryColor3,
                      fill: 0.5,
                      applyTextScaling: true,
                    ),
                    onPressed: () {
                      setState(() {
                        numberOfproducts++;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  CheckBotton(),
                  SizedBox(width: 10),
                  CancelButton(),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
