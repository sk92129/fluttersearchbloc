import 'package:searchsimple/modules/search/data/itunes_item.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Iterable<ITunesItem>> searchITunes(String query) async {
  if (query.isEmpty) {
    return <ITunesItem>[];
  }

  final response = await http.get(
    Uri.parse('https://itunes.apple.com/search?term=$query&media=music&limit=10'),
  );

  try {
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = List<Map<String, dynamic>>.from(data['results']);
      return results.map((result) => ITunesItem.fromJson(result)).toList();
    } else {
      throw Exception('Error searching iTunes: ${response.statusCode} ${response.reasonPhrase}');
    }
  } catch (error) {
    print(error);
    return <ITunesItem>[];
  }
}
