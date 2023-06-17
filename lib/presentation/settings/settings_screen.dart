import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';
import '../../presentation/presentation.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
    required this.bloc,
  });
  final SettingsBloc bloc;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    widget.bloc.add(SettingsLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      bloc: widget.bloc,
      builder: (context, state) {
        final setting = state.setting;
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.black,
          ),
          body: Padding(
            padding: Sized.middle.all,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Configurações',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 33,
                  ),
                ),
                Sized.bigger.verticalSized,
                Sized.bigger.verticalSized,
                _ListTileCustom<TemperatureUnit>(
                  label: 'Unidade de temperatura',
                  valueInitial: setting?.unit,
                  onChanged: (value) {
                    if (value != null) {
                      widget.bloc.add(SettingsSave(unit: value));
                    }
                  },
                  items: TemperatureUnit.values
                      .map(
                        (unit) => DropdownMenuItem(
                          value: unit,
                          child: Text(unit.label),
                        ),
                      )
                      .toList(),
                ),
                _ListTileCustom<Language>(
                  label: 'Idioma da descrição',
                  valueInitial: setting?.language,
                  items: Language.values
                      .map(
                        (language) => DropdownMenuItem(
                          value: language,
                          child: Text(
                            language.name,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      widget.bloc.add(SettingsSave(language: value));
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ListTileCustom<T> extends StatelessWidget {
  const _ListTileCustom({
    this.valueInitial,
    this.items = const [],
    required this.onChanged,
    required this.label,
  });

  final String label;
  final Function(T? value) onChanged;
  final T? valueInitial;
  final List<DropdownMenuItem<T>>? items;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 50,
          child: DropdownButtonFormField<T>(
            onChanged: onChanged,
            value: valueInitial,
            borderRadius: BorderRadius.circular(10),
            style: const TextStyle(
              color: Color.fromARGB(255, 96, 95, 95),
            ),
            icon: const Icon(
              Icons.unfold_more,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            items: items,
          ),
        ),
      ],
    );
  }
}
