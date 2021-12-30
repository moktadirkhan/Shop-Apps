// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop_app/src/components/container/list_card_handler.dart';
import 'package:shop_app/src/models/list_container_data.dart';
import 'package:shop_app/src/models/list_item.dart';

class ListContainer extends StatelessWidget {
  final ListContainerData? data;
  final bool isScrollable;
  final bool isHorizontal;
  const ListContainer({
    Key? key,
    this.data,
    this.isHorizontal = true,
    this.isScrollable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
      physics: isScrollable
          ? BouncingScrollPhysics()
          : NeverScrollableScrollPhysics(),
      itemCount: data!.items!.length,
      itemBuilder: (context, index) {
        return _buildCard(
          index,
          data!.items![index],
        );
      },
    );
  }

  Widget _buildCard(int index, ListItem item) {
    return ListCardHandler(
      item: item,
      index: index,
    );
  }
}
