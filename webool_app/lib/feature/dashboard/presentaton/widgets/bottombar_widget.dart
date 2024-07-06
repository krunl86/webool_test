import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:webool_common/webool_common.dart';

class BottomBarSection extends StatefulWidget {
  const BottomBarSection({
    super.key,
    required this.onTap,
  });
  final Function(int) onTap;

  @override
  State<BottomBarSection> createState() => _BottomBarSectionState();
}

class _BottomBarSectionState extends State<BottomBarSection> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: EdgeInsetsOf(context).symmetric(
          horizontal: Dimensions.smaller, vertical: Dimensions.smallest),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: theme.weboolColors.fontGrey!),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: theme.weboolColors.fontGrey!,
            offset: const Offset(2, 4),
            spreadRadius: 4,
            blurRadius: 4,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavItems(
              icon: const Icon(Icons.dashboard),
              title: 'Home',
              selected: selectedIndex == 0,
              onTap: () => setState(() {
                    selectedIndex = 0;
                    widget.onTap(selectedIndex);
                  })),
          NavItems(
              icon: const Icon(Icons.list),
              title: 'List',
              selected: selectedIndex == 1,
              onTap: () => setState(() {
                    selectedIndex = 1;
                    widget.onTap(selectedIndex);
                  })),
          NavItems(
              icon: const Icon(Icons.settings),
              title: 'Settings',
              selected: selectedIndex == 2,
              onTap: () => setState(() {
                    selectedIndex = 2;
                    widget.onTap(selectedIndex);
                  })),
        ],
      ),
    );
  }
}

class NavItems extends StatelessWidget {
  const NavItems({
    super.key,
    required this.icon,
    required this.title,
    required this.selected,
    required this.onTap,
  });
  final Widget icon;
  final String title;
  final bool selected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Expanded(
      flex: selected ? 0 : 0,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          padding: EdgeInsetsOf(context).symmetric(
            vertical: Dimensions.smaller,
            horizontal: Dimensions.small,
          ),
          decoration: BoxDecoration(
              color: selected ? theme.weboolColors.primaryRed : null,
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            children: [
              if (selected) ...[
                icon,
                const Space.w(Dimensions.small),
                Text(
                  title,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: selected ? Colors.white : Colors.grey),
                )
              ] else ...[
                const Space.w(Dimensions.smaller),
                icon,
                const Space.w(Dimensions.smaller)
              ]
            ],
          ),
        ),
      ),
    );
  }
}
