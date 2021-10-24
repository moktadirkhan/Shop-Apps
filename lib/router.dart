import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shop_app/src/general/fade_in_route.dart';
import 'package:shop_app/src/pages/cart_page.dart';
import 'package:shop_app/src/pages/home_screen.dart';
import 'package:shop_app/src/pages/splash_screen.dart';

// void openCartPage( BuildContext context ) {
//   Navigator.of(context)
//       .pushNamed('/cart');
// }

typedef RouterMethod = PageRoute Function(RouteSettings, Map<String, String>);

final Map<String, RouterMethod> _definitions = {
  '/': (settings, _) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return const SplashScreen();
      },
    );
  },
  '/main': (settings, _) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return const HomeScreen();
      },
    );
  },
  '/cart_screen': (settings, _) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return const Cart();
      },
    );
  }
};

/*
  The following function does: 
  1. Get the route name from the settings
  2. Get the route method from the definitions
  3. Call the route method and return the result

  The result is a MaterialPageRoute
*/
Map<String, String>? _buildParams(String key, String name) {
  final uri = Uri.parse(key); // /cart_screen?id=1
  final path = uri.pathSegments; // [cart_screen]
  final params = Map<String, String>.from(uri.queryParameters); // {id: 1}

  final instance = Uri.parse(name).pathSegments; // [cart_screen]

  if (instance.length != path.length) {
    // if the route name is not the same as the instance
    return null; // return null
  }

  for (int i = 0; i < instance.length; i++) {
    // for each segment
    if (instance[i] != path[i]) {
      // if the segment is not the same as the instance
      return null; // return null
    }
  }

  for (int i = 0; i < instance.length; ++i) {
    // for each segment
    if (path[i] == '*') {
      // if the segment is *
      break; // break
    } else if (path[i][0] == ':') {
      //if the segment is : (e.g. :id)
      params[path[i].substring(1)] =
          instance[i]; // explanation: add the segment to the params
    } else if (path[i] != instance[i]) {
      // if the segment is not the same as the instance
      return null; // return null
    }
  }
  return params; // return the params
}

Route buildRouter(RouteSettings settings) {
  print("Visiting page ${settings.name}"); // print the route name
  for (final entry in _definitions.entries) {
    // for each entry in the definitions
    final params = _buildParams(entry.key, settings.name!); // get the params
    if (params != null) {
      // if the params are not null
      print(
          'Visiting: ${entry.key} for ${settings.name}'); // print the route name
      return entry.value(settings, params); // return the route method
    }
  }
  print('<!> Not recognized: ${settings.name}'); // print the route name
  return FadeInRoute(
    settings: settings,
    maintainState: false,
    builder: (_) {
      return Scaffold(
        body: Center(
          child: Text(
            '"${settings.name}"\nYou should not be here!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey[600],
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      );
    },
  );
}

void openCartPage(BuildContext context) {
  Navigator.of(context).pushNamed('/cart_screen');
}
