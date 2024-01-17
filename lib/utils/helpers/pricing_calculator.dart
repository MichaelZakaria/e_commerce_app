class MyPriceCalculator {

  // calculate price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  // calculate shipping cost
  static String calculateShippingCost (double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2) ;
  }

  // calculate tax
  static String calculateTax (double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2) ;
  }

  static double getTaxRateForLocation (String location) {
    // get tax rate for a given location from a tax rate database or API
    // return the appropriate tax rate
    return 0.10;
  }

  static double getShippingCost(String location) {
    // get shipping costs for a given location using a shipping rate API
    // calculate the shipping cost based on various factors like distance,weight, etc
    return 5;
  }

  // sum all cart values and return total amount

}