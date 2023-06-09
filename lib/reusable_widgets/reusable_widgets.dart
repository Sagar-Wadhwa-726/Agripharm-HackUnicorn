// ignore_for_file: use_function_type_syntax_for_parameters, non_constant_identifier_names, avoid_types_as_parameter_names, sized_box_for_whitespace, prefer_const_constructors
import 'package:flutter/material.dart';

// reusable widget for the logo image
Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
  );
}

// reusbale widget for the text fields
TextField reusableTextField(String text, IconData icon, bool isOtpType,
    TextEditingController controller) {
  return TextField(
    maxLength: isOtpType ? 6 : 10,
    textInputAction: TextInputAction.next,
    keyboardType:
        isOtpType ? TextInputType.visiblePassword : TextInputType.phone,
    controller: controller,
    obscureText: isOtpType,
    enableSuggestions: !isOtpType,
    autocorrect: !isOtpType,
    cursorColor: Colors.green,
    style: TextStyle(color: Colors.black.withOpacity(0.9), fontSize: 18),
    decoration: InputDecoration(
      counterText: "",
      prefixIcon: Icon(icon, color: Colors.black45),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.black87.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
  );
}

//reusable widget for the signin/signup button
Container generalButton(BuildContext context, Function onTap, String title) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) return Colors.black26;
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  );
}

// reusable widget for list tiles in the drawer section
ListTile drawerTiles(BuildContext context, IconData prefixicon, String title,
    Function onSeleciton) {
  return ListTile(
    onTap: () => onSeleciton(),
    leading: Icon(
      prefixicon,
      color: Colors.white,
    ),
    title: Text(
      title,
      textScaleFactor: 1.2,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
