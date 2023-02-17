import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ClienteApi
{

  void GetTest() async{
    var url = Uri.https('jsonplaceholder.typicode.com', '/todos/1', {'q': '{https}'});
    var response = await http.get(url);
    Map data = convert.jsonDecode(response.body);
    print(data);

  }
  void PostTest() async{
    var url = Uri.https('jsonplaceholder.typicode.com', '/posts', {'q': '{https}'});

    var response = await http.post(url,
        body: {'title': 'Post Title', 'body': 'Lorem ipsum', 'userId': '1'}
    );
    Map data = convert.jsonDecode(response.body);
    print(data);
  }
  void GoogleBookTest() async{
    var url =
    Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': 'http', 'callback': 'handle'});
    var response = await http.get(url);

    print(response.body);
  }
  void Test(List<String> arguments) async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url =
    Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}