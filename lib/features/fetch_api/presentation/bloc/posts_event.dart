/// Abstract base class for all possible events in the Posts feature
abstract class PostsEvent {}

/// Event triggered when posts should be fetched from the API
class FetchPosts extends PostsEvent {}