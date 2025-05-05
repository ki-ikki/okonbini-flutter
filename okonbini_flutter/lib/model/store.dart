class Store {
  final String storeName;
  final String storeLogicalName;
  final String colorCode;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? deletedAt;

  Store({
    required this.storeName,
    required this.storeLogicalName,
    required this.colorCode,
    required this.isActive,
    required this.createdAt,
    this.deletedAt,
  });

  // JSON から User インスタンスを作成する
  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      storeName: json['store_name'],
      storeLogicalName: json['store_logical_name'],
      colorCode: json['color_code'],
      isActive: json['is_active'],
      createdAt: DateTime.parse(json['created_at']),
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
    );
  }

  // User インスタンスを JSON に変換する
  Map<String, dynamic> toJson() {
    return {
      'store_name': storeName,
      'store_logical_name': storeLogicalName,
      'color_code': colorCode,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
    };
  }

  // 文字列に変換する
  @override
  String toString() {
    return 'User(storeName: $storeName, storeLogicalName: $storeLogicalName colorCode: $colorCode, isActive: $isActive, createdAt: $createdAt, deletedAt: $deletedAt)';
  }
}
