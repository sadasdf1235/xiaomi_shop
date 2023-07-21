import 'package:flutter/material.dart';

//TODO 定义保存状态的Widhget
class KeppAliveWrapper extends StatefulWidget {
  final Widget child;
  final bool keepAlive;
  const KeppAliveWrapper({Key? key,required this.child,this.keepAlive = true}) : super(key: key);

  @override
  State<KeppAliveWrapper> createState() => _KeppAliveWrapperState();
}

class _KeppAliveWrapperState extends State<KeppAliveWrapper> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => widget.keepAlive;

  @override
  void didUpdateWidget(covariant KeppAliveWrapper oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget.keepAlive != widget.keepAlive){
      updateKeepAlive();
    }
  }
}
