import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:okonbini_flutter/model/store.dart';
import 'package:okonbini_flutter/provider/firebase_auth_provider.dart' as auth;
import 'package:okonbini_flutter/constant/urls.dart';

class StoreService {
  Future<List<Store>> getStores() async {
    try {
      final userAuth = await auth.getUserInformationLocally();

      // idTokenの存在をチェック
      final String? idToken = userAuth['idToken'];
      if (idToken == null || idToken.isEmpty) {
        throw Exception("ID Token is missing");
      }

      final responseStore =
          await http.get(Uri.parse(API_BASE_URL + 'stores/list'), headers: {
        'Authorization': 'Bearer ${userAuth['idToken']}',
        'Content-Type': 'application/json',
      });

      if (responseStore.statusCode == 200) {
        final storeData = jsonDecode(responseStore.body);
        final List<Store> storeList = [];

        for (var store in storeData['items']) {
          storeList.add(Store.fromJson(store));
        }

        return storeList;
      } else {
        throw Exception(
            'Failed to retrieve store list (other than status 200).: ${responseStore.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to retrieve store list.: $e');
    }
  }
}
