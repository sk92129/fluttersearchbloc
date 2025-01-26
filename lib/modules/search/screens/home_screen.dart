import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchsimple/modules/search/blocs/search_bloc.dart';
import 'package:searchsimple/modules/search/blocs/search_state.dart';
import 'package:searchsimple/modules/search/data/itunes_item.dart';
import 'package:searchsimple/modules/search/screens/debounced_search_bar.dart';
import 'package:searchsimple/modules/search/util/search_itunes.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<HomeScreen> {
  ITunesItem? _selectedITunesItem;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
        body: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            final list = context.read<SearchBloc>().state.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            DebouncedSearchBar<ITunesItem>(
              hintText: 'Search iTunes for music',
              onResultSelected: (ITunesItem result) {
                setState(() {
                  _selectedITunesItem = result;
                });
              },
              resultToString: (ITunesItem result) => result.trackName,
              resultTitleBuilder: (ITunesItem result) => Text(result.trackName),
              resultSubtitleBuilder: (ITunesItem result) => Text(result.artistName),
              resultLeadingBuilder: (ITunesItem result) => result.artworkUrl30 != null
                  ? Image.network(result.artworkUrl30!)
                  : const Icon(Icons.music_note),
              searchFunction: searchITunes,
            ),
            if (_selectedITunesItem != null) ...[
              const SizedBox(height: 16),
              Text(_selectedITunesItem!.trackName, style: Theme.of(context).textTheme.titleLarge),
              Text(_selectedITunesItem!.artistName, style: Theme.of(context).textTheme.titleSmall),
              if (_selectedITunesItem!.artworkUrl100 != null) ...[
                const SizedBox(height: 16),
                Image.network(_selectedITunesItem!.artworkUrl100!),
              ],
            ],
              ],
            );
          },
        ),
      ),
    );
  }
}
