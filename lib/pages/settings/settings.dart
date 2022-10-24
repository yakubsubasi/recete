import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:recete/pages/settings/dark_ligth_them_widget.dart';
import 'package:recete/prefrences/cubit/prefrences_cubit.dart';
import 'package:recete/prefrences/model/prefences.dart';

// settings page view contains dark mode and language settings

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: BlocBuilder<PrefrencesCubit, Prefrences>(
          builder: (context, prefrences) {
            return Column(
              children: [SelectThemeWidget(prefrences: prefrences)],
            );
          },
        ),
      ),
    );
  }
}

class DarkModeToggleButton extends StatefulWidget {
  final Prefrences prefrences;

  const DarkModeToggleButton({Key? key, required this.prefrences})
      : super(key: key);

  @override
  State<DarkModeToggleButton> createState() => _DarkModeToggleButtonState();
}

List<bool> _isSelected = [true, true, true];

class _DarkModeToggleButtonState extends State<DarkModeToggleButton> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: [
        Icon(Icons.brightness_high),
        Icon(Icons.dark_mode),
        Icon(Icons.settings_system_daydream),
      ],
      isSelected: _isSelected,
      onPressed: (int index) {
        switch (index) {
          case 0:
            setState(() {
              _isSelected[0] = true;
              _isSelected[1] = false;
              _isSelected[2] = false;
            });
            context
                .read<PrefrencesCubit>()
                .changePrefrences(Prefrences(ThemeMode.light));

            break;
          case 1:
            setState(() {
              _isSelected[0] = false;
              _isSelected[1] = true;
              _isSelected[2] = false;
            });
            context
                .read<PrefrencesCubit>()
                .changePrefrences(Prefrences(ThemeMode.dark));
            break;
          case 2:
            setState(() {
              _isSelected[0] = false;
              _isSelected[1] = false;
              _isSelected[2] = true;
            });
            context
                .read<PrefrencesCubit>()
                .changePrefrences(Prefrences(ThemeMode.system));
            /*   controller.changePrefrences(Prefrences(ThemeMode.system)); */
            break;
          default:
        }
      },
    );
  }
}
