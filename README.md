# Riverpod

## Why Riverpod?

| Provider   |      Riverpod      | 
|----------|:-------------:|
| Error runtime exception |  Catch errors |
| Cannot declare multiple providers of the same type |    Can    |
| Depends on Flutter, widget tree | Use global provider |
| Depends on data types | No matter |
| Nested code when combine multiple providers | Much cleaner |

## How to user Riverpod?
**1. Wrap root widget with ProviderScope**
```
void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}
```
**2. Consume providers using ConsumerWidget/ConsumerStatefulWidget**

| Stateless widget   |      Stateful widget      | 
|----------|:-------------:|
| replace StatelessWidget -> ConsumerWidget |  StatefulWidget -> ConsumerStatefulWidget |
| add extra param WidgetRef ref |    State -> ConsumerState    |

**3. Read a provider**

We can user Consumer, however use ref is much faster.
```
final counterProvider = StateProvider((ref) => 0);
```
- **ref.watch()** -> watch for changes of the provider
```
int counter = ref.watch(counterProvider);
```
- **ref.read()** -> read only -> then make changes
```
ref.read(counterProvider.notifier).state++;

or we can use ref.update():

ref.read(counterProvider.notifier).update((prevState) => prevState + 1);

```
- **ref.listen()** -> react to provider change
```
ref.listen<int>(myNumber, (int? previousState, int nextState) {
      ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('$nextState')));
    });
```
- **ref.select()** -> filter rebuilds
```
final userProvider = StateProvider<User>(
    (ref) => User(
        name: 'Bean',
        email: 'bean@gmail.com' 
    ),
);

final label = ref.watch(userProvider.select((user) => 'Mr ${user.name}'));
```
- **autoDispose** -> dispose of any listeners when provider is no longer in use
```
final streamProvider = StreamProvider.autoDispose<int>((ref) {
  return Stream.fromIterable([36, 72]);
});
```

*** See more examples with some types of Providers in the source code. ***
