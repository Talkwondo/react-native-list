#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(ListViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(listObject, NSArray)
RCT_EXPORT_VIEW_PROPERTY(colorChevron, NSString)
RCT_EXPORT_VIEW_PROPERTY(colorText, NSString)
RCT_EXPORT_VIEW_PROPERTY(colorIcon, NSString)
RCT_EXPORT_VIEW_PROPERTY(sectionHeader, NSString)
RCT_EXPORT_VIEW_PROPERTY(sectionButtom, NSString)
RCT_EXPORT_VIEW_PROPERTY(scroll, BOOL)
RCT_EXPORT_VIEW_PROPERTY(onNavigate, RCTBubblingEventBlock)

@end
