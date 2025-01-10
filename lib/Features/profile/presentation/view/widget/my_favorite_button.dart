import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/favorits/presentation/model_view/cubit/get_fav_cubit.dart';
import 'package:mate_order_app/Features/favorits/presentation/view/favorits_view.dart';

class MyFavoriteButton extends StatelessWidget {
  const MyFavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<GetFavCubit>().getFav();
        Get.to(const FavoritsView());
      },
      child: const ListTile(
        trailing: Icon(Icons.chevron_right),
        leading: Icon(Icons.favorite, color: Colors.black),
        title: Text('My Favorite'),
      ),
    );
  }
}
