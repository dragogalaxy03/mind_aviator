import 'dart:convert';

void main() {
  // JSON data as a String
  String jsonString = '''
  {
    "images": [
      {
        "id": 1,
        "path": "images/mindaviator.png"
      },
      {
        "id": 2,
        "path": "images/microsoft.png"
      },
      {
        "id": 3,
        "path": "images/loqal.png"
      }
    ]
  }
  ''';

  // Parse JSON
  Map<String, dynamic> image_json_data = jsonDecode(jsonString);

  // Access the images list
  List<dynamic> images = image_json_data['images'];

  // Print image details
  for (var image in images) {
    print('ID: ${image['id']}, Path: ${image['path']}');
  }
}