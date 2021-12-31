// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:shop_app/src/components/container/grid_card_handler.dart';
import 'package:shop_app/src/models/grid_container_data.dart';

class GridContainer extends StatelessWidget {
  final GridContainerData? data;
  final bool isScrollable;
  final bool isHorizontal;
  final int crossAxisCount;

  GridContainer({
    this.data,
    this.isScrollable = true,
    this.isHorizontal = false,
    this.crossAxisCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 2 / 3,
      ),
      shrinkWrap: true,
      physics: isScrollable == true
          ? const ScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemCount: data!.items!.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: _buildGridCard(index),
        );
      },
    );
  }

  Widget _buildGridCard(int index) {
    return GridCardHandler(
      data!.items![index],
      index,
    );
  }
}
