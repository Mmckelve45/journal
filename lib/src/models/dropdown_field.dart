// import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';

class DropDownField extends StatefulWidget {
  // const DropDownField({Key? key}) : super(key: key);

  final String? Function(dynamic) validate;
  final void Function(dynamic) onSaved;

  DropDownField({Key? key, required this.validate, required this.onSaved})
      : super(key: key);

  @override
  _DropDownFieldState createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  var ratings = [1, 2, 3, 4];
  int? currRating;
  // String? _rating;
  // String? _ratingResult;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      value: currRating,
      items: buildMenuItem(),
      onChanged: (item) {
        setState(() {
          currRating = item;
        });
      },
      decoration: 
        InputDecoration(
          labelText: 'Rating', 
          border:OutlineInputBorder()
        ),
      validator: widget.validate,
      onSaved: widget.onSaved
    );
  }

  List<DropdownMenuItem<int>> buildMenuItem() {
    return List<DropdownMenuItem<int>>.generate(4, (index) =>
     DropdownMenuItem(
       child: Text('${index+1}'),
       value: (index+1)
      )
    );
  }
}
