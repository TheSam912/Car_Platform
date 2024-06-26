String priceFormatter(price) {
  if (price.length == 5) {
    price = "${price.substring(0, 2)},${price.substring(2, 5)} €";
  } else if (price.length == 6) {
    price = "${price.substring(0, 3)},${price.substring(3, 6)} €";
  } else if (price.length == 7) {
    price =
        "${price.substring(0, 1)},${price.substring(1, 4)},${price.substring(4, 7)} €";
  } else if (price.length == 8) {
    price =
        "${price.substring(0, 2)},${price.substring(2, 5)},${price.substring(5, 8)} €";
  } else {
    price = "Invalid price!";
  }
  return price;
}
