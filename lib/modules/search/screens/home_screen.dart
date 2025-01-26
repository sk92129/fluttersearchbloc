import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchsimple/modules/search/blocs/search_bloc.dart';
import 'package:searchsimple/modules/search/blocs/search_state.dart';
import 'package:searchsimple/modules/search/widgets/search_app_bar.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: searchAppBar(context),
        body: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            final list = context.read<SearchBloc>().state.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                list.isEmpty
                    ? const SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Text(
                          "Nothing to show , enter a valid name",
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: ((context, index) {
                            final name = list[index];
                            return ListTile(
                              title: Text(name),
                            );
                          }),
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
