base class MenuEntity {
  final String serviceStatus;
  final MenuLists menuLists;

  MenuEntity({
    required this.serviceStatus,
    required this.menuLists,
  });
}

base class MenuLists {
  final List<Item> featuredItems;
  final Item menuPromoItem;
  final List<dynamic> orderModes;
  final List<Menu> menus;
  final List<SubMenu> subMenus;
  final List<MenuItem> menuItems;
  final List<SalesGroup> salesGroups;
  final List<SalesItem> salesItems;
  final List<ModifierGroup> modifierGroups;
  final List<Modifier> modifiers;
  final List<ModifierAction> modifierActions;
  final List<StyleCodeElement> styleCodes;
  final List<Disclaimer> disclaimers;
  final List<ComboConfig> comboConfig;
  final int cacheExpirationDate;

  MenuLists({
    required this.featuredItems,
    required this.menuPromoItem,
    required this.orderModes,
    required this.menus,
    required this.subMenus,
    required this.menuItems,
    required this.salesGroups,
    required this.salesItems,
    required this.modifierGroups,
    required this.modifiers,
    required this.modifierActions,
    required this.styleCodes,
    required this.disclaimers,
    required this.comboConfig,
    required this.cacheExpirationDate,
  });
}

base class ComboConfig {
  final List<double> salesGroupIds;
  final List<ComboSize> comboSizes;
  final int comboConfigId;

  ComboConfig({
    required this.salesGroupIds,
    required this.comboSizes,
    required this.comboConfigId,
  });
}

base class ComboSize {
  final List<ComboGroup> comboGroups;
  final ShortDescription size;
  final String baseImageName;
  final ShortDescription sizeType;

  ComboSize({
    required this.comboGroups,
    required this.size,
    required this.baseImageName,
    required this.sizeType,
  });
}

base class ComboGroup {
  final int salesItemId;
  final int salesGroupIndex;

  ComboGroup({
    required this.salesItemId,
    required this.salesGroupIndex,
  });
}

enum ShortDescription {
  baconator,
  classic,
  crispy,
  double,
  junior,
  km,
  large,
  medium,
  shortDescriptionLarge,
  shortDescriptionMedium,
  single,
  small,
  son,
  spicy,
  triple,
  value
}

base class Disclaimer {
  final String disclaimerCode;
  final String disclaimerText;

  Disclaimer({
    required this.disclaimerCode,
    required this.disclaimerText,
  });
}

base class Item {
  final int productId;
  final String url;
  final String type;
  final String image;

  Item({
    required this.productId,
    required this.url,
    required this.type,
    required this.image,
  });
}

base class MenuItem {
  final String name;
  final String description;
  final String displayName;
  final String baseImageName;
  final int menuItemId;
  final int defaultItemId;
  final List<int> salesItemIds;
  final int promoId;
  final double price;
  final String productGroupId;
  final int comboMenuItemId;
  final String titleTag;
  final String metaDescription;
  final String calorieRange;
  final String priceRange;
  final SelectionMode selectionMode;
  final Attributes attributes;
  final Label selectionLabel;
  final List<SalesGroup> salesGroups;
  final int comboConfigId;
  final Label comboLabel;

  MenuItem({
    required this.name,
    required this.description,
    required this.displayName,
    required this.baseImageName,
    required this.menuItemId,
    required this.defaultItemId,
    required this.salesItemIds,
    required this.promoId,
    required this.price,
    required this.productGroupId,
    required this.comboMenuItemId,
    required this.titleTag,
    required this.metaDescription,
    required this.calorieRange,
    required this.priceRange,
    required this.selectionMode,
    required this.attributes,
    required this.selectionLabel,
    required this.salesGroups,
    required this.comboConfigId,
    required this.comboLabel,
  });
}

base class Attributes {
  final SelectionLabel selectionLabel;

  Attributes({
    required this.selectionLabel,
  });
}

enum SelectionLabel { dippingSauce, style }

enum Label { meal, style }

base class SalesGroup {
  final String name;
  final String description;
  final String displayName;
  final double salesGroupId;
  final int defaultSalesItemId;
  final List<int> salesItemIds;
  final int minimumItems;
  final int maximumItems;
  final List<int> salesGroupIds;
  final List<SalesItemDetail> salesItemDetails;
  final String calorieRange;
  final String baseImageName;

  SalesGroup({
    required this.name,
    required this.description,
    required this.displayName,
    required this.salesGroupId,
    required this.defaultSalesItemId,
    required this.salesItemIds,
    required this.minimumItems,
    required this.maximumItems,
    required this.salesGroupIds,
    required this.salesItemDetails,
    required this.calorieRange,
    required this.baseImageName,
  });
}

base class SalesItemDetail {
  final int salesItemId;
  final double priceIncrement;

  SalesItemDetail({
    required this.salesItemId,
    required this.priceIncrement,
  });
}

enum SelectionMode { none, size, style }

base class Menu {
  final String name;
  final String displayName;
  final int menuId;
  final List<int> subMenus;
  final String productGroupId;
  final List<int> breakfastSubMenuIds;
  final List<int> lunchSubMenuIds;
  final List<String> disclaimerCodes;

  Menu({
    required this.name,
    required this.displayName,
    required this.menuId,
    required this.subMenus,
    required this.productGroupId,
    required this.breakfastSubMenuIds,
    required this.lunchSubMenuIds,
    required this.disclaimerCodes,
  });
}

base class ModifierAction {
  final String name;
  final String displayName;
  final int action;
  final String shortName;

  ModifierAction({
    required this.name,
    required this.displayName,
    required this.action,
    required this.shortName,
  });
}

base class ModifierGroup {
  final String name;
  final String description;
  final String displayName;
  final String baseImageName;
  final int modifierGroupId;
  final int minimumItems;
  final int maximumItems;
  final int perOptionMinimum;
  final int perOptionMaximum;
  final int sourceModifierGroupId;
  final List<int> modifiers;
  final int freeModifiers;
  final bool isPlain;
  final bool isBun;
  final bool isBase;
  final bool isMeat;
  final DisplayCode displayCode;
  final Attributes attributes;
  final String componentGroupId;

  ModifierGroup({
    required this.name,
    required this.description,
    required this.displayName,
    required this.baseImageName,
    required this.modifierGroupId,
    required this.minimumItems,
    required this.maximumItems,
    required this.perOptionMinimum,
    required this.perOptionMaximum,
    required this.sourceModifierGroupId,
    required this.modifiers,
    required this.freeModifiers,
    required this.isPlain,
    required this.isBun,
    required this.isBase,
    required this.isMeat,
    required this.displayCode,
    required this.attributes,
    required this.componentGroupId,
  });
}

enum DisplayCode { customization, selection }

base class Modifier {
  final String name;
  final String description;
  final String displayName;
  final int modifierId;
  final List<ItemModifier> itemModifiers;
  final String componentId;
  final StyleCodeEnum styleCode;
  final bool isSplittable;
  final int masterSequence;
  final double weight;
  final int posItemId;

  Modifier({
    required this.name,
    required this.description,
    required this.displayName,
    required this.modifierId,
    required this.itemModifiers,
    required this.componentId,
    required this.styleCode,
    required this.isSplittable,
    required this.masterSequence,
    required this.weight,
    required this.posItemId,
  });
}

base class ItemModifier {
  final int salesItemModifierId;
  final int modifierGroupId;
  final double price;
  final int modifierAction;

  ItemModifier({
    required this.salesItemModifierId,
    required this.modifierGroupId,
    required this.price,
    required this.modifierAction,
  });
}

enum StyleCodeEnum { addRem, amount, quantity, required }

base class SalesItem {
  final String name;
  final String description;
  final String displayName;
  final int salesItemId;
  final String categoryName;
  final double price;
  final List<int> modifierGroups;
  final List<DefaultOption> defaultOptions;
  final ShortDescription shortDescription;
  final bool isLto;
  final String productId;
  final Nutrition nutrition;
  final int alaCarteMenuItemId;
  final String calorieRange;
  final bool isFreestyle;
  final int posItemId;
  final int promoId;
  final String nwsgProductGroupId;
  final int originalPosItemId;

  SalesItem({
    required this.name,
    required this.description,
    required this.displayName,
    required this.salesItemId,
    required this.categoryName,
    required this.price,
    required this.modifierGroups,
    required this.defaultOptions,
    required this.shortDescription,
    required this.isLto,
    required this.productId,
    required this.nutrition,
    required this.alaCarteMenuItemId,
    required this.calorieRange,
    required this.isFreestyle,
    required this.posItemId,
    required this.promoId,
    required this.nwsgProductGroupId,
    required this.originalPosItemId,
  });
}

base class DefaultOption {
  final int modifierGroupId;
  final int modifierId;
  final int defaultQuantity;
  final int defaultReason;
  final int modifierAction;

  DefaultOption({
    required this.modifierGroupId,
    required this.modifierId,
    required this.defaultQuantity,
    required this.defaultReason,
    required this.modifierAction,
  });
}

base class Nutrition {
  final String calorieRange;
  final int servingSize;
  final int calories;
  final int caloriesFromFat;
  final double totalFat;
  final double saturated;
  final double transFattyAcids;
  final double cholesterol;
  final double sodium;
  final double carbohydrates;
  final double dietaryFiber;
  final double sugars;
  final double protein;
  final int vitaminA;
  final int vitaminC;
  final int vitaminD;
  final int calcium;
  final int iron;
  final double monounsaturated;
  final double polyunsaturated;
  final int potassium;
  final bool hasEgg;
  final bool hasFish;
  final bool hasMilk;
  final bool hasSoy;
  final bool hasTreenut;
  final bool hasPeanut;
  final bool hasWheat;
  final bool hasShellfish;
  final bool hasSesame;

  Nutrition({
    required this.calorieRange,
    required this.servingSize,
    required this.calories,
    required this.caloriesFromFat,
    required this.totalFat,
    required this.saturated,
    required this.transFattyAcids,
    required this.cholesterol,
    required this.sodium,
    required this.carbohydrates,
    required this.dietaryFiber,
    required this.sugars,
    required this.protein,
    required this.vitaminA,
    required this.vitaminC,
    required this.vitaminD,
    required this.calcium,
    required this.iron,
    required this.monounsaturated,
    required this.polyunsaturated,
    required this.potassium,
    required this.hasEgg,
    required this.hasFish,
    required this.hasMilk,
    required this.hasSoy,
    required this.hasTreenut,
    required this.hasPeanut,
    required this.hasWheat,
    required this.hasShellfish,
    required this.hasSesame,
  });
}

base class StyleCodeElement {
  final StyleCodeEnum styleCode;
  final List<int> modifierActionIds;

  StyleCodeElement({
    required this.styleCode,
    required this.modifierActionIds,
  });
}

base class SubMenu {
  final String name;
  final String description;
  final String displayName;
  final String baseImageName;
  final int subMenuId;
  final List<int> menuItems;
  final String productGroupId;
  final String titleTag;
  final String metaDescription;
  final String disclaimerCode;

  SubMenu({
    required this.name,
    required this.description,
    required this.displayName,
    required this.baseImageName,
    required this.subMenuId,
    required this.menuItems,
    required this.productGroupId,
    required this.titleTag,
    required this.metaDescription,
    required this.disclaimerCode,
  });
}
