import 'package:desafio_salaryfits/domain/domain.dart';
import 'package:desafio_salaryfits/presentation/settings/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';

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
                Row(
                  children: [
                    const Text(
                      'Unidade de temperatura',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 50,
                      child: DropdownButtonFormField<TemperatureUnit>(
                        onChanged: (value) {
                          if (value != null) {
                            widget.bloc.add(SettingsSave(unit: value));
                          }
                        },
                        value: setting?.unit,
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
                        items: TemperatureUnit.values
                            .map(
                              (unit) => DropdownMenuItem(
                                value: unit,
                                child: Text(unit.label),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
