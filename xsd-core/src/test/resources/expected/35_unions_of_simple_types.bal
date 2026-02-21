import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Name record {|
    SimpleType|SimpleType1 \#content?;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type StringLength1to32 string;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type MealServiceType SimpleType|SimpleType1;

@xmldata:Namespace {uri: "http://namespace.org/"}
public enum SimpleType {
    Breakfast, Snack, Dinner, hot_meal = "Hot Meal", Lunch, Refreshments, complimentary_liquor = "Complimentary Liquor", Meal, liquor_for_purchase = "Liquor for Purchase", food_for_purchase = "Food for Purchase", cold_meal = "Cold Meal", no_meal_service = "No Meal Service"
};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SimpleType1 StringLength1to32;
