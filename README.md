# react-native-list

Create Native ui list in your react-native app

## Installation

```sh
npm install react-native-list-native-ui
cd ios && pod install
```

## Usage

```js
import { ListView } from 'react-native-list';

// ...

const listObject = [
  { icon: 'lock', name: 'Password', navigate: 'PasswordScreen' },
  { icon: 'barcode', name: 'Scan', navigate: 'ScanScreen' },
];

// ...

<ListView
  width={width}
  height={height}
  listObject={listObject}
  colorText="FFA500"
  onNavigate={({ nativeEvent }) => {
    navigation.navigate(nativeEvent.screen);
  }}
  colorIcon="FFA500"
  sectionButtom="configure your account list"
  sectionHeader="Account list"
  colorChevron="FFA500"
/>;
```

### Visualization

![Simulator Screenshot - iPhone 14 - 2023-07-19 at 18 16 23](https://github.com/Talkwondo/react-native-list/assets/20122139/5e444be1-c628-4d19-b515-e07b61ced9b8)

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
