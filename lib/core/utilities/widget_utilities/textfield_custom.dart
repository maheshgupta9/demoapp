// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';


// class TextFieldCustom extends StatefulWidget {
//   final String? labelText;
//   final TextEditingController controller;
//   final String Function(String)? validator;
//   final Function(String)? onFieldSubmit;
//   final String hintText;
//    Function? onTapSuffixIcon;
//   final Function onTapPrefixIcon;
//   final IconData suffixIconData;
//   final IconData prefixIconData;
//   final FocusNode focusNode;
//   final TextStyle labelStyle;
//   final TextStyle textStyle;
//   final int maxLines;
//   final TextInputAction textInputAction;
//   final int maxLength;
//   final Color backgroundColor;
//   final Color hintTextColor;
//   final Color cursorColor;
//   final EdgeInsetsGeometry contentPadding;
//   final Color textColor;
//   final Color prefixIconColor;
//   final Color sufixIconColor;
//   final Widget prefixWidget;
//   final Widget suffixWidget;
//   final TextAlign textAlign;
//   final TextInputType inputType;
//   final bool obscureText;
//   final bool readyOnly;
//   final bool isStartMargin;
//   final double borderRadius;
//   final Color borderColor;
//   final bool borderSide;
//   final bool isSuffix;
//   final Function onTap;
//   final Function onChanged;
//   final List<TextInputFormatter> inputFormatters;

//   static const Color _textFieldThemeColor = const Color(0xff866d59);

//   const TextFieldCustom({
//     Key? key,
//     this.labelText,
//     required this.controller,
//     this.validator,
//     this.onFieldSubmit,
//     required this.hintText,
//     this.onTapSuffixIcon,
//     this.suffixIconData,
//     this.inputFormatters,
//     this.maxLines = 1,
//     this.labelStyle = const TextStyle(color: Colors.grey),
//     this.textStyle = const TextStyle(
//       fontFamily: 'Rubik',
//       color: Color(0xff172b4d),
//       fontSize: 17,
//       fontWeight: FontWeight.w400,
//       fontStyle: FontStyle.normal,
//       letterSpacing: 0,
//     ),
//     this.contentPadding,
//     this.maxLength,
//     this.isSuffix = false,
//     this.isStartMargin = true,
//     this.prefixIconData,
//     this.onTapPrefixIcon,
//     this.textInputAction,
//     this.focusNode,
//     this.textAlign = TextAlign.start,
//     this.backgroundColor = Colors.transparent,
//     this.hintTextColor = _textFieldThemeColor,
//     this.cursorColor = _textFieldThemeColor,
//     this.textColor = _textFieldThemeColor,
//     this.prefixIconColor = const Color(0xff20242b),
//     this.sufixIconColor = const Color(0xff20242b),
//     this.borderColor = Colors.white,
//     this.prefixWidget,
//     this.suffixWidget,
//     this.inputType = TextInputType.text,
//     this.obscureText = false,
//     this.readyOnly = false,
//     this.borderRadius = 10,
//     this.onChanged,
//     this.borderSide = false,
//     this.onTap,
//   }) : super(key: key);

//   @override
//   _TextFieldState createState() => _TextFieldState();
// }

// class _TextFieldState extends State<TextFieldCustom> {
//   Widget build(BuildContext context) {
//     return Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           widget.prefixWidget != null
//               ? Container(
//                   margin: EdgeInsets.only(top: 12), child: widget.prefixWidget)
//               : widget.prefixIconData == null
//                   ? Container()
//                   : GestureDetector(
//                       onTap: widget.onTapPrefixIcon,
//                       child: Icon(
//                         widget.prefixIconData,
//                         size: 16,
//                         color: widget.prefixIconColor,
//                       ),
//                     ),
//           widget.isStartMargin ? SizedBox(width: 11) : Container(),
//           Expanded(
//               child: TextFormField(
//                   onChanged: widget.onChanged,
//                   onTap: widget.onTap,
//                   readOnly: widget.readyOnly,
//                   obscureText: widget.obscureText,
//                   keyboardType: widget.inputType,
//                   focusNode: widget.focusNode,
//                   validator: widget.validator,
//                   inputFormatters: widget.inputFormatters,
//                   cursorWidth: 1,
//                   maxLength: widget.maxLength,
//                   cursorColor: widget.cursorColor,
//                   autofocus: false,
//                   maxLines: widget.maxLines,
//                   controller: widget.controller,
//                   textAlign: widget.textAlign,
//                   style: widget.textStyle,
//                   onFieldSubmitted: widget.onFieldSubmit,
//                   textInputAction: widget.textInputAction,
//                   decoration: InputDecoration(
//                       hoverColor: Colors.white,
//                       labelText: widget.labelText,
//                       labelStyle: widget.labelStyle,
//                       counterText: '',
//                       hintText: widget.hintText,
//                       hintStyle: normalRubikSize(
//                           color: Color(0xff8993a4), fontSize: 16),
//                       contentPadding: widget.isSuffix
//                           ? EdgeInsets.only(left: 5.0, top: 12, bottom: 0)
//                           : EdgeInsets.only(left: 5.0),
//                       suffixIcon: widget.isSuffix
//                           ? widget.suffixWidget != null
//                               ? widget.suffixWidget
//                               : widget.suffixIconData == null
//                                   ? null
//                                   : GestureDetector(
//                                       onTap: widget.onTapSuffixIcon,
//                                       child: Icon(widget.suffixIconData,
//                                           size: 22,
//                                           color: widget.sufixIconColor))
//                           : null,
//                       focusedBorder: UnderlineInputBorder(
//                           borderRadius:
//                               BorderRadius.circular(widget.borderRadius),
//                           borderSide: widget.borderSide == true
//                               ? BorderSide(color: widget.borderColor)
//                               : BorderSide.none),
//                       enabledBorder: UnderlineInputBorder(
//                           borderRadius:
//                               BorderRadius.circular(widget.borderRadius),
//                           borderSide: widget.borderSide == true
//                               ? BorderSide(color: widget.borderColor, width: 1)
//                               : BorderSide.none),
//                       border: UnderlineInputBorder(
//                           borderRadius:
//                               BorderRadius.circular(widget.borderRadius),
//                           borderSide: widget.borderSide == true
//                               ? BorderSide(color: widget.borderColor, width: 1)
//                               : BorderSide.none),
//                       errorBorder: UnderlineInputBorder(
//                           borderRadius:
//                               BorderRadius.circular(widget.borderRadius),
//                           borderSide: widget.borderSide == true
//                               ? BorderSide(color: Colors.red, width: 1)
//                               : BorderSide.none),
//                       disabledBorder: UnderlineInputBorder(
//                           borderRadius:
//                               BorderRadius.circular(widget.borderRadius),
//                           borderSide: widget.borderSide == true
//                               ? BorderSide(color: widget.borderColor, width: 1)
//                               : BorderSide.none)))),
//           widget.isSuffix
//               ? Container()
//               : widget.suffixWidget != null
//                   ? Row(children: [
//                       SizedBox(width: 3),
//                       Container(
//                           margin: EdgeInsets.only(top: 12),
//                           child: widget.suffixWidget),
//                       SizedBox(width: 5)
//                     ])
//                   : widget.suffixIconData == null
//                       ? Container()
//                       : GestureDetector(
//                           onTap: widget.onTapSuffixIcon,
//                           child: Icon(widget.suffixIconData,
//                               size: 22, color: widget.sufixIconColor))
//         ]);
//   }
// }
