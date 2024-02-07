import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    required this.showLeadingIcon,
    this.leadingIcon,
    this.actionWidgets,
    this.leadingOnPressed,
    this.searchOnPressed,
  });

  final Widget? title;
  final bool showLeadingIcon;
  final IconData? leadingIcon;
  final List<Widget>? actionWidgets;
  final VoidCallback? leadingOnPressed;
  final VoidCallback? searchOnPressed;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
      ),
      child: Column(
        children: [
          AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: title,
            leading: showLeadingIcon
                ? IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_new))
                : leadingIcon != null
                    ? IconButton(onPressed: () {}, icon: Icon(leadingIcon))
                    : null,
            actions: actionWidgets,
          ),
          GestureDetector(
            onTap: searchOnPressed,
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 10),
                  Text(localizations!.searchHintLocale,
                      style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
