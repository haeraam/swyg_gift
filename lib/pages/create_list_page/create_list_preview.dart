import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swyg/cubits/create_list_cubit/create_list_cubit.dart';
import 'package:swyg/models/category_model.dart';
import 'package:swyg/theme/color.dart';

class CreateListPreview extends StatelessWidget {
  const CreateListPreview({super.key,  required this.memberName, required this.listName, required this.categories, required this.coment});
  final String memberName;
  final String listName;
  final List<Category> categories;
  final String coment;

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = context.watch<CreateListCubit>().state.categoryNm!;

    return Container(
      padding: const EdgeInsets.only(top: 17, left: 28, right: 28),
      height: 151,
      color: const Color(0xFFF4F4F4),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Container(),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: blackB5C),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listName.isEmpty ? '리스트 명을 입력해 주세요' : listName,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: blackB3C),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    memberName,
                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: blackB3C),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: categories
                        .map((category) => Container(
                              margin: const EdgeInsets.only(right: 4),
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(color: const Color(0xFFE7E7E7), borderRadius: BorderRadius.circular(3)),
                              child: Text(
                                category.categoryNm,
                                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10, color: blackB2C),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 28,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Row(children: [
              const Text(
                '소개',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: blackB3C),
              ),
              const SizedBox(width: 6),
              Text(
                coment.isEmpty ? '소개글을 입력해주세요' : coment,
                style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: blackB4C),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
