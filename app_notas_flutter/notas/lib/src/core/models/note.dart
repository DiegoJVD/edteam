import 'package:notas/src/core/constants/parameters.dart';

class Note{
  String? title;
  String? date;
  String? description;
  bool? private = false;
  List<String>? url;
  String? image;
  NoteType? type;
  NoteState? state;

  Note({
    this.title,
    this.date,
    this.description,
    this.private = false,
    this.url,
    this.image,
    this.type = NoteType.Text,
    this.state = NoteState.Visisble
  });

  Note note = Note(
    title: 'Note 1',
    date: '2021-10-10',
    description: 'This is a note',
    private: false,
    url: ['https://www.google.com'],
    image: 'https://www.google.com'
  );
}