import 'package:flutter/material.dart'; 
void main() => runApp(const MyApp()); 
class MyApp extends StatelessWidget { 
const MyApp({super.key}); 
@override 
Widget build(BuildContext context) { 
return MaterialApp( 
debugShowCheckedModeBanner: false, 
home: const Scaffold( 
backgroundColor: Color(0xFFF5F6FA), 
body: SafeArea(child: Center(child: ProfileCard())), 
), 
); 
} 
} 
class ProfileCard extends StatelessWidget { 
const ProfileCard({super.key}); 
@override 
Widget build(BuildContext context) { 
return ConstrainedBox( 
constraints: const BoxConstraints(maxWidth: 420), 
child: Container( 
margin: const EdgeInsets.all(16), 
padding: const EdgeInsets.all(16), 
decoration: BoxDecoration( 
color: Colors.white, 
borderRadius: BorderRadius.circular(16), 
boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 
10, offset: Offset(0,4))], 
border: Border.all(color: Colors.grey.shade300), 
), 
child: Column( 
crossAxisAlignment: CrossAxisAlignment.stretch, 
children: [ 
// TODO(1): Ikon profil besar 
// TODO(2): Nama (tebal) + deskripsi singkat (abu-abu) 
// TODO(3): Row statistik (Posts, Followers, Following) — 
gunakan Expanded di tiap kolom 
], 
), 
), 
); 
} 
}