class JournalForm {
  String? title;
  String? body;
  String? dateTime;
  int? rating;

  JournalForm({this.title, this.body, this.dateTime, this.rating});

  String toString() {
    return 
      'Title: $title, Description: $body, DateTime: $dateTime Rating: $rating';
  }
}

