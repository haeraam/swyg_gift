import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/cubits/create_list_cubit/create_list_cubit.dart';
import 'package:swyg/models/auth.dart';
import 'package:swyg/models/category_model.dart';
import 'package:swyg/pages/create_list_page/create_list_preview.dart';
import 'package:swyg/pages/page.dart';
import 'package:swyg/theme/color.dart';

class CreateListName extends StatefulWidget {
  const CreateListName({Key? key}) : super(key: key);

  @override
  State<CreateListName> createState() => _CreateListNameState();
}

class _CreateListNameState extends State<CreateListName> {
  String _listName = '';
  String _listComent = '';
  final TextEditingController _listNameTextController = TextEditingController();
  final TextEditingController _listComentTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Category> categoryNm = context.read<CreateListCubit>().state.categoryNm ?? <Category>[];
    List<int> prodictIndexs = context.read<CreateListCubit>().state.productListPd ?? [];
    String memberNm = Auth().memberNm;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 96,
        backgroundColor: blackB1C,
        title: Container(
          padding: const EdgeInsets.only(top: 50),
          child: const Text(
            '리스트 정보 입력',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: TextButton(
              onPressed: () {
                if (_listNameTextController.text.isNotEmpty && _listComentTextController.text.isNotEmpty) {
                  context.read<CreateListCubit>().createList(
                        productListNm: _listName,
                        productListCmt: _listComent,
                        productListPd: prodictIndexs,
                        categoryNm: categoryNm.map((category) => category.categoryNm).toList(),
                        memberNm: memberNm,
                      );
                }
              },
              child: Text(
                '완료',
                style: TextStyle(
                  color: (_listNameTextController.text.isNotEmpty && _listComentTextController.text.isNotEmpty) ? primaryC : blackB3C,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
        leading: Container(
          padding: const EdgeInsets.only(top: 50),
          child: IconButton(
            onPressed: () {
              context.go('/createListChoiceItem', extra: 'back');
            },
            icon: const Icon(Icons.chevron_left),
          ),
        ),
      ),
      body: BlocListener<CreateListCubit, CreateListState>(
        listener: (context, state) {
          if (state.createListId != null) {
            context.go('/itemlist/${state.createListId}');
            context.read<CreateListCubit>().reset();
          }
        },
        child: PageWrap(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '미리보기',
                    style: TextStyle(
                      fontSize: 17,
                      color: blackB1C,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CreateListPreview(
                    memberName: Auth().memberNm,
                    listName: _listName,
                    categories: categoryNm,
                    coment: _listComent,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '리스트명',
                    style: TextStyle(
                      fontSize: 17,
                      color: blackB1C,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      TextField(
                        onChanged: (s) {
                          _listName = s;
                          setState(() {});
                        },
                        controller: _listNameTextController,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: blackB5C)),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          focusedBorder: OutlineInputBorder(),
                          labelText: '아이템 명을 입력해 주세요',
                          labelStyle: TextStyle(color: blackB5C),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            '9자이내',
                            style: TextStyle(color: primaryC, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 15,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '리스트 소개글',
                    style: TextStyle(
                      fontSize: 17,
                      color: blackB1C,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      TextField(
                        onChanged: (s) {
                          _listComent = s;
                          setState(() {});
                        },
                        controller: _listComentTextController,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: blackB5C)),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          focusedBorder: OutlineInputBorder(),
                          labelText: '소개글을 입력해 주세요',
                          labelStyle: TextStyle(color: blackB5C),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            '20자이내',
                            style: TextStyle(color: primaryC, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 15,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
