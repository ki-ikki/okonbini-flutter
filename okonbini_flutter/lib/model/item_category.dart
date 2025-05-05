class ItemCategory {
  static const String CATEGORY_ONIGIRI = 'onigiri';
  static const String CATEGORY_SUSHI = 'sushi';
  static const String CATEGORY_BENTO = 'bento';
  static const String CATEGORY_SANDWICH = 'sandwich';
  static const String CATEGORY_BREAD = 'bread';
  static const String CATEGORY_SOBA = 'soba';
  static const String CATEGORY_UDON = 'udon';
  static const String CATEGORY_NOODLE = 'noodle';
  static const String CATEGORY_PASTA = 'pasta';
  static const String CATEGORY_GRATIN = 'gratin';
  static const String CATEGORY_DORIAN = 'dorian';
  static const String CATEGORY_DAILY_DISH = 'daily_dish';
  static const String CATEGORY_SALAD = 'salad';
  static const String CATEGORY_SWEETS = 'sweets';
  static const String CATEGORY_ICE_CREAM = 'ice_cream';
  static const String CATEGORY_HOT_SNACK = 'hot_snack';
  static const String CATEGORY_ODEN = 'oden';
  static const String CATEGORY_CHUKAMAN = 'chukaman';
  static const String CATEGORY_FROZEN = 'frozen';
  static const String CATEGORY_CAFE = 'cafe';
  static const String CATEGORY_BAKED_SWEETS = 'baked_sweets';
  static const String CATEGORY_PROCESSED_FOOD = 'processed_food';
  static const String CATEGORY_BEVERAGE = 'beverage';
  static const String CATEGORY_ALCOHOL = 'alcohol';
  static const String CATEGORY_OTHER = 'other';

  final String categoryName;
  final String categoryLabel;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  ItemCategory({
    required this.categoryName,
    required this.categoryLabel,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ItemCategory.fromJson(Map<String, dynamic> json) {
    return ItemCategory(
      categoryName: json['category_name'],
      categoryLabel: json['category_label'],
      isActive: json['is_active'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_name': categoryName,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  static List<String> getCategoryList() {
    return [
      CATEGORY_ONIGIRI,
      CATEGORY_SUSHI,
      CATEGORY_BENTO,
      CATEGORY_SANDWICH,
      CATEGORY_BREAD,
      CATEGORY_SOBA,
      CATEGORY_UDON,
      CATEGORY_NOODLE,
      CATEGORY_PASTA,
      CATEGORY_GRATIN,
      CATEGORY_DORIAN,
      CATEGORY_DAILY_DISH,
      CATEGORY_SALAD,
      CATEGORY_SWEETS,
      CATEGORY_ICE_CREAM,
      CATEGORY_HOT_SNACK,
      CATEGORY_ODEN,
      CATEGORY_CHUKAMAN,
      CATEGORY_FROZEN,
      CATEGORY_CAFE,
      CATEGORY_BAKED_SWEETS,
      CATEGORY_PROCESSED_FOOD,
      CATEGORY_BEVERAGE,
      CATEGORY_ALCOHOL,
      CATEGORY_OTHER,
    ];
  }
}
