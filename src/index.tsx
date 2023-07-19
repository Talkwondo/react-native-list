import {
  requireNativeComponent,
  UIManager,
  Platform,
} from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-list' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

export interface ListObject {
  /**
   * string of sf symbols key, see https://developer.apple.com/sf-symbols/
   */
  icon: string;
  /**
   * name of the list item
   */
  name: string;
  /**
   * this string can help you navigate to screen component via any react-native component you use.
   */
  navigate: string;
}

type ScreenCallback = {
  /**
   * The screen of the object in the navigate feild;
   */
  screen: string
}

interface ListProps {
 /**
   * See interface above
   */
  listObject: ListObject;
 /**
   * Color of the text in the list item, refer only hex string without #
   */
  colorText: string;
 /**
   * Color of the icon in the list item, refer only hex string without #
   */
  colorIcon: string;
 /**
   * Text in the bottom title
   */
  sectionButtom?: string
 /**
   * Text in the bottom title
   */
  sectionHeader?: string;
 /**
   * Color of the icon in the list item, refer only hex string without #
   */
  colorChevron: string
 /**
   * Callback on the list item when pressed.
   */
  onNavigate: (nativeEvent: ScreenCallback) => void;
};

const ComponentName = 'ListView';

export const ListView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<ListProps>(ComponentName)
    : () => {
        throw new Error(LINKING_ERROR);
      };
