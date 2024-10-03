import 'package:navalia_code_challenge/core/utils/enum_utils.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';

final class MenuEntityModel extends MenuEntity {
  MenuEntityModel({
    required super.serviceStatus,
    required super.menuLists,
  });

  factory MenuEntityModel.fromJson(Map<String, dynamic> json) =>
      MenuEntityModel(
        serviceStatus: json["serviceStatus"],
        menuLists: MenuListsModel.fromJson(json["menuLists"]),
      );
}

final class MenuListsModel extends MenuLists {
  MenuListsModel({
    required super.featuredItems,
    required super.menuPromoItem,
    required super.orderModes,
    required super.menus,
    required super.subMenus,
    required super.menuItems,
    required super.salesGroups,
    required super.salesItems,
    required super.modifierGroups,
    required super.modifiers,
    required super.modifierActions,
    required super.styleCodes,
    required super.disclaimers,
    required super.comboConfig,
    required super.cacheExpirationDate,
  });

  factory MenuListsModel.fromJson(Map<String, dynamic> json) => MenuListsModel(
        featuredItems: List<Item>.from(
            json["featuredItems"].map((x) => ItemModel.fromJson(x))),
        menuPromoItem: ItemModel.fromJson(json["menuPromoItem"]),
        orderModes: List<dynamic>.from(json["orderModes"].map((x) => x)),
        menus: List<Menu>.from(json["menus"].map((x) => MenuModel.fromJson(x))),
        subMenus: List<SubMenu>.from(
            json["subMenus"].map((x) => SubMenuModel.fromJson(x))),
        menuItems: List<MenuItem>.from(
            json["menuItems"].map((x) => MenuItemModel.fromJson(x))),
        salesGroups: List<SalesGroup>.from(
            json["salesGroups"].map((x) => SalesGroupModel.fromJson(x))),
        salesItems: List<SalesItem>.from(
            json["salesItems"].map((x) => SalesItemModel.fromJson(x))),
        modifierGroups: List<ModifierGroup>.from(
            json["modifierGroups"].map((x) => ModifierGroupModel.fromJson(x))),
        modifiers: List<Modifier>.from(
            json["modifiers"].map((x) => ModifierModel.fromJson(x))),
        modifierActions: List<ModifierAction>.from(json["modifierActions"]
            .map((x) => ModifierActionModel.fromJson(x))),
        styleCodes: List<StyleCodeElement>.from(
            json["styleCodes"].map((x) => StyleCodeElementModel.fromJson(x))),
        disclaimers: List<Disclaimer>.from(
            json["disclaimers"].map((x) => DisclaimerModel.fromJson(x))),
        comboConfig: List<ComboConfig>.from(
            json["comboConfig"].map((x) => ComboConfigModel.fromJson(x))),
        cacheExpirationDate: json["cacheExpirationDate"],
      );
}

final class ComboConfigModel extends ComboConfig {
  ComboConfigModel({
    required super.salesGroupIds,
    required super.comboSizes,
    required super.comboConfigId,
  });

  factory ComboConfigModel.fromJson(Map<String, dynamic> json) =>
      ComboConfigModel(
        salesGroupIds:
            List<double>.from(json["salesGroupIds"].map((x) => x?.toDouble())),
        comboSizes: List<ComboSize>.from(
            json["comboSizes"].map((x) => ComboSizeModel.fromJson(x))),
        comboConfigId: json["comboConfigId"],
      );
}

final class ComboSizeModel extends ComboSize {
  ComboSizeModel({
    required super.comboGroups,
    required super.size,
    required super.baseImageName,
    required super.sizeType,
  });

  factory ComboSizeModel.fromJson(Map<String, dynamic> json) => ComboSizeModel(
        comboGroups: List<ComboGroup>.from(
            json["comboGroups"].map((x) => ComboGroupModel.fromJson(x))),
        size: shortDescriptionValues.map[json["size"]]!,
        baseImageName: json["baseImageName"],
        sizeType: shortDescriptionValues.map[json["sizeType"]]!,
      );
}

final class ComboGroupModel extends ComboGroup {
  ComboGroupModel({
    required super.salesItemId,
    required super.salesGroupIndex,
  });

  factory ComboGroupModel.fromJson(Map<String, dynamic> json) =>
      ComboGroupModel(
        salesItemId: json["salesItemId"],
        salesGroupIndex: json["salesGroupIndex"],
      );
}

final shortDescriptionValues = EnumValues({
  "Baconator®": ShortDescription.baconator,
  "Classic": ShortDescription.classic,
  "Crispy": ShortDescription.crispy,
  "Double": ShortDescription.double,
  "JUNIOR": ShortDescription.junior,
  "KM": ShortDescription.km,
  "LARGE": ShortDescription.large,
  "MEDIUM": ShortDescription.medium,
  "LARGE ": ShortDescription.shortDescriptionLarge,
  "MEDIUM ": ShortDescription.shortDescriptionMedium,
  "Single": ShortDescription.single,
  "SMALL": ShortDescription.small,
  "Son": ShortDescription.son,
  "Spicy": ShortDescription.spicy,
  "Triple": ShortDescription.triple,
  "VALUE": ShortDescription.value
});

final class DisclaimerModel extends Disclaimer {
  DisclaimerModel({
    required super.disclaimerCode,
    required super.disclaimerText,
  });

  factory DisclaimerModel.fromJson(Map<String, dynamic> json) =>
      DisclaimerModel(
        disclaimerCode: json["disclaimerCode"],
        disclaimerText: json["disclaimerText"],
      );
}

final class ItemModel extends Item {
  ItemModel({
    required super.productId,
    required super.url,
    required super.type,
    required super.image,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        productId: json["productId"],
        url: json["url"],
        type: json["type"],
        image: json["image"],
      );
}

final class MenuItemModel extends MenuItem {
  MenuItemModel({
    required super.name,
    required super.description,
    required super.displayName,
    required super.baseImageName,
    required super.menuItemId,
    required super.defaultItemId,
    required super.salesItemIds,
    required super.promoId,
    required super.price,
    required super.productGroupId,
    required super.comboMenuItemId,
    required super.titleTag,
    required super.metaDescription,
    required super.calorieRange,
    required super.priceRange,
    required super.selectionMode,
    required super.attributes,
    required super.selectionLabel,
    required super.salesGroups,
    required super.comboConfigId,
    required super.comboLabel,
  });

  factory MenuItemModel.fromJson(Map<String, dynamic> json) => MenuItemModel(
        name: json["name"],
        description: json["description"],
        displayName: json["displayName"],
        baseImageName: json["baseImageName"],
        menuItemId: json["menuItemId"],
        defaultItemId: json["defaultItemId"],
        salesItemIds: List<int>.from(json["salesItemIds"].map((x) => x)),
        promoId: json["promoId"],
        price: json["price"]?.toDouble(),
        productGroupId: json["productGroupId"],
        comboMenuItemId: json["comboMenuItemId"],
        titleTag: json["titleTag"],
        metaDescription: json["metaDescription"],
        calorieRange: json["calorieRange"],
        priceRange: json["priceRange"],
        selectionMode: selectionModeValues.map[json["selectionMode"]]!,
        attributes: AttributesModel.fromJson(json["attributes"]),
        selectionLabel: labelValues.map[json["selectionLabel"]]!,
        salesGroups: List<SalesGroup>.from(
            json["salesGroups"].map((x) => SalesGroupModel.fromJson(x))),
        comboConfigId: json["comboConfigId"],
        comboLabel: labelValues.map[json["comboLabel"]]!,
      );
}

final class AttributesModel extends Attributes {
  AttributesModel({
    required super.selectionLabel,
  });

  factory AttributesModel.fromJson(Map<String, dynamic> json) =>
      AttributesModel(
        selectionLabel: selectionLabelValues.map[json["selectionLabel"]]!,
      );
}

final selectionLabelValues = EnumValues({
  "dippingSauce": SelectionLabel.dippingSauce,
  "style": SelectionLabel.style
});

final labelValues = EnumValues({"MEAL": Label.meal, "STYLE": Label.style});

final class SalesGroupModel extends SalesGroup {
  SalesGroupModel({
    required super.name,
    required super.description,
    required super.displayName,
    required super.salesGroupId,
    required super.defaultSalesItemId,
    required super.salesItemIds,
    required super.minimumItems,
    required super.maximumItems,
    required super.salesGroupIds,
    required super.salesItemDetails,
    required super.calorieRange,
    required super.baseImageName,
  });

  factory SalesGroupModel.fromJson(Map<String, dynamic> json) =>
      SalesGroupModel(
        name: json["name"],
        description: json["description"],
        displayName: json["displayName"],
        salesGroupId: json["salesGroupId"]?.toDouble(),
        defaultSalesItemId: json["defaultSalesItemId"],
        salesItemIds: List<int>.from(json["salesItemIds"].map((x) => x)),
        minimumItems: json["minimumItems"],
        maximumItems: json["maximumItems"],
        salesGroupIds: List<int>.from(json["salesGroupIds"].map((x) => x)),
        salesItemDetails: List<SalesItemDetail>.from(json["salesItemDetails"]
            .map((x) => SalesItemDetailModel.fromJson(x))),
        calorieRange: json["calorieRange"],
        baseImageName: json["baseImageName"],
      );
}

final class SalesItemDetailModel extends SalesItemDetail {
  SalesItemDetailModel({
    required super.salesItemId,
    required super.priceIncrement,
  });

  factory SalesItemDetailModel.fromJson(Map<String, dynamic> json) =>
      SalesItemDetailModel(
        salesItemId: json["salesItemId"],
        priceIncrement: json["priceIncrement"]?.toDouble(),
      );
}

final selectionModeValues = EnumValues({
  "NONE": SelectionMode.none,
  "SIZE": SelectionMode.size,
  "STYLE": SelectionMode.style
});

final class MenuModel extends Menu {
  MenuModel({
    required super.name,
    required super.displayName,
    required super.menuId,
    required super.subMenus,
    required super.productGroupId,
    required super.breakfastSubMenuIds,
    required super.lunchSubMenuIds,
    required super.disclaimerCodes,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        name: json["name"],
        displayName: json["displayName"],
        menuId: json["menuId"],
        subMenus: List<int>.from(json["subMenus"].map((x) => x)),
        productGroupId: json["productGroupId"],
        breakfastSubMenuIds:
            List<int>.from(json["breakfastSubMenuIds"].map((x) => x)),
        lunchSubMenuIds: List<int>.from(json["lunchSubMenuIds"].map((x) => x)),
        disclaimerCodes:
            List<String>.from(json["disclaimerCodes"].map((x) => x)),
      );
}

final class ModifierActionModel extends ModifierAction {
  ModifierActionModel({
    required super.name,
    required super.displayName,
    required super.action,
    required super.shortName,
  });

  factory ModifierActionModel.fromJson(Map<String, dynamic> json) =>
      ModifierActionModel(
        name: json["name"],
        displayName: json["displayName"],
        action: json["action"],
        shortName: json["shortName"],
      );
}

final class ModifierGroupModel extends ModifierGroup {
  ModifierGroupModel({
    required super.name,
    required super.description,
    required super.displayName,
    required super.baseImageName,
    required super.modifierGroupId,
    required super.minimumItems,
    required super.maximumItems,
    required super.perOptionMinimum,
    required super.perOptionMaximum,
    required super.sourceModifierGroupId,
    required super.modifiers,
    required super.freeModifiers,
    required super.isPlain,
    required super.isBun,
    required super.isBase,
    required super.isMeat,
    required super.displayCode,
    required super.attributes,
    required super.componentGroupId,
  });

  factory ModifierGroupModel.fromJson(Map<String, dynamic> json) =>
      ModifierGroupModel(
        name: json["name"],
        description: json["description"],
        displayName: json["displayName"],
        baseImageName: json["baseImageName"],
        modifierGroupId: json["modifierGroupId"],
        minimumItems: json["minimumItems"],
        maximumItems: json["maximumItems"],
        perOptionMinimum: json["perOptionMinimum"],
        perOptionMaximum: json["perOptionMaximum"],
        sourceModifierGroupId: json["sourceModifierGroupId"],
        modifiers: List<int>.from(json["modifiers"].map((x) => x)),
        freeModifiers: json["freeModifiers"],
        isPlain: json["isPlain"],
        isBun: json["isBun"],
        isBase: json["isBase"],
        isMeat: json["isMeat"],
        displayCode: displayCodeValues.map[json["displayCode"]]!,
        attributes: AttributesModel.fromJson(json["attributes"]),
        componentGroupId: json["componentGroupId"],
      );
}

final displayCodeValues = EnumValues({
  "CUSTOMIZATION": DisplayCode.customization,
  "SELECTION": DisplayCode.selection
});

final class ModifierModel extends Modifier {
  ModifierModel({
    required super.name,
    required super.description,
    required super.displayName,
    required super.modifierId,
    required super.itemModifiers,
    required super.componentId,
    required super.styleCode,
    required super.isSplittable,
    required super.masterSequence,
    required super.weight,
    required super.posItemId,
  });

  factory ModifierModel.fromJson(Map<String, dynamic> json) => ModifierModel(
        name: json["name"],
        description: json["description"],
        displayName: json["displayName"],
        modifierId: json["modifierId"],
        itemModifiers: List<ItemModifier>.from(
            json["itemModifiers"].map((x) => ItemModifierModel.fromJson(x))),
        componentId: json["componentId"],
        styleCode: styleCodeEnumValues.map[json["styleCode"]]!,
        isSplittable: json["isSplittable"],
        masterSequence: json["masterSequence"],
        weight: json["weight"]?.toDouble(),
        posItemId: json["POSItemId"],
      );
}

final class ItemModifierModel extends ItemModifier {
  ItemModifierModel({
    required super.salesItemModifierId,
    required super.modifierGroupId,
    required super.price,
    required super.modifierAction,
  });

  factory ItemModifierModel.fromJson(Map<String, dynamic> json) =>
      ItemModifierModel(
        salesItemModifierId: json["salesItemModifierId"],
        modifierGroupId: json["modifierGroupId"],
        price: json["price"]?.toDouble(),
        modifierAction: json["modifierAction"],
      );
}

final styleCodeEnumValues = EnumValues({
  "ADD_REM": StyleCodeEnum.addRem,
  "AMOUNT": StyleCodeEnum.amount,
  "QUANTITY": StyleCodeEnum.quantity,
  "REQUIRED": StyleCodeEnum.required
});

final class SalesItemModel extends SalesItem {
  SalesItemModel({
    required super.name,
    required super.description,
    required super.displayName,
    required super.salesItemId,
    required super.categoryName,
    required super.price,
    required super.modifierGroups,
    required super.defaultOptions,
    required super.shortDescription,
    required super.isLto,
    required super.productId,
    required super.nutrition,
    required super.alaCarteMenuItemId,
    required super.calorieRange,
    required super.isFreestyle,
    required super.posItemId,
    required super.promoId,
    required super.nwsgProductGroupId,
    required super.originalPosItemId,
  });

  factory SalesItemModel.fromJson(Map<String, dynamic> json) => SalesItemModel(
        name: json["name"],
        description: json["description"],
        displayName: json["displayName"],
        salesItemId: json["salesItemId"],
        categoryName: json["categoryName"],
        price: json["price"]?.toDouble(),
        modifierGroups: List<int>.from(json["modifierGroups"].map((x) => x)),
        defaultOptions: List<DefaultOption>.from(
            json["defaultOptions"].map((x) => DefaultOptionModel.fromJson(x))),
        shortDescription: shortDescriptionValues.map[json["shortDescription"]]!,
        isLto: json["isLTO"],
        productId: json["productId"],
        nutrition: NutritionModel.fromJson(json["nutrition"]),
        alaCarteMenuItemId: json["alaCarteMenuItemId"],
        calorieRange: json["calorieRange"],
        isFreestyle: json["isFreestyle"],
        posItemId: json["POSItemId"],
        promoId: json["promoId"],
        nwsgProductGroupId: json["nwsgProductGroupId"],
        originalPosItemId: json["originalPosItemId"],
      );
}

final class DefaultOptionModel extends DefaultOption {
  DefaultOptionModel({
    required super.modifierGroupId,
    required super.modifierId,
    required super.defaultQuantity,
    required super.defaultReason,
    required super.modifierAction,
  });

  factory DefaultOptionModel.fromJson(Map<String, dynamic> json) =>
      DefaultOptionModel(
        modifierGroupId: json["modifierGroupId"],
        modifierId: json["modifierId"],
        defaultQuantity: json["defaultQuantity"],
        defaultReason: json["defaultReason"],
        modifierAction: json["modifierAction"],
      );
}

final class NutritionModel extends Nutrition {
  NutritionModel({
    required super.calorieRange,
    required super.servingSize,
    required super.calories,
    required super.caloriesFromFat,
    required super.totalFat,
    required super.saturated,
    required super.transFattyAcids,
    required super.cholesterol,
    required super.sodium,
    required super.carbohydrates,
    required super.dietaryFiber,
    required super.sugars,
    required super.protein,
    required super.vitaminA,
    required super.vitaminC,
    required super.vitaminD,
    required super.calcium,
    required super.iron,
    required super.monounsaturated,
    required super.polyunsaturated,
    required super.potassium,
    required super.hasEgg,
    required super.hasFish,
    required super.hasMilk,
    required super.hasSoy,
    required super.hasTreenut,
    required super.hasPeanut,
    required super.hasWheat,
    required super.hasShellfish,
    required super.hasSesame,
  });

  factory NutritionModel.fromJson(Map<String, dynamic> json) => NutritionModel(
        calorieRange: json["calorieRange"],
        servingSize: json["servingSize"],
        calories: json["calories"],
        caloriesFromFat: json["caloriesFromFat"],
        totalFat: json["totalFat"]?.toDouble(),
        saturated: json["saturated"]?.toDouble(),
        transFattyAcids: json["transFattyAcids"]?.toDouble(),
        cholesterol: json["cholesterol"]?.toDouble(),
        sodium: json["sodium"]?.toDouble(),
        carbohydrates: json["carbohydrates"]?.toDouble(),
        dietaryFiber: json["dietaryFiber"]?.toDouble(),
        sugars: json["sugars"]?.toDouble(),
        protein: json["protein"]?.toDouble(),
        vitaminA: json["vitaminA"],
        vitaminC: json["vitaminC"],
        vitaminD: json["vitaminD"],
        calcium: json["calcium"],
        iron: json["iron"],
        monounsaturated: json["monounsaturated"]?.toDouble(),
        polyunsaturated: json["polyunsaturated"]?.toDouble(),
        potassium: json["potassium"],
        hasEgg: json["hasEgg"],
        hasFish: json["hasFish"],
        hasMilk: json["hasMilk"],
        hasSoy: json["hasSoy"],
        hasTreenut: json["hasTreenut"],
        hasPeanut: json["hasPeanut"],
        hasWheat: json["hasWheat"],
        hasShellfish: json["hasShellfish"],
        hasSesame: json["hasSesame"],
      );
}

final class StyleCodeElementModel extends StyleCodeElement {
  StyleCodeElementModel({
    required super.styleCode,
    required super.modifierActionIds,
  });

  factory StyleCodeElementModel.fromJson(Map<String, dynamic> json) =>
      StyleCodeElementModel(
        styleCode: styleCodeEnumValues.map[json["styleCode"]]!,
        modifierActionIds:
            List<int>.from(json["modifierActionIds"].map((x) => x)),
      );
}

final class SubMenuModel extends SubMenu {
  SubMenuModel({
    required super.name,
    required super.description,
    required super.displayName,
    required super.baseImageName,
    required super.subMenuId,
    required super.menuItems,
    required super.productGroupId,
    required super.titleTag,
    required super.metaDescription,
    required super.disclaimerCode,
  });

  factory SubMenuModel.fromJson(Map<String, dynamic> json) => SubMenuModel(
        name: json["name"],
        description: json["description"],
        displayName: json["displayName"],
        baseImageName: json["baseImageName"],
        subMenuId: json["subMenuId"],
        menuItems: List<int>.from(json["menuItems"].map((x) => x)),
        productGroupId: json["productGroupId"],
        titleTag: json["titleTag"],
        metaDescription: json["metaDescription"],
        disclaimerCode: json["disclaimerCode"],
      );
}
