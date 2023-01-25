import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swyg/cubits/my_pick_cubit/my_pick_cubit.dart';
import 'package:swyg/models/item_list_model.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/theme/color.dart';
import 'package:swyg/widgets/item_list_widget.dart';
import 'package:swyg/widgets/item_widget.dart';

class MyPick extends StatefulWidget {
  const MyPick({Key? key}) : super(key: key);

  @override
  State<MyPick> createState() => _MyPickState();
}

class _MyPickState extends State<MyPick> {
  bool isSelectedList = true;

  @override
  Widget build(BuildContext context) {
    List<Item> items = context.watch<MyPickCubit>().state.items;
    List<ItemList> itemLists = context.watch<MyPickCubit>().state.itemLists;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 45),
                const Text('MT PICK',
                    style: TextStyle(
                        fontSize: 19,
                        color: blackB1C,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 45),
                Row(
                  children: [
                    OutlinedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16)),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (isSelectedList) return Colors.black;
                            if (states.contains(MaterialState.hovered)) {
                              return Colors.black.withOpacity(0.01);
                            }
                            return Colors
                                .white; // Defer to the widget's default.
                          },
                        ),
                        overlayColor: MaterialStateProperty.all(
                            Colors.black.withOpacity(0.03)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(99),
                          ),
                        ),
                      ),
                      onPressed: () {
                        isSelectedList = true;
                        setState(() {});
                      },
                      child: Text(
                        '리스트 ${itemLists.length} ',
                        style: TextStyle(
                            fontSize: 14,
                            color: isSelectedList ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16)),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (!isSelectedList) return Colors.black;
                            if (states.contains(MaterialState.hovered)) {
                              return Colors.black.withOpacity(0.01);
                            }
                            return Colors
                                .white; // Defer to the widget's default.
                          },
                        ),
                        overlayColor: MaterialStateProperty.all(
                            Colors.black.withOpacity(0.03)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(99),
                          ),
                        ),
                      ),
                      onPressed: () {
                        isSelectedList = false;
                        setState(() {});
                      },
                      child: Text(
                        '아이템 ${items.length}',
                        style: TextStyle(
                            fontSize: 14,
                            color:
                                !isSelectedList ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: isSelectedList ? itemLists.length : items.length,
            itemBuilder: (context, index) => Column(
              children: [
                if (isSelectedList)
                  ItemListWidget(
                    itemList: itemLists[index],
                  ),
                if (!isSelectedList)
                  ItemWidget(
                    isVertical: true,
                    item: items[index],
                  ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
