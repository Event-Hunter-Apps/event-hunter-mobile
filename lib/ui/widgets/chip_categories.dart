import 'package:event_hunter/shared/theme.dart';
import 'package:flutter/material.dart';

class ChipCategories extends StatefulWidget {
  final String city;

  const ChipCategories({
    required this.city,
    Key? key,
  }) : super(key: key);

  @override
  State<ChipCategories> createState() => _ChipCategoriesState();
}

class _ChipCategoriesState extends State<ChipCategories> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 5,
        ),
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isActive ? primaryColor : secondaryColor,
        ),
        child: Text(
          widget.city,
          style: isActive
              ? primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: semiBold,
                )
              : secondaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: semiBold,
                ),
        ),
      ),
    );
  }
}
