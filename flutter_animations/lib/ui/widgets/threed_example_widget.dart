import 'package:flutter/material.dart';

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({super.key});

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  var _data = [1, 2, 3, 4];
  void _insert() {
    final element = (_data.isEmpty ? 0 : _data.last) + 1;
    setState(() {
      _data.add(element);
    });
  }

  void _removeAtIndex(int index) {
    setState(() {
      _data.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _insert,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _removeAtIndex(index),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${_data[index]}'),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
