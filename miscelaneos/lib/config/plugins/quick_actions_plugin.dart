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
        icon: 'compass',
      ),
      const ShortcutItem(
        type: 'biometric',
        localizedTitle: 'biometric',
        icon: 'finger',
      ),
      const ShortcutItem(
        type: 'pokemons',
        localizedTitle: 'pokemons',
        icon: 'pokemons',
      ),
      const ShortcutItem(type: 'map', localizedTitle: 'map', icon: 'charmander'),
    ]);
  }
}
