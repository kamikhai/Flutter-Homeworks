import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:home_works/hw4/model/like.dart';
import 'package:home_works/hw4/model/post.dart';
import 'package:home_works/hw4/dto/post_dto.dart';
import 'package:home_works/hw4/model/post_image.dart';
import 'package:home_works/hw4/model/stories.dart';
import 'package:home_works/hw4/model/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'instagram.db');
    log('path: $path');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
          id INTEGER PRIMARY KEY,
          name TEXT,
          image TEXT
      )
      ''');

    await db.execute('''
      CREATE TABLE posts(
          id INTEGER PRIMARY KEY,
          userId INTEGER,
          location TEXT,
          FOREIGN KEY(userId) REFERENCES users(id)
      )
      ''');

    await db.execute('''
      CREATE TABLE post_images(
          id INTEGER PRIMARY KEY,
          postId INTEGER,
          image TEXT,
          FOREIGN KEY(postId) REFERENCES posts(id)
      )
      ''');

    await db.execute('''
      CREATE TABLE likes(
          id INTEGER PRIMARY KEY,
          userId INTEGER,
          postId INTEGER,
          FOREIGN KEY(userId) REFERENCES users(id),
          FOREIGN KEY(postId) REFERENCES posts(id)
      )
      ''');

    await db.execute('''
      CREATE TABLE stories(
          id INTEGER PRIMARY KEY,
          userId INTEGER,
          FOREIGN KEY(userId) REFERENCES users(id)
      )
      ''');

    User user1 = User(
        id: 1,
        name: 'merlin',
        image: base64.encode(Uint8List.view(
            (await rootBundle.load('assets/images/avatars/photo1.jpeg'))
                .buffer)));
    log('user1: $user1');
    User user2 = User(
        id: 2,
        name: 'einstein97',
        image: base64.encode(Uint8List.view(
            (await rootBundle.load('assets/images/avatars/photo2.jpeg'))
                .buffer)));
    log('user2: $user2');
    User user3 = User(
        id: 3,
        name: 'salvador_d',
        image: base64.encode(Uint8List.view(
            (await rootBundle.load('assets/images/avatars/photo3.jpeg'))
                .buffer)));
    User user4 = User(
        id: 4,
        name: 'esenin',
        image: base64.encode(Uint8List.view(
            (await rootBundle.load('assets/images/avatars/photo4.jpeg'))
                .buffer)));
    User user5 = User(
        id: 5,
        name: 'chaplin',
        image: base64.encode(Uint8List.view(
            (await rootBundle.load('assets/images/avatars/photo5.jpeg'))
                .buffer)));
    User user6 = User(
        id: 6,
        name: 'gagarin',
        image: base64.encode(Uint8List.view(
            (await rootBundle.load('assets/images/avatars/photo6.jpeg'))
                .buffer)));
    User user7 = User(
        id: 7,
        name: 'pushkin',
        image: base64.encode(Uint8List.view(
            (await rootBundle.load('assets/images/avatars/photo7.jpeg'))
                .buffer)));
    db.insert('users', user1.toJson());
    db.insert('users', user2.toJson());
    db.insert('users', user3.toJson());
    db.insert('users', user4.toJson());
    db.insert('users', user5.toJson());
    db.insert('users', user6.toJson());
    db.insert('users', user7.toJson());

    Post post1 = Post(id: 1, userId: 2, location: 'Германия');
    Post post2 = Post(id: 2, userId: 1, location: 'США');
    db.insert('posts', post1.toJson());
    db.insert('posts', post2.toJson());

    PostImage postImage1 = PostImage(
        id: 1,
        postId: 1,
        image: base64.encode(Uint8List.view(
            (await rootBundle.load('assets/images/posts/post1.jpeg')).buffer)));
    PostImage postImage2 = PostImage(
        id: 2,
        postId: 2,
        image: base64.encode(Uint8List.view(
            (await rootBundle.load('assets/images/posts/post2.jpeg')).buffer)));
    PostImage postImage3 = PostImage(
        id: 3,
        postId: 2,
        image: base64.encode(Uint8List.view(
            (await rootBundle.load('assets/images/posts/post3.jpeg')).buffer)));
    db.insert('post_images', postImage1.toJson());
    db.insert('post_images', postImage2.toJson());
    db.insert('post_images', postImage3.toJson());

    Like like1 = Like(id: 1, userId: 4, postId: 1);
    Like like2 = Like(id: 2, userId: 5, postId: 1);
    Like like3 = Like(id: 3, userId: 6, postId: 1);
    Like like4 = Like(id: 4, userId: 3, postId: 2);
    Like like5 = Like(id: 5, userId: 7, postId: 2);
    Like like6 = Like(id: 6, userId: 2, postId: 2);
    db.insert('likes', like1.toJson());
    db.insert('likes', like2.toJson());
    db.insert('likes', like3.toJson());
    db.insert('likes', like4.toJson());
    db.insert('likes', like5.toJson());
    db.insert('likes', like6.toJson());

    Stories stories1 = Stories(id: 1, userId: 1);
    Stories stories2 = Stories(id: 2, userId: 2);
    Stories stories3 = Stories(id: 3, userId: 3);
    Stories stories4 = Stories(id: 4, userId: 4);
    Stories stories5 = Stories(id: 5, userId: 5);
    Stories stories6 = Stories(id: 6, userId: 6);
    Stories stories7 = Stories(id: 7, userId: 7);
    db.insert('stories', stories1.toJson());
    db.insert('stories', stories2.toJson());
    db.insert('stories', stories3.toJson());
    db.insert('stories', stories4.toJson());
    db.insert('stories', stories5.toJson());
    db.insert('stories', stories6.toJson());
    db.insert('stories', stories7.toJson());
    log('end save');
  }

  Future<List<User>> getUsers() async {
    Database db = await instance.database;
    var users = await db.query('users');
    List<User> userList =
        users.isNotEmpty ? users.map((c) => User.fromJson(c)).toList() : [];
    return userList;
  }

  Future<User> getUsersById(int id, Database db) async {
    var u = await db.query('users', where: 'id = ?', whereArgs: [id]);
    User user = User.fromJson(u.first);
    return user;
  }

  Future<List<User>> getUserLikes(int postId, Database db) async {
    var likes =
        await db.query('likes', where: 'postId = ?', whereArgs: [postId]);
    List<Like> likeList = likes.map((c) => Like.fromJson(c)).toList();
    List<User> userLikes = List.empty();
    for (var like in likeList) {
      User user = await getUsersById(like.userId, db);
      userLikes.add(user);
    }
    return userLikes;
  }

  Future<List<PostDto>> getPosts() async {
    Database db = await instance.database;
    var posts = await db.query('posts');
    List<Post> postList =
        posts.isNotEmpty ? posts.map((c) => Post.fromJson(c)).toList() : [];
    List<PostDto> postDtoList = List.empty(growable: true);
    for (var post in postList) {
      var u =
          await db.query('users', where: 'id = ?', whereArgs: [post.userId]);
      User user = User.fromJson(u.first);
      var likes =
          await db.query('likes', where: 'postId = ?', whereArgs: [post.id]);
      List<Like> likeList = likes.map((c) => Like.fromJson(c)).toList();
      List<User> userLikes = List.empty(growable: true);
      for (var like in likeList) {
        var u =
            await db.query('users', where: 'id = ?', whereArgs: [like.userId]);
        User user = User.fromJson(u.first);
        userLikes.add(user);
      }
      var postImages = await db
          .query('post_images', where: 'postId = ?', whereArgs: [post.id]);
      List<String> postImagesList =
          postImages.map((c) => PostImage.fromJson(c).image).toList();
      postDtoList.add(PostDto(
          user: user,
          likes: userLikes,
          postImages: postImagesList,
          post: post));
    }

    return postDtoList;
  }

  Future<List<User>> getStoriesUsers() async {
    Database db = await instance.database;
    var stories = await db.query('stories');
    List<Stories> storiesList =
        stories.map((c) => Stories.fromJson(c)).toList();
    List<User> userStories = List.empty(growable: true);
    for (var story in storiesList) {
      var u =
          await db.query('users', where: 'id = ?', whereArgs: [story.userId]);
      User user = User.fromJson(u.first);
      userStories.add(user);
    }
    return userStories;
  }

  Future<void> addImage(List<String> images) async {
    Database db = await instance.database;
    var posts = await db.query('posts');
    var img = await db.query('post_images');
    var likes = await db.query('likes');
    Post post = Post(id: posts.length + 1, userId: 1, location: 'США');
    db.insert('posts', post.toJson());
    int i = 1;
    for (var image in images) {
      PostImage postImage =
          PostImage(id: img.length + i, postId: posts.length + 1, image: image);
      db.insert('post_images', postImage.toJson());
      i += 1;
    }
    Like like1 =
        Like(id: likes.length + 1, userId: 7, postId: posts.length + 1);
    Like like2 =
        Like(id: likes.length + 2, userId: 4, postId: posts.length + 1);
    Like like3 =
        Like(id: likes.length + 3, userId: 5, postId: posts.length + 1);
    db.insert('likes', like1.toJson());
    db.insert('likes', like2.toJson());
    db.insert('likes', like3.toJson());
    log('end adding');
  }
}
