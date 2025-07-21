# Swipe Cards Package

The Swipe Cards package provides customizable card animations for Flutter applications. It includes two types of animations: Shuffle Card Animation and Stack Card Animation. This package allows developers to easily integrate card swiping functionality into their apps with minimal setup.

## Features

- **Shuffle Card Animation**: Allows cards to be swiped in both directions (left and right).
- **Stack Card Animation**: Allows cards to be swiped forward only.
- **Customizable Card Styles**: Define card height, width, colors, and border radius.
- **Easy Integration**: Simple API to use the animations in your Flutter app.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  swipe_cards: ^1.0.0
```

## Usage

### Import the Package

```dart
import 'package:swipe_cards/swipe_cards.dart';
```

### Example of Shuffle Card Animation

```dart
ShuffleCardAnimation(
  cardStyle: CardStyle(
    height: 300,
    width: 200,
    activeColor: Colors.blue,
    inactiveColor: Colors.grey,
    borderRadius: 15,
  ),
  totalCards: 10,
  builder: (context, index) {
    return Container(
      alignment: Alignment.center,
      child: Text('Card $index'),
    );
  },
);
```

### Example of Stack Card Animation

```dart
StackCardAnimation(
  cardStyle: CardStyle(
    height: 300,
    width: 200,
    activeColor: Colors.green,
    inactiveColor: Colors.grey,
    borderRadius: 15,
  ),
  totalCards: 10,
  builder: (context, index) {
    return Container(
      alignment: Alignment.center,
      child: Text('Card $index'),
    );
  },
);
```

## Central Card Animation

The `CentralCardAnimation` class provides a unified interface for both Shuffle and Stack animations. You can specify the type of animation and its direction.

### Example

```dart
CentralCardAnimation(
  animationType: AnimationType.shuffle, // or AnimationType.stack
  cardStyle: CardStyle(
    height: 300,
    width: 200,
    activeColor: Colors.red,
    inactiveColor: Colors.grey,
    borderRadius: 15,
  ),
  totalCards: 10,
  builder: (context, index) {
    return Container(
      alignment: Alignment.center,
      child: Text('Card $index'),
    );
  },
);
```

## Adding Video Content

To enhance your package documentation, you can include a video demonstration. You can link to a video hosted on platforms like YouTube or Vimeo. Use the following Markdown syntax to embed a video link:

```markdown
[Watch the demo video](https://www.youtube.com/watch?v=your_video_id)
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.