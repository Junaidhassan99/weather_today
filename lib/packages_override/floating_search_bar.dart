import 'package:floating_search_bar/ui/sliver_search_bar.dart';
import 'package:flutter/material.dart';

class FloatingSearchBar extends StatefulWidget {
  FloatingSearchBar(
      {this.body,
      this.drawer,
      this.trailing,
      this.leading,
      this.endDrawer,
      this.controller,
      this.onChanged,
      this.title,
      this.decoration,
      this.onTap,
      this.padding = EdgeInsets.zero,
      this.pinned = false,
      @required List<Widget> children,
      this.requestFocusCallBack})
      : _childDelagate = SliverChildListDelegate(
          children,
        );

  FloatingSearchBar.builder(
      {this.body,
      this.drawer,
      this.endDrawer,
      this.trailing,
      this.leading,
      this.controller,
      this.onChanged,
      this.title,
      this.onTap,
      this.decoration,
      this.padding = EdgeInsets.zero,
      this.pinned = false,
      @required IndexedWidgetBuilder itemBuilder,
      @required int itemCount,
      this.requestFocusCallBack})
      : _childDelagate = SliverChildBuilderDelegate(
          itemBuilder,
          childCount: itemCount,
        );

  final Widget leading, trailing, body, drawer, endDrawer;

  final SliverChildDelegate _childDelagate;

  final TextEditingController controller;

  final ValueChanged<String> onChanged;

  final InputDecoration decoration;

  final VoidCallback onTap;

  /// Override the search field
  final Widget title;

  final bool pinned;

  final EdgeInsetsGeometry padding;

  final Function(FocusNode focusNode) requestFocusCallBack;

  @override
  _FloatingSearchBarState createState() => _FloatingSearchBarState();
}

class _FloatingSearchBarState extends State<FloatingSearchBar> {
  final FocusNode _textFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.requestFocusCallBack(_textFocusNode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: widget.drawer,
      endDrawer: widget.endDrawer,
      body: NestedScrollView(
        headerSliverBuilder: (context, enabled) {
          return [
            SliverPadding(
              padding: widget.padding,
              sliver: SliverFloatingBar(
                leading: widget.leading,
                floating: !widget.pinned,
                pinned: widget.pinned,
                title: widget.title ??
                    TextField(
                      focusNode: _textFocusNode,
                      controller: widget.controller,
                      decoration: widget.decoration ??
                          InputDecoration.collapsed(
                            hintText: "Search...",
                          ),
                      autofocus: false,
                      onChanged: widget.onChanged,
                      onTap: widget.onTap,
                    ),
                trailing: widget.trailing,
              ),
            ),
          ];
        },
        body: ListView.custom(childrenDelegate: widget._childDelagate),
      ),
    );
  }
}
