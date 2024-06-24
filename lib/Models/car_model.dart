class CarModel {
  int id;
  String name;
  String description;
  String bodyType;
  String condition;
  String brand;
  String location;
  String price;
  String registration;
  String mileage;
  String fuelType;
  String transmission;
  List<String> images;

  CarModel(
      this.id,
      this.name,
      this.description,
      this.bodyType,
      this.condition,
      this.brand,
      this.location,
      this.price,
      this.registration,
      this.mileage,
      this.fuelType,
      this.transmission,
      this.images);
}
