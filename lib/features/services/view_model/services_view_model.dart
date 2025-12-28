import 'package:coreafrique/core/data//services_data.dart';
import 'package:coreafrique/core/data/models/service.dart' show Service;
import 'package:flutter/material.dart';

/// ViewModel for Services page - manages services data and hover states
class ServicesViewModel extends ChangeNotifier {
  final List<Service> allServices = servicesData;
  final Map<String, bool> _hoverStates = {};
  String? _selectedCategory;

  String? get selectedCategory => _selectedCategory;

  List<Service> get filteredServices {
    if (_selectedCategory == null) {
      return allServices;
    }
    return allServices.where((s) => s.category == _selectedCategory).toList();
  }

  List<String> get categories {
    return allServices.map((s) => s.category).toSet().toList();
  }

  bool isHovered(String serviceId) {
    return _hoverStates[serviceId] ?? false;
  }

  void setHovered(String serviceId, bool isHovered) {
    _hoverStates[serviceId] = isHovered;
    notifyListeners();
  }

  void setCategory(String? category) {
    _selectedCategory = category;
    notifyListeners();
  }

  @override
  void dispose() {
    _hoverStates.clear();
    super.dispose();
  }
}
