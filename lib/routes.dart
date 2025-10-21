import 'package:go_router/go_router.dart';
import 'package:portfolio_app/about.dart';
import 'package:portfolio_app/contact.dart';
import 'package:portfolio_app/home.dart';
import 'package:portfolio_app/skills.dart';

class AppRoutes {
  static GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const Home()),
      GoRoute(path: '/about', builder: (context, state) => const About()),
      GoRoute(path: '/skills', builder: (context, state) => const Skills()),
      GoRoute(path: '/contact', builder: (context, state) => const Contact()),
    ],
  );
}
