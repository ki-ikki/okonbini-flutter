import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okonbini_flutter/infrastructure/store_service.dart';
import 'package:okonbini_flutter/model/store.dart';
import 'package:okonbini_flutter/component/Search/store_box.dart';

class StoreListBox extends ConsumerWidget {
  const StoreListBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureStores = StoreService().getStores();

    return FutureBuilder<List<Store>>(
      future: futureStores,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('エラー: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Text('データがありません');
        } else {
          final stores = snapshot.data!;
          return Container(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('コンビニ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Row(
                  children: [
                    for (final store in stores) storeBox(store),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
