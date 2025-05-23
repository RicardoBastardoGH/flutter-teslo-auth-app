


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop_mobile/features/auth/presentation/providers/auth_provider.dart';

class CheckAuthStatusScreen extends ConsumerWidget {
  const CheckAuthStatusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.listen(authProvider, (previous, next){
      print(next);
      
    });

    final status = ref.watch(authProvider).authStatus.name;

    return Scaffold(
      appBar: AppBar(
        title: Text(status),
      ),
      body: Center(
        child: CircularProgressIndicator( strokeWidth: 2,),
        ),
    );
  }
}