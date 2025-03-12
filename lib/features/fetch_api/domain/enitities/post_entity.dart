/// Entity class representing a Post in the domain layer
/// Contains core business logic and data
class PostEntity {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostEntity(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});
}
