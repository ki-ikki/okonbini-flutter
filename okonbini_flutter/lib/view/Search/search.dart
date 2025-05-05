import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okonbini_flutter/component/Search/keyword_search_field.dart';
import 'package:okonbini_flutter/component/Search/store_list_box.dart';
import 'package:okonbini_flutter/component/Search/item_category_list_box.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: const Color(0xFFF1F9FF),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // キーワード検索
              Container(
                child: const KeywordSearchField(),
              ),

              // ストア選択
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const StoreListBox(),
              ),

              // カテゴリ選択
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const ItemCategoryListBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
