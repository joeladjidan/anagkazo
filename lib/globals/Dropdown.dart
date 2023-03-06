import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class CustomDropDownWidget extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final bool required;
  final String errorText;
  final dynamic value;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function onChanged;
  final type;
  final model;
  CustomDropDownWidget(
      {FormFieldSetter<dynamic>? onSaved,
      FormFieldValidator<dynamic>? validator,
      bool autovalidate = false,
      this.titleText = '',
      this.hintText = 'Selectionnez une option',
      this.required = false,
      this.errorText = 'Veuillez selectionner une option',
      this.model = 1,
      required this.value,
      required this.dataSource,
      required this.textField,
      required this.valueField,
      required this.onChanged,
      this.type})
      : super(
          onSaved: onSaved,
          validator: validator,
          // autovalidate: autovalidate,
          builder: (FormFieldState<dynamic> state) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                      labelText: titleText,
                      filled: false,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          border: type == null
                              ? Border.all(color: Colors.grey)
                              : Border(bottom: BorderSide(color: Colors.grey)),
                          borderRadius: type == null
                              ? BorderRadius.all(Radius.circular(10.0))
                              : null),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<dynamic>(
                          isExpanded: true,
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              hintText,
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                          ),
                          value: value == '' ? null : value,
                          onChanged: (dynamic newValue) {
                            state.didChange(newValue);
                            onChanged(newValue);
                          },
                          items: dataSource.map((item) {
                            return DropdownMenuItem<dynamic>(
                              value: model == 1 ? item.intitule : item['value'],
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                    child: model == 1
                                        ? Text(
                                            item.intitule,
                                            style: TextStyle(fontSize: 12),
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        : Text(
                                            item['libelle'],
                                            style: TextStyle(fontSize: 12),
                                            overflow: TextOverflow.ellipsis,
                                          )),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: state.hasError ? 5.0 : 0.0),
                  Text(
                    state.hasError ? state.errorText! : '',
                    style: TextStyle(
                        color: Colors.redAccent.shade700,
                        fontSize: state.hasError ? 12.0 : 0.0),
                  ),
                ],
              ),
            );
          },
        );
}
