import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recete/pages/list_page/landing_page_controller.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final landingPageController = context.read<ListPageController>();
    var styleActive = Theme.of(context).textTheme.titleSmall;
    var styleHint =
        Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 42,
      margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        /*color: Colors.white,*/
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    landingPageController.isSearching = false;
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          /*  hintStyle: style, */
          border: InputBorder.none,
        ),
        style: style,
        onChanged: (text) {
          widget.onChanged(text);
          landingPageController.isSearching = true;
          if (text.isEmpty) {
            FocusScope.of(context).requestFocus(FocusNode());
            landingPageController.isSearching = false;
          }
        },
      ),
    );
  }
}
