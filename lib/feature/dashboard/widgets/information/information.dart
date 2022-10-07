import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/informationProvider.dart';
import 'widgets/info_list.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InfomationProvider>(context);
    final infos = provider.infos;

    return infos.isEmpty
        ? const Center(
            child: Text(
              'No Information.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: infos.length,
            itemBuilder: (context, index) {
              final info = infos[index];
              return InfoWidget(info: info);
            },
          );
  }
}
