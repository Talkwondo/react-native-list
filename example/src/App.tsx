import * as React from 'react';

import { StyleSheet, View, Dimensions } from 'react-native';
import { ListView } from 'react-native-list';
const {width, height} = Dimensions.get("screen")


const listObject = [
{icon: "lock", name: "Password", navigate: "PasswordScreen"}, 
{icon: "barcode", name: "Scan"}
]


export default function App() {
  return (
    <View style={styles.container}>
      <ListView 
      width={width}
      height={height}
      listObject={listObject} 
      colorText="FFA500"
      onNavigate={({nativeEvent}: any)=> {
        console.log(nativeEvent.screen)
      }}
      colorIcon="FFA500" 
      sectionButtom="configure your account list" 
      sectionHeader="Account list" 
      colorChevron="FFA500" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  testAccoung: {
    fontSize: 15
  },
});
