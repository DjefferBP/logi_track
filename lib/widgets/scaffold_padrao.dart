import '../color.dart';
import 'package:flutter/material.dart';

class ScaffoldWidget extends StatelessWidget {
  final Text? titulo;
  final bool? tituloNoMeio;
  final IconData? iconCanto;
  final Widget? child;
  final bool? acoes;
  final Color? corIconCanto;
  final Color? corIconAcoes;
  final VoidCallback? onBack;

  const ScaffoldWidget({
    super.key,
    this.titulo,
    this.tituloNoMeio = false,
    this.iconCanto,
    this.child,
    this.acoes = false,
    this.corIconAcoes,
    this.corIconCanto,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: titulo,
        centerTitle: tituloNoMeio,
        leading: iconCanto != null
            ? IconButton(
                icon: Icon(iconCanto),
                iconSize: 35,
                color: corIconCanto ?? Cor.primaryColor,
                onPressed: () {
                  if (onBack != null) {
                    onBack!();
                  } else {
                    Navigator.pop(context);
                  }
                },
              )
            : null,
        actions: acoes!
            ? [
                Icon(
                  Icons.notifications_none_sharp,
                  size: 35,
                  color: corIconAcoes ?? Cor.primaryColor,
                ),
              ]
            : null,
        leadingWidth: 80,
        titleSpacing: 30,
        actionsPadding: EdgeInsetsGeometry.only(right: 30),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -430,
                right: -100,
                child: Container(
                  width: 600,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Cor.primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              ?child,
            ],
          ),
        ),
      ),
    );
  }
}
