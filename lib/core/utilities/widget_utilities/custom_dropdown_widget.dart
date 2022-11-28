

import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:collection/collection.dart';

var data;
bool _isSelected = selectedItems.contains(data);
List<String> selectedItems = [];



class CustomDropDownButton extends StatefulWidget {
  final double? buttonWidth;
  final double? buttonHeight;
  final double? dropdownMaxHeight;
  final double? dropdownMaxWidth;
  final BoxDecoration? decoration;
  String? hint;
  final TextStyle? hintStyle;
  final Widget? dropdownheader;
  final Widget? dropDownfooter;
  final List<String> items;
  final bool? showdivider;
  final Color? dividercolor;
  final bool? selectmultiplevalues;
  final bool? showicon;

  CustomDropDownButton(
      {super.key,
      this.buttonWidth,
      this.buttonHeight,
      this.decoration,
      this.hint,
      this.hintStyle,
      this.dropdownheader,
      this.dropDownfooter,
      this.dropdownMaxHeight,
      this.dropdownMaxWidth,
      required this.items,
      this.showdivider,
      this.dividercolor,
      this.selectmultiplevalues,
      this.showicon});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showPopover(
            barrierColor: Colors.transparent,
            context: context,
            bodyBuilder: (context) => Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: widget.dropdownheader,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                            // padding: const EdgeInsets.all(8),
                            children: widget.items
                                .mapIndexed(
                                  (index, element) => widget
                                              .selectmultiplevalues !=
                                          true
                                      ? InkWell(
                                          onTap: () {
                                            setState(() {
                                              print(index);

                                              widget.hint = element;
                                              // print(data);
                                            });

                                            Navigator.of(context)..pop();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12, bottom: 12),
                                            child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 25),
                                                alignment: Alignment.centerLeft,
                                                // height: 50,

                                                child: Text(
                                                  element.toString(),
                                                )),
                                          ),
                                        )
                                      : StatefulBuilder(
                                          builder: (context, menuSetState) {
                                            data = element;
                                            return InkWell(
                                              onTap: () {
                                                

                                                print(_isSelected);
                                                print('1');
                                                _isSelected
                                                    ? selectedItems
                                                        .remove(data)
                                                    : selectedItems
                                                        .add(data);
                                                        print(_isSelected);
                                                        print('2');
                                                //This rebuilds the StatefulWidget to update the button's text
                                                setState(() {});
                                                //This rebuilds the dropdownMenu Widget to update the check mark
                                                menuSetState(() {});
                                              },
                                              child: Container(
                                                // height: double.infinity,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: Row(
                                                  children: [
                                                    _isSelected
                                                        ? const Icon(Icons
                                                            .check_box_outlined)
                                                        : const Icon(Icons
                                                            .check_box_outline_blank),
                                                    const SizedBox(width: 16),
                                                    Text(
                                                      element.toString(),
                                                      style:  TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:  _isSelected ?  FontWeight.bold : FontWeight.normal
                                                      ),
                                                      
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                )
                                .toList()),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    widget.showdivider == true
                        ? Divider(
                            thickness: 1,
                            color: widget.dividercolor,
                          )
                        : Container(),
                    Container(
                      child: widget.dropDownfooter,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
            direction: PopoverDirection.bottom,
            width: widget.dropdownMaxWidth,
            height: widget.dropdownMaxHeight,
            arrowHeight: 1);
      },
      child: Container(
        width: widget.buttonWidth,
        height: widget.buttonHeight,
        decoration: widget.decoration,
        child: Row(
          children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  child: widget.selectmultiplevalues == true
                      ? Text(
                        selectedItems.length != 0 ?
                        selectedItems.length.toString() : widget.hint.toString()
                        )
                      : Text(
                          widget.hint.toString(),
                          style: widget.hintStyle,
                        )),
            ),
            widget.showicon == true
                ? Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(Icons.arrow_drop_down_sharp,size: 24,),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}



// List<dynamic> selectedItems2 = [];
// // ignore: must_be_immutable
// class CustomDropdownButton2 extends StatefulWidget {
//   final String hint;
//   final String? value;
//   final List<DropdownMenuItem<dynamic>>? dropdownItems;
//   final ValueChanged<dynamic>? onChanged;
//   final DropdownButtonBuilder? selectedItemBuilder;
//   final Alignment? hintAlignment;
//   final Alignment? valueAlignment;
//   final double? buttonHeight, buttonWidth;
//   final EdgeInsetsGeometry? buttonPadding;
//   final BoxDecoration? buttonDecoration;
//   final int? buttonElevation;
//   final Widget? icon;
//   final double? iconSize;
//   final Color? iconEnabledColor;
//   final Color? iconDisabledColor;
//   final double? itemHeight;
//   final EdgeInsetsGeometry? itemPadding;
//   final double? dropdownHeight, dropdownWidth;
//   final EdgeInsetsGeometry? dropdownPadding;
//   final BoxDecoration? dropdownDecoration;
//   final int? dropdownElevation;
//   final Radius? scrollbarRadius;
//   final double? scrollbarThickness;
//   final bool? scrollbarAlwaysShow;
//   final Offset? offset;
//   //  bool? multiselect = false;

//    CustomDropdownButton2({
//     required this.hint,
//     required this.value,
//     required this.dropdownItems,
//     required this.onChanged,
//     this.selectedItemBuilder,
//     this.hintAlignment,
//     this.valueAlignment,
//     this.buttonHeight,
//     this.buttonWidth,
//     this.buttonPadding,
//     this.buttonDecoration,
//     this.buttonElevation,
//     this.icon,
//     this.iconSize,
//     this.iconEnabledColor,
//     this.iconDisabledColor,
//     this.itemHeight,
//     this.itemPadding,
//     this.dropdownHeight,
//     this.dropdownWidth,
//     this.dropdownPadding,
//     this.dropdownDecoration,
//     this.dropdownElevation,
//     this.scrollbarRadius,
//     this.scrollbarThickness,
//     this.scrollbarAlwaysShow,
//     this.offset,
//     // this.multiselect,
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<CustomDropdownButton2> createState() => _CustomDropdownButton2State();
// }

// class _CustomDropdownButton2State extends State<CustomDropdownButton2> {
//   @override
//   Widget build(BuildContext context) {
     
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2(
//         //To avoid long text overflowing.
//         isExpanded: true,
//         hint: Container(
//           alignment: widget.hintAlignment,
//           child: Text(
//             widget.hint,
//             overflow: TextOverflow.ellipsis,
//             maxLines: 1,
//             style: TextStyle(
//               fontSize: 14,
//               color: Theme.of(context).hintColor,
//             ),
//           ),
//         ),
//         value: widget.value,
//         items:widget.dropdownItems,
//         onChanged: widget.onChanged,
//         selectedItemBuilder: widget.selectedItemBuilder,
//         icon: widget.icon ?? Container(),
//         iconSize: widget.iconSize ?? 12,
//         iconEnabledColor: widget.iconEnabledColor,
//         iconDisabledColor: widget.iconDisabledColor,
//         buttonHeight: widget.buttonHeight ?? 40,
//         buttonWidth: widget.buttonWidth ?? 140,
//         buttonPadding:
//         widget.buttonPadding ?? const EdgeInsets.only(left: 14, right: 14),
//         buttonDecoration: widget.buttonDecoration ??
//                 BoxDecoration(
//                   borderRadius: BorderRadius.circular(14),
//                   border: Border.all(
//                     color: Colors.black45,
//                   ),
//                 ),
//         buttonElevation: widget.buttonElevation,
//         itemHeight: widget.itemHeight ?? 40,
//         itemPadding: widget.itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
//         //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
//         dropdownMaxHeight: widget.dropdownHeight ?? 200,
//         dropdownWidth: widget.dropdownWidth ?? 140,
//         dropdownPadding: widget.dropdownPadding,
//         dropdownDecoration: widget.dropdownDecoration ??
//                 BoxDecoration(
//                   borderRadius: BorderRadius.circular(14),
//                 ),
//         dropdownElevation: widget.dropdownElevation ?? 8,
//         scrollbarRadius: widget.scrollbarRadius ?? const Radius.circular(40),
//         scrollbarThickness: widget.scrollbarThickness,
//         scrollbarAlwaysShow: widget.scrollbarAlwaysShow,
//         //Null or Offset(0, 0) will open just under the button. You can edit as you want.
//         offset: widget.offset,
//         dropdownOverButton: false, //Default is false to show menu below button
//       ),
//     );
//   }
// }