import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:okonbini_flutter/model/item_category.dart';
import 'package:okonbini_flutter/provider/firebase_auth_provider.dart' as auth;
import 'package:okonbini_flutter/constant/urls.dart';

class ItemCategoryService {
  Future<List<ItemCategory>> getItemCategories() async {
    try {
      final userAuth = await auth.getUserInformationLocally();

      // idTokenの存在をチェック
      final String? idToken = userAuth['idToken'];
      if (idToken == null || idToken.isEmpty) {
        throw Exception("ID Token is missing");
      }

      final responseItemCategory = await http
          .get(Uri.parse(API_BASE_URL + 'items/categories'), headers: {
        'Authorization': 'Bearer ${userAuth['idToken']}',
        'Content-Type': 'application/json',
      });

      if (responseItemCategory.statusCode == 200) {
        final ItemCategoryData = jsonDecode(responseItemCategory.body);
        final List<ItemCategory> ItemCategoryList = [];

        for (var itemCategory in ItemCategoryData['items']) {
          ItemCategoryList.add(ItemCategory.fromJson(itemCategory));
        }

        return ItemCategoryList;
      } else {
        throw Exception(
            'Failed to retrieve item category list (other than status 200).: ${responseItemCategory.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to retrieve item category list.: $e');
    }
  }
}
