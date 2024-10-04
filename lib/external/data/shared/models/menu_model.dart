import 'package:navalia_code_challenge/core/constants/urls.dart';
import 'package:navalia_code_challenge/core/utils/enum_utils.dart';
import 'package:navalia_code_challenge/core/utils/formatters.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';

final class MenuEntityModel extends MenuEntity {
  MenuEntityModel({
    super.serviceStatus,
    super.menuLists,
  });

  factory MenuEntityModel.fromJson(Map<String, dynamic> json) =>
      MenuEntityModel(
        serviceStatus: Formatters.stringOrEmpty(json["serviceStatus"]),
        menuLists: MenuListsModel.fromJson(json["menuLists"] ?? {}),
      );
}

final class MenuListsModel extends MenuLists {
  MenuListsModel({
    super.featuredItems,
    super.menuPromoItem,
    super.orderModes,
    super.menus,
    super.subMenus,
    super.menuItems,
    super.salesGroups,
    super.salesItems,
    super.modifierGroups,
    super.modifiers,
    super.modifierActions,
    super.styleCodes,
    super.disclaimers,
    super.comboConfig,
    super.cacheExpirationDate,
  });

  factory MenuListsModel.fromJson(Map<String, dynamic> json) => MenuListsModel(
        featuredItems: List<Item>.from(
            (json["featuredItems"] ?? []).map((x) => ItemModel.fromJson(x))),
        menuPromoItem: ItemModel.fromJson(json["menuPromoItem"] ?? {}),
        orderModes: [],
        menus: List<Menu>.from(
            (json["menus"] ?? []).map((x) => MenuModel.fromJson(x))),
        subMenus: List<SubMenu>.from(
            (json["subMenus"] ?? []).map((x) => SubMenuModel.fromJson(x))),
        menuItems: List<MenuItem>.from(
            (json["menuItems"] ?? []).map((x) => MenuItemModel.fromJson(x))),
        salesGroups: List<SalesGroup>.from((json["salesGroups"] ?? [])
            .map((x) => SalesGroupModel.fromJson(x))),
        salesItems: List<SalesItem>.from(
            (json["salesItems"] ?? []).map((x) => SalesItemModel.fromJson(x))),
        modifierGroups: List<ModifierGroup>.from((json["modifierGroups"] ?? [])
            .map((x) => ModifierGroupModel.fromJson(x))),
        modifiers: List<Modifier>.from(
            (json["modifiers"] ?? []).map((x) => ModifierModel.fromJson(x))),
        modifierActions: List<ModifierAction>.from(
            (json["modifierActions"] ?? [])
                .map((x) => ModifierActionModel.fromJson(x))),
        styleCodes: List<StyleCodeElement>.from((json["styleCodes"] ?? [])
            .map((x) => StyleCodeElementModel.fromJson(x))),
        disclaimers: List<Disclaimer>.from((json["disclaimers"] ?? [])
            .map((x) => DisclaimerModel.fromJson(x))),
        comboConfig: List<ComboConfig>.from((json["comboConfig"] ?? [])
            .map((x) => ComboConfigModel.fromJson(x))),
        cacheExpirationDate: json["cacheExpirationDate"],
      );
}

final class ComboConfigModel extends ComboConfig {
  ComboConfigModel({
    super.salesGroupIds,
    super.comboSizes,
    super.comboConfigId,
  });

  factory ComboConfigModel.fromJson(Map<String, dynamic> json) =>
      ComboConfigModel(
        salesGroupIds: List<double>.from(
            (json["salesGroupIds"] ?? []).map((x) => x?.toDouble())),
        comboSizes: List<ComboSize>.from(
            (json["comboSizes"] ?? []).map((x) => ComboSizeModel.fromJson(x))),
        comboConfigId: json["comboConfigId"],
      );
}

final class ComboSizeModel extends ComboSize {
  ComboSizeModel({
    super.comboGroups,
    super.size,
    super.baseImageName,
    super.sizeType,
  });

  factory ComboSizeModel.fromJson(Map<String, dynamic> json) => ComboSizeModel(
        comboGroups: List<ComboGroup>.from((json["comboGroups"] ?? [])
            .map((x) => ComboGroupModel.fromJson(x))),
        size: shortDescriptionValues.map[json["size"]],
        baseImageName: json["baseImageName"],
        sizeType: shortDescriptionValues.map[json["sizeType"]],
      );
}

final class ComboGroupModel extends ComboGroup {
  ComboGroupModel({
    super.salesItemId,
    super.salesGroupIndex,
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
    super.disclaimerCode,
    super.disclaimerText,
  });

  factory DisclaimerModel.fromJson(Map<String, dynamic> json) =>
      DisclaimerModel(
        disclaimerCode: json["disclaimerCode"],
        disclaimerText: json["disclaimerText"],
      );
}

final class ItemModel extends Item {
  ItemModel({
    super.productId,
    super.url,
    super.type,
    super.image,
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
    super.name,
    super.description,
    super.displayName,
    super.imageUrl,
    super.baseImageName,
    super.menuItemId,
    super.defaultItemId,
    super.salesItemIds,
    super.promoId,
    super.price,
    super.productGroupId,
    super.comboMenuItemId,
    super.titleTag,
    super.metaDescription,
    super.calorieRange,
    super.priceRange,
    super.selectionMode,
    super.attributes,
    super.selectionLabel,
    super.salesGroups,
    super.comboConfigId,
    super.comboLabel,
  });

  factory MenuItemModel.fromJson(Map<String, dynamic> json) => MenuItemModel(
        name: Formatters.stringOrEmpty(json["name"]),
        description: Formatters.stringOrEmpty(json["description"]),
        displayName: Formatters.stringOrEmpty(json["displayName"]),
        imageUrl: json["baseImageName"] != null
            ? "${Urls.imageBaseUrl}unified/assets/menu/pg-cropped/${json["baseImageName"]}_small_US_en.png"
            : null,
        baseImageName: Formatters.stringOrEmpty(json["baseImageName"]),
        menuItemId: Formatters.intOrNegativeOne(json["menuItemId"]),
        defaultItemId: Formatters.intOrNegativeOne(json["defaultItemId"]),
        salesItemIds:
            List<int>.from((json["salesItemIds"] ?? []).map((x) => x)),
        promoId: json["promoId"],
        price: json["price"]?.toDouble(),
        productGroupId: json["productGroupId"],
        comboMenuItemId: json["comboMenuItemId"],
        titleTag: json["titleTag"],
        metaDescription: json["metaDescription"],
        calorieRange: json["calorieRange"],
        priceRange: json["priceRange"],
        selectionMode: selectionModeValues.map[json["selectionMode"]],
        attributes: AttributesModel.fromJson(json["attributes"] ?? {}),
        selectionLabel: labelValues.map[json["selectionLabel"]],
        salesGroups: List<SalesGroup>.from((json["salesGroups"] ?? [])
            .map((x) => SalesGroupModel.fromJson(x))),
        comboConfigId: json["comboConfigId"],
        comboLabel: labelValues.map[json["comboLabel"]],
      );
}

final class AttributesModel extends Attributes {
  AttributesModel({
    super.selectionLabel,
  });

  factory AttributesModel.fromJson(Map<String, dynamic> json) =>
      AttributesModel(
        selectionLabel: selectionLabelValues.map[json["selectionLabel"]],
      );
}

final selectionLabelValues = EnumValues({
  "dippingSauce": SelectionLabel.dippingSauce,
  "style": SelectionLabel.style
});

final labelValues = EnumValues({"MEAL": Label.meal, "STYLE": Label.style});

final class SalesGroupModel extends SalesGroup {
  SalesGroupModel({
    super.name,
    super.description,
    super.displayName,
    super.salesGroupId,
    super.defaultSalesItemId,
    super.salesItemIds,
    super.minimumItems,
    super.maximumItems,
    super.salesGroupIds,
    super.salesItemDetails,
    super.calorieRange,
    super.baseImageName,
  });

  factory SalesGroupModel.fromJson(Map<String, dynamic> json) =>
      SalesGroupModel(
        name: json["name"],
        description: json["description"],
        displayName: json["displayName"],
        salesGroupId: json["salesGroupId"]?.toDouble(),
        defaultSalesItemId: json["defaultSalesItemId"],
        salesItemIds:
            List<int>.from((json["salesItemIds"] ?? []).map((x) => x)),
        minimumItems: json["minimumItems"],
        maximumItems: json["maximumItems"],
        salesGroupIds:
            List<int>.from((json["salesGroupIds"] ?? []).map((x) => x)),
        salesItemDetails: List<SalesItemDetail>.from(
            (json["salesItemDetails"] ?? [])
                .map((x) => SalesItemDetailModel.fromJson(x))),
        calorieRange: json["calorieRange"],
        baseImageName: json["baseImageName"],
      );
}

final class SalesItemDetailModel extends SalesItemDetail {
  SalesItemDetailModel({
    super.salesItemId,
    super.priceIncrement,
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
    super.name,
    super.displayName,
    super.menuId,
    super.subMenus,
    super.productGroupId,
    super.breakfastSubMenuIds,
    super.lunchSubMenuIds,
    super.disclaimerCodes,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        name: Formatters.stringOrEmpty(json["name"]),
        displayName: Formatters.stringOrEmpty(json["displayName"]),
        menuId: Formatters.intOrNegativeOne(json["menuId"]),
        subMenus: List<int>.from((json["subMenus"] ?? []).map((x) => x)),
        productGroupId: Formatters.stringOrEmpty(json["productGroupId"]),
        breakfastSubMenuIds:
            List<int>.from((json["breakfastSubMenuIds"] ?? []).map((x) => x)),
        lunchSubMenuIds:
            List<int>.from((json["lunchSubMenuIds"] ?? []).map((x) => x)),
        disclaimerCodes:
            List<String>.from((json["disclaimerCodes"] ?? []).map((x) => x)),
      );
}

final class ModifierActionModel extends ModifierAction {
  ModifierActionModel({
    super.name,
    super.displayName,
    super.action,
    super.shortName,
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
    super.name,
    super.description,
    super.displayName,
    super.baseImageName,
    super.modifierGroupId,
    super.minimumItems,
    super.maximumItems,
    super.perOptionMinimum,
    super.perOptionMaximum,
    super.sourceModifierGroupId,
    super.modifiers,
    super.freeModifiers,
    super.isPlain,
    super.isBun,
    super.isBase,
    super.isMeat,
    super.displayCode,
    super.attributes,
    super.componentGroupId,
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
        modifiers: List<int>.from((json["modifiers"] ?? []).map((x) => x)),
        freeModifiers: json["freeModifiers"],
        isPlain: json["isPlain"],
        isBun: json["isBun"],
        isBase: json["isBase"],
        isMeat: json["isMeat"],
        displayCode: displayCodeValues.map[json["displayCode"]],
        attributes: AttributesModel.fromJson(json["attributes"] ?? {}),
        componentGroupId: json["componentGroupId"],
      );
}

final displayCodeValues = EnumValues({
  "CUSTOMIZATION": DisplayCode.customization,
  "SELECTION": DisplayCode.selection
});

final class ModifierModel extends Modifier {
  ModifierModel({
    super.name,
    super.description,
    super.displayName,
    super.modifierId,
    super.itemModifiers,
    super.componentId,
    super.styleCode,
    super.isSplittable,
    super.masterSequence,
    super.weight,
    super.posItemId,
  });

  factory ModifierModel.fromJson(Map<String, dynamic> json) => ModifierModel(
        name: json["name"],
        description: json["description"],
        displayName: json["displayName"],
        modifierId: json["modifierId"],
        itemModifiers: List<ItemModifier>.from((json["itemModifiers"] ?? [])
            .map((x) => ItemModifierModel.fromJson(x))),
        componentId: json["componentId"],
        styleCode: styleCodeEnumValues.map[json["styleCode"]],
        isSplittable: json["isSplittable"],
        masterSequence: json["masterSequence"],
        weight: json["weight"]?.toDouble(),
        posItemId: json["POSItemId"],
      );
}

final class ItemModifierModel extends ItemModifier {
  ItemModifierModel({
    super.salesItemModifierId,
    super.modifierGroupId,
    super.price,
    super.modifierAction,
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
    super.name,
    super.description,
    super.displayName,
    super.salesItemId,
    super.categoryName,
    super.price,
    super.modifierGroups,
    super.defaultOptions,
    super.shortDescription,
    super.isLto,
    super.productId,
    super.nutrition,
    super.alaCarteMenuItemId,
    super.calorieRange,
    super.isFreestyle,
    super.posItemId,
    super.promoId,
    super.nwsgProductGroupId,
    super.originalPosItemId,
  });

  factory SalesItemModel.fromJson(Map<String, dynamic> json) => SalesItemModel(
        name: json["name"],
        description: json["description"],
        displayName: json["displayName"],
        salesItemId: json["salesItemId"],
        categoryName: json["categoryName"],
        price: json["price"]?.toDouble(),
        modifierGroups:
            List<int>.from((json["modifierGroups"] ?? []).map((x) => x)),
        defaultOptions: List<DefaultOption>.from((json["defaultOptions"] ?? [])
            .map((x) => DefaultOptionModel.fromJson(x))),
        shortDescription: shortDescriptionValues.map[json["shortDescription"]],
        isLto: json["isLTO"],
        productId: json["productId"],
        nutrition: NutritionModel.fromJson(json["nutrition"] ?? {}),
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
    super.modifierGroupId,
    super.modifierId,
    super.defaultQuantity,
    super.defaultReason,
    super.modifierAction,
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
    super.calorieRange,
    super.servingSize,
    super.calories,
    super.caloriesFromFat,
    super.totalFat,
    super.saturated,
    super.transFattyAcids,
    super.cholesterol,
    super.sodium,
    super.carbohydrates,
    super.dietaryFiber,
    super.sugars,
    super.protein,
    super.vitaminA,
    super.vitaminC,
    super.vitaminD,
    super.calcium,
    super.iron,
    super.monounsaturated,
    super.polyunsaturated,
    super.potassium,
    super.hasEgg,
    super.hasFish,
    super.hasMilk,
    super.hasSoy,
    super.hasTreenut,
    super.hasPeanut,
    super.hasWheat,
    super.hasShellfish,
    super.hasSesame,
  });

  factory NutritionModel.fromJson(Map<String, dynamic> json) => NutritionModel(
        calorieRange: json["calorieRange"],
        servingSize: Formatters.intOrNegativeOne(json["servingSize"]),
        calories: Formatters.intOrNegativeOne(json["calories"]),
        caloriesFromFat: Formatters.intOrNegativeOne(json["caloriesFromFat"]),
        totalFat: json["totalFat"]?.toDouble(),
        saturated: json["saturated"]?.toDouble(),
        transFattyAcids: json["transFattyAcids"]?.toDouble(),
        cholesterol: json["cholesterol"]?.toDouble(),
        sodium: json["sodium"]?.toDouble(),
        carbohydrates: json["carbohydrates"]?.toDouble(),
        dietaryFiber: json["dietaryFiber"]?.toDouble(),
        sugars: json["sugars"]?.toDouble(),
        protein: json["protein"]?.toDouble(),
        vitaminA: json["vitaminA"]?.toInt(),
        vitaminC: json["vitaminC"]?.toInt(),
        vitaminD: json["vitaminD"]?.toInt(),
        calcium: json["calcium"]?.toInt(),
        iron: json["iron"]?.toInt(),
        monounsaturated: json["monounsaturated"]?.toDouble(),
        polyunsaturated: json["polyunsaturated"]?.toDouble(),
        potassium: json["potassium"]?.toInt(),
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
    super.styleCode,
    super.modifierActionIds,
  });

  factory StyleCodeElementModel.fromJson(Map<String, dynamic> json) =>
      StyleCodeElementModel(
        styleCode: styleCodeEnumValues.map[json["styleCode"]],
        modifierActionIds:
            List<int>.from((json["modifierActionIds"] ?? []).map((x) => x)),
      );
}

final class SubMenuModel extends SubMenu {
  SubMenuModel({
    super.name,
    super.description,
    super.displayName,
    super.imageUrl,
    super.baseImageName,
    super.subMenuId,
    super.menuItems,
    super.productGroupId,
    super.titleTag,
    super.metaDescription,
    super.disclaimerCode,
  });

  factory SubMenuModel.fromJson(Map<String, dynamic> json) => SubMenuModel(
        name: json["name"],
        description: json["description"],
        displayName: json["displayName"],
        imageUrl: json["baseImageName"] != null
            ? "${Urls.imageBaseUrl}/unified/assets/menu/productGroups/${json["baseImageName"]}_medium_US_en.png"
            : null,
        baseImageName: json["baseImageName"],
        subMenuId: json["subMenuId"],
        menuItems: List<int>.from((json["menuItems"] ?? []).map((x) => x)),
        productGroupId: Formatters.stringOrEmpty(json["productGroupId"]),
        titleTag: Formatters.stringOrEmpty(json["titleTag"]),
        metaDescription: Formatters.stringOrEmpty(json["metaDescription"]),
        disclaimerCode: Formatters.stringOrEmpty(json["disclaimerCode"]),
      );
}
