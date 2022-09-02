import 'package:blogweb/models/post_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  late List<dynamic> postJson;
  setUp(() {
    postJson = [
      {
        "userId": 1,
        "id": 1,
        "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
      },
      {
        "userId": 1,
        "id": 2,
        "title": "qui est esse",
        "body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
      },
      {
        "userId": 1,
        "id": 3,
        "title": "ea molestias quasi exercitationem repellat qui ipsa sit aut",
        "body": "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut"
      },
      {
        "userId": 1,
        "id": 4,
        "title": "eum et est occaecati",
        "body": "ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit"
      }
    ];
  });

  test('post model when manually set', () {
    final post = PostModel(id: 1, title: 'post title 1', body: 'post body 1');

    expect(post.id, 1);
    expect(post.title, 'post title 1');
    expect(post.body, 'post body 1');
  });

  test('post model when set one data from json', () {
    final post = PostModel.fromJson(postJson.first);

    expect(post.id, 1);
    expect(post.title, 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit');
  });

  test('post model when set multiple data from json', () {
    final List<PostModel> posts = [];
    /// check default length data posts is 0
    expect(posts.length, 0);

    /// set data from json
    postJson.forEach((e) {
      posts.add(PostModel.fromJson(e));
    });

    /// check posts data length is same from json
    expect(posts.length, postJson.length);

    /// check last posts data
    expect(posts.last.id, 4);
    expect(posts.last.title, 'eum et est occaecati');
  });
}
