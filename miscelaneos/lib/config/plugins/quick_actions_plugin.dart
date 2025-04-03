import 'package:miscelaneos/config/router/app_router.dart';
import 'package:quick_actions/quick_actions.dart';

class QuickActionsPlugin {
  static void inisialize() {
    final QuickActions quickActions = const QuickActions();
    quickActions.initialize((shortcutType) {
      switch (shortcutType) {
        case 'compass':
          appRouter.push('/compass');
          break;
        case 'biometric':
          appRouter.push('/biometric');
          break;
        case 'pokemons':
          appRouter.push('/pokemons');
          break;
        case 'map':
          appRouter.push('/maps');
          break;
        default:
      }
      // More handling code...
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
        type: 'compass',
        localizedTitle: 'compass',
        icon: 'icon_main',
      ),
      const ShortcutItem(
        type: 'biometric',
        localizedTitle: 'biometric',
        icon: 'icon_main',
      ),
      const ShortcutItem(
        type: 'pokemons',
        localizedTitle: 'pokemons',
        icon: 'icon_main',
      ),
      const ShortcutItem(type: 'map', localizedTitle: 'map', icon: 'icon_main'),
    ]);
  }
}
