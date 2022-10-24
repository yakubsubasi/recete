import 'package:flutter/cupertino.dart';
import 'package:recete/model/disease_model.dart';

class ListPageController with ChangeNotifier {
  bool _isSearching = false;
  bool _isLoading = true;
  List<Disease> _allResutls = [];
  List<Disease> _searchedResults = [];

  List<Disease> get allResutls => _allResutls;
  List<Disease> get searchedResults => _searchedResults;
  bool get isSearching => _isSearching;
  bool get isLoading => _isLoading;

  search(String query) {
    _searchedResults = _allResutls
        .where((disease) =>
            disease.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  set isSearching(bool value) {
    _isSearching = value;
    notifyListeners();
  }

  void getDiseases() async {
    var diseases = await diseaseRef.get();
    _allResutls = diseases.docs.map((e) => e.data).toList();
    _searchedResults = _allResutls;
    _isLoading = false;
    notifyListeners();
  }
}
