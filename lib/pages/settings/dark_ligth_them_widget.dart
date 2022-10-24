import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:recete/prefrences/cubit/prefrences_cubit.dart';
import 'package:recete/prefrences/model/prefences.dart';

class SelectThemeWidget extends StatelessWidget {
  Prefrences prefrences;
  SelectThemeWidget({Key? key, required this.prefrences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.color_lens),
              title: Text('Uygulama Teması'),
              subtitle: Text('Uygulamanın Temasını Seçiniz'),
            ),
            RadioListTile<ThemeMode>(
                value: ThemeMode.light,
                title: Text('Açık'),
                groupValue: prefrences.themeMode,
                onChanged: (s) {
                  context.read<PrefrencesCubit>().changePrefrences(
                      prefrences.copyWith(themeMode: ThemeMode.light));
                }),
            RadioListTile<ThemeMode>(
                value: ThemeMode.dark,
                title: Text('Koyu '),
                groupValue: prefrences.themeMode,
                onChanged: (s) {
                  context.read<PrefrencesCubit>().changePrefrences(
                      prefrences.copyWith(themeMode: ThemeMode.dark));
                }),
            RadioListTile<ThemeMode>(
                value: ThemeMode.system,
                title: Text('Sistem ayarını kullan'),
                groupValue: prefrences.themeMode,
                onChanged: (s) {
                  context.read<PrefrencesCubit>().changePrefrences(
                      prefrences.copyWith(themeMode: ThemeMode.system));
                })
          ],
        ),
      ),
    );
  }
}
