import 'package:go_router/go_router.dart';
import 'package:teslo_shop_mobile/features/auth/auth.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [

    // Primera pantalla
    GoRoute(
      path: '/splash',
      builder: (context, state) => const CheckAuthStatusScreen(),
    ),

    ///* Auth Routes
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),

    ///* Product Routes
    GoRoute(
      path: '/',
      // builder: (context, state) => const ProductsScreen(),
      builder: (context, state) => const LoginScreen(),
    ),
  ],
  ///! TODO: Bloquear si no se está autenticado de alguna manera
);