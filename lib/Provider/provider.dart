import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexBottomNavbarProvider = StateProvider<int>((ref) {
  return 0;
});

final selectedBodyTypeProvider = StateProvider<String>(
  (ref) => "Coupe",
);
final selectedCarBrandProvider = StateProvider<String>(
  (ref) => "Abarth",
);

final listCarCompanyProvider = StateProvider<List<String>>(
  (ref) {
    return ["BMW", "Audi", "Mercedes-Benz", "Lamborghini", "Bugatti"];
  },
);

final selectedRegistrationDateProvider = StateProvider<String>(
  (ref) => "2024",
);
final selectedMileageProvider = StateProvider<String>(
  (ref) => "10.000",
);
final selectedTransmissionProvider = StateProvider(
  (ref) => "Automatic",
);
final selectedFuelTypeProvider = StateProvider(
  (ref) => "Diesel",
);
final listCarOptionsProvider = StateProvider<List<String>>(
  (ref) {
    return [];
  },
);
