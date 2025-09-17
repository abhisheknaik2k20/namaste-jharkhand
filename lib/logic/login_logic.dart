import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthLoadingProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}

class AuthManager {
  final AuthLoadingProvider loadingProvider;
  AuthManager({required this.loadingProvider});
  Future<void> emailpassLogin(String email, String password, BuildContext context) async {
    final auth = FirebaseAuth.instance;
    loadingProvider.setLoading(true);
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      if (context.mounted) context.go('/home');
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.code), backgroundColor: Colors.red));
      }
    } finally {
      loadingProvider.setLoading(false);
    }
  }

  Future<void> emailpassSignup(
      String name, String phone, String email, String password, String role, BuildContext context) async {
    final auth = FirebaseAuth.instance;
    final userRepository = UserRepository();
    loadingProvider.setLoading(true);
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      await auth.currentUser?.updateDisplayName(name);
      await userRepository.saveUser(email, phone: phone, role: role);
      if (context.mounted) context.go('/home');
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.code), backgroundColor: Colors.red));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('An error occurred, please try again.'), backgroundColor: Colors.red));
      }
    } finally {
      loadingProvider.setLoading(false);
    }
  }

  Future<void> implementGoogleSignIn(BuildContext context) async {
    final auth = FirebaseAuth.instance;
    final userRepository = UserRepository();
    loadingProvider.setLoading(true);
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signInSilently();
      googleUser ??= await GoogleSignIn().signIn();
      if (googleUser == null) return;
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential =
          GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      final UserCredential userCredential = await auth.signInWithCredential(credential);
      if (userCredential.user == null) return;
      await userRepository.saveUser(userCredential.additionalUserInfo?.profile?['email']);
      if (context.mounted) context.go('/home');
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign-in failed: ${e.toString()}')));
      }
    } finally {
      loadingProvider.setLoading(false);
    }
  }

  Future<void> logout(BuildContext context) async {
    final auth = FirebaseAuth.instance;
    loadingProvider.setLoading(true);
    try {
      await GoogleSignIn().signOut();
      await auth.signOut();
      if (context.mounted) context.go('/login');
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logout failed: ${e.toString()}')));
      }
    } finally {
      loadingProvider.setLoading(false);
    }
  }
}

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');
  Future<void> saveUser(String email, {String? phone, String? role}) async {
    final userData = UserModel(
        email: email,
        name: _auth.currentUser?.displayName ?? '',
        uid: _auth.currentUser?.uid ?? '',
        photoURL: _auth.currentUser?.photoURL ?? '',
        username: _auth.currentUser?.displayName ?? '',
        phone: phone,
        role: role ?? 'customer');
    await _usersCollection.doc(_auth.currentUser?.uid).set(userData.toMap(), SetOptions(merge: true));
  }

  UserModel errorUser() =>
      UserModel(email: 'N/A', name: 'UNKNOWN', uid: 'INVALID', photoURL: 'NULL', username: 'UNKNOWN', role: 'customer');

  Future<UserModel?> getUserById(String userId) async {
    try {
      DocumentSnapshot doc = await _usersCollection.doc(userId).get();
      if (doc.exists) return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<UserModel?> getCurrentUser() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) return getUserById(currentUser.uid);
    return null;
  }

  Future<void> updateUserStatus(String userId, String status) async =>
      await _usersCollection.doc(userId).update({'status': status});

  Stream<List<UserModel>> getAllUsers() => _usersCollection.snapshots().map((snapshot) => snapshot.docs
      .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>))
      .where((user) => user.uid != _auth.currentUser?.uid)
      .toList());

  Stream<UserModel?> streamUserData(String userId) => _usersCollection
      .doc(userId)
      .snapshots()
      .map((doc) => doc.exists ? UserModel.fromMap(doc.data() as Map<String, dynamic>) : null);

  Future<List<UserModel>> getAllUsersOnce() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('users').get();
      return snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).toList();
    } catch (e) {
      return [];
    }
  }
}

class UserModel {
  String? description;
  final String email;
  final String name;
  final String uid;
  final String photoURL;
  final String status;
  final Timestamp? createdAt;
  final String username;
  final String? phone;
  final String role;

  UserModel(
      {required this.email,
      required this.name,
      required this.uid,
      required this.photoURL,
      this.status = 'Online',
      this.createdAt,
      required this.username,
      this.description,
      this.phone,
      this.role = 'customer'});

  Map<String, dynamic> toMap() {
    try {
      return {
        'email': email,
        'name': name,
        'uid': uid,
        'photoURL': photoURL,
        'status': status,
        'createdAt': createdAt ?? FieldValue.serverTimestamp(),
        'username': username,
        'description': description,
        'phone': phone,
        'role': role
      };
    } catch (e) {
      return {
        'email': email,
        'name': name,
        'uid': uid,
        'photoURL': photoURL,
        'status': 'Online',
        'createdAt': FieldValue.serverTimestamp(),
        'username': username,
        'description': null,
        'phone': phone,
        'role': role
      };
    }
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    try {
      return UserModel(
          email: map['email'] ?? '',
          name: map['name'] ?? '',
          uid: map['uid'] ?? '',
          photoURL: map['photoURL'] ?? '',
          status: map['status'] ?? 'Offline',
          createdAt: map['createdAt'],
          username: map['username'] ?? '',
          description: map['description'],
          phone: map['phone'],
          role: map['role'] ?? 'customer');
    } catch (e) {
      return UserModel(
          email: map['email'] ?? '',
          name: map['name'] ?? '',
          uid: map['uid'] ?? '',
          photoURL: map['photoURL'] ?? '',
          username: map['username'] ?? '',
          phone: map['phone'],
          role: map['role'] ?? 'customer');
    }
  }

  UserModel copyWith(
      {String? email,
      String? name,
      String? uid,
      String? photoURL,
      String? status,
      Timestamp? createdAt,
      String? username,
      String? description,
      String? phone,
      String? role}) {
    try {
      return UserModel(
          description: description ?? this.description,
          email: email ?? this.email,
          name: name ?? this.name,
          uid: uid ?? this.uid,
          photoURL: photoURL ?? this.photoURL,
          status: status ?? this.status,
          createdAt: createdAt ?? this.createdAt,
          username: username ?? this.username,
          phone: phone ?? this.phone,
          role: role ?? this.role);
    } catch (e) {
      return UserModel(
          email: this.email,
          name: this.name,
          uid: this.uid,
          photoURL: this.photoURL,
          status: this.status,
          createdAt: this.createdAt,
          username: this.username,
          description: this.description,
          phone: this.phone,
          role: this.role);
    }
  }
}
