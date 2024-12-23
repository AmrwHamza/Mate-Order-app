import 'package:flutter/material.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../../../profile/presentation/view/widget/check_botton.dart';
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

  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
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
          SizedBox(width: 40),
          Column(
            children: [
              SizedBox(height: 30),
              Text(
                'Product Name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                'The Price :   ${numberOfproducts * 100}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                    icon: Icon(
                      Icons.remove_circle,
                      color: kPrimaryColor3,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '$numberOfproducts',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(
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
              SizedBox(height: 20),
              Row(
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
