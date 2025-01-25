import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/provider.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:provider/provider.dart';

import '../../../objetos/routine.dart';

class SearchableDropdown extends StatefulWidget {
  final List<Routine> items;
  final String hintText;
  final ValueChanged<String> onItemSelected;

  const SearchableDropdown({
    super.key,
    required this.items,
    required this.hintText,
    required this.onItemSelected,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SearchableDropdownState createState() => _SearchableDropdownState();
}

class _SearchableDropdownState extends State<SearchableDropdown> {
  List<Routine> _filteredItems = [];
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;

    // Listener para filtrar elementos a medida que el usuario escribe.
    context.read<ProviderService>().searchController.addListener(() {
      _filterItems(context.read<ProviderService>().searchController.text);
    });
  }

  void _filterItems(String query) {
    setState(() {
      _filteredItems = widget.items
          .where((item) =>
              item.nameRoutine.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _onItemTapped(String item) {
    context.read<ProviderService>().searchController.text = item;
    setState(() {
      _isDropdownOpen = false;
    });
    widget.onItemSelected(item);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: context.read<ProviderService>().searchController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.white),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isDropdownOpen = !_isDropdownOpen;
                });
              },
              child: Icon(
                _isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              ),
            ),
          ),
        ),
        if (_isDropdownOpen)
          Container(
            height: SizeConfig.screenHeight * 0.25,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            child: _filteredItems.isEmpty
                ? const Center(child: Text('No hay rutinas'))
                : ListView.builder(
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = _filteredItems[index];
                      return ListTile(
                        title: Text(item.nameRoutine),
                        textColor: Colors.white,
                        onTap: () => _onItemTapped(item.nameRoutine),
                      );
                    },
                  ),
          ),
      ],
    );
  }
}
