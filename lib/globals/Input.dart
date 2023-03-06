import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/AppColor.dart';

class MyFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)  validator;
  final String? Function(String?)  onSaved;
  final bool isPassword;
  final Icon prefixIcon;
  MyFormField(
      {Key? key,
      required this.hintText,
      required this.onSaved,
      required this.validator,
      this.isPassword = false,
      required this.prefixIcon})
      : super(key: key);
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 8, 20, 1),
        child: TextFormField(
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(letterSpacing: 1.0),
              contentPadding: EdgeInsets.all(15.0),
              prefixIcon: prefixIcon == null
                  ? Icon(FontAwesomeIcons.eraser)
                  : Container(
                      margin: EdgeInsets.only(right: 5.0),
                      decoration: BoxDecoration(
                          color: AppColor.blueColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0))),
                      child: prefixIcon,
                    ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.blueColor),
                  borderRadius: BorderRadius.circular(10.0)),
              filled: true,
              fillColor: Colors.white),
          obscureText: isPassword ? true : false,
          validator: validator,
          onSaved: onSaved,
        ),
      ),
    );
  }
}


class MyFormFieldNumber extends StatelessWidget {
  final String hintText;
  final String? Function(String?) validator;
  final String? Function(String?) onSaved;
  final bool isPassword;
  final int isMaxLength;

  MyFormFieldNumber(
      {Key? key,
      required this.hintText,
      required this.onSaved,
      required this.validator,
      this.isPassword = false,
      this.isMaxLength = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 8, 20, 1),
        child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [
            
          ],
          decoration: InputDecoration(
              counterText: '',
              hintText: hintText,
              hintStyle: TextStyle(letterSpacing: 1.0),
              prefixIcon: Container(
                margin: EdgeInsets.only(right: 5.0),
                decoration: BoxDecoration(
                    color: AppColor.blueColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0))),
                child: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),
              contentPadding: EdgeInsets.all(15.0),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.blueColor),
                  borderRadius: BorderRadius.circular(10.0)),
              filled: true,
              fillColor: Colors.white),
          obscureText: isPassword ? true : false,
          validator: validator,
          onSaved: onSaved,
          maxLength: isMaxLength != 0 ? isMaxLength : null,
        ),
      ),
    );
  }
}
