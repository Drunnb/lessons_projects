import 'dart:io';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:stb_v1/models/bird_post_model.dart';

class AddBirdScreen extends StatefulWidget {
  final LatLng latLng;
  final File image;
  AddBirdScreen({required this.latLng, required this.image});

  @override
  State<AddBirdScreen> createState() => _AddBirdScreenState();
}

class _AddBirdScreenState extends State<AddBirdScreen> {
  final _formKey = GlobalKey<FormState>();
  late FocusNode _descriptionFocusNode;
  String? name;
  String? description;

  void _submit(BirdModel birdModel, BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _descriptionFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Bird'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 1.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: FileImage(widget.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Enter a bird name'),
                  textInputAction: TextInputAction.next,
                  onSaved: (value) {
                    name = value?.trim();
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return "Please enter a name...";
                    }
                    if (value.length < 2) {
                      return 'Please enter a longer name...';
                    }
                    return null;
                  }),
                ),
                TextFormField(
                  focusNode: _descriptionFocusNode,
                  decoration: const InputDecoration(
                      hintText: 'Enter a bird description'),
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: ((_) {
                    final BirdModel birdModel = BirdModel(
                        birdName: name,
                        latitude: widget.latLng.latitude,
                        longitude: widget.latLng.longitude,
                        birdDescriprion: description,
                        image: widget.image);
                  }),
                  onSaved: (value) {
                    name = description?.trim();
                  },
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return "Please enter a description...";
                    }
                    if (value.length < 2) {
                      return 'Please enter a longer description...';
                    }
                    return null;
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final BirdModel birdModel = BirdModel(
              birdName: name,
              latitude: widget.latLng.latitude,
              longitude: widget.latLng.longitude,
              birdDescriprion: description,
              image: widget.image);
          _submit(birdModel, context);
        },
        child: const Icon(
          Icons.check,
          size: 30,
        ),
      ),
    );
  }
}
