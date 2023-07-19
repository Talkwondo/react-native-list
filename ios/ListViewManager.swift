import SwiftUI
@available(iOS 14.0.0, *)
@objc(ListViewManager)
class ListViewManager: RCTViewManager {
    
    override func view() -> (ListView) {
        return ListView()
    }
    
    @objc override static func requiresMainQueueSetup() -> Bool {
        return false
    }
}

@available(iOS 14.0.0, *)
struct ListTest: View {
    var listObject:[[String:String]];
    var colorChevron: String;
    var colorIcon: String;
    var colorText: String;
    var sectionHeader: String;
    var sectionButtom: String;
    var scroll: Bool;
    var onNavigate: (_ data: String) -> Void;

    var body: some View {
        VStack {
            List {
                Section {
                    ForEach(0..<self.listObject.count, id: \.self) { index in
                        HStack {
                            Button(action: {
                                onNavigate(self.listObject[index]["navigate"] ?? "did not find the navigate screen. did you forget to write it?")
                            }, label: {
                                HStack {
                                    Image(systemName: self.listObject[index]["icon"] ?? "")
                                        .foregroundColor(Color(hex:colorIcon))
                                    Text(self.listObject[index]["name"] ?? "").font(.title3)
                                        .foregroundColor(Color(hex:colorText))
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color(hex:colorChevron))
                                }
                            })
                        }
                    }
                } header : {
                    Text(sectionHeader)
                } footer: {
                    Text(sectionButtom)
                }
            }
        }.listStyle(.insetGrouped).hasScrollEnabled(scroll)
    }
}

@available(iOS 14.0.0, *)
class ListView : UIView {
    @objc var colorChevron: NSString = "000000";
    @objc var colorIcon: NSString = "000000" {
        didSet {
            let host = UIHostingController(rootView: ListTest(listObject: listObject as! [[String:String]], colorChevron: colorChevron as String, colorIcon: colorIcon as String, colorText: colorText as String, sectionHeader: sectionHeader as String, sectionButtom: sectionButtom as String, scroll: scroll, onNavigate: onNavigateEvent)).view
                   host?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                   view.addSubview(host!)
        }
    }
    @objc var colorText: NSString = "000000";
    @objc var sectionHeader: NSString = "000000";
    @objc var sectionButtom: NSString = "000000";
    @objc var scroll: Bool = false;
    @objc var onNavigate: RCTBubblingEventBlock?
    
  
    @objc var listObject: NSArray = [["":""]] {
        didSet {
            let host = UIHostingController(rootView: ListTest(listObject: listObject as! [[String:String]], colorChevron: colorChevron as String, colorIcon: colorIcon as String, colorText: colorText as String, sectionHeader: sectionHeader as String, sectionButtom: sectionButtom as String, scroll: scroll, onNavigate: onNavigateEvent)).view
                   host?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                   view.addSubview(host!)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("coder error")
        
    }
    lazy var view: UIView = {
        let parent = UIView()
        parent.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return parent
    }()
    @objc func onNavigateEvent(data: String){
        print(data)
        if onNavigate != nil {
            onNavigate!(["screen":data])
        }
    }
}

@available(iOS 13.0, *)
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}


@available(iOS 13.0, *)
extension View {
    
    func hasScrollEnabled(_ value: Bool) -> some View {
        self.onAppear {
            UITableView.appearance().isScrollEnabled = value
        }
    }
}
