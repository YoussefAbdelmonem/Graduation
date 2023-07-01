import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues _priceRange = RangeValues(0, 500);
  List<String> _brands = ['Brand A', 'Brand B', 'Brand C', 'Brand D', 'Brand E', 'Brand F', 'Brand G', 'Brand H', 'Brand I'];
  List<String> _selectedBrands = [];

  void _applyFilter() {
    //TODO: Apply filter to the products
  }

  void _resetFilter() {
    setState(() {
      _priceRange = RangeValues(0, 250);
      _selectedBrands = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Filter',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Make filter',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RangeSlider(
                values: _priceRange,
                min: 0,
                max: 500,
                divisions: 10,
                labels: RangeLabels(
                  '\$${_priceRange.start.toStringAsFixed(0)}',
                  '\$${_priceRange.end.toStringAsFixed(0)}',
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _priceRange = values;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0,
                children: _brands.map((brand) {
                  return FilterChip(
                    label: Text(brand),
                    selected: _selectedBrands.contains(brand),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          _selectedBrands.add(brand);
                        } else {
                          _selectedBrands.remove(brand);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _applyFilter,
                    child: Text('Apply Filter'),
                  ),
                  ElevatedButton(
                    onPressed: _resetFilter,
                    child: Text('Reset'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}