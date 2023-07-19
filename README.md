# react-native-list

Create Native ui list in your react-native app

## Installation

```sh
npm install react-native-list
cd ios && pod install
```

## Usage
```js
import { ListView } from "react-native-list";

// ...

 <ListView 
      width={width}
      height={height}
      listObject={listObject} 
      colorText="FFA500"
      onNavigate={({nativeEvent})=> {
        navigation.navigate(nativeEvent.screen)
      }}
      colorIcon="FFA500" 
      sectionButtom="configure your account list" 
      sectionHeader="Account list" 
      colorChevron="FFA500" />
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
