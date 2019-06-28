class User {
  final int id;
  final String name;
  final String username;
  final String userPic;
  final String userDetailUrl;
  final String htmlUrl;
  final int repos;
  final int followers;
  final int following;

  User(
      {this.id,
      this.name,
      this.username,
      this.userPic,
      this.userDetailUrl,
      this.htmlUrl,
      this.repos,
      this.followers,
      this.following});

  factory User.generateJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        name: json["name"] == null ? "" : json["name"],
        username: json["login"],
        userPic: json["avatar_url"],
        userDetailUrl: json["url"],
        htmlUrl: json["html_url"],
        repos: json["public_repos"] == null ? 0 : json["public_repos"],
        followers: json["followers"] == null ? 0 : json["followers"],
        following: json["following"] == null ? 0 : json["following"]);
  }
}
