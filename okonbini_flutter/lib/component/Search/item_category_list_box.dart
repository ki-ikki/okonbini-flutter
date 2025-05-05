import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okonbini_flutter/infrastructure/item_category_service.dart';
import 'package:okonbini_flutter/model/item_category.dart';
import 'package:okonbini_flutter/component/Search/item_category_box.dart';

class ItemCategoryListBox extends ConsumerWidget {
  const ItemCategoryListBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureItemCategories = ItemCategoryService().getItemCategories();

    return FutureBuilder<List<ItemCategory>>(
      future: futureItemCategories,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('データがありません'));
        }

        final itemCategories = snapshot.data!;

        return Container(
          height: 400,
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child:
                    Text('カテゴリ', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: itemCategories.length,
                  itemBuilder: (context, index) {
                    return itemCategoryBox(itemCategories[index]);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
