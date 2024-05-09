//
//  UIFont+AppFonts.swift
//  BookFriend
//
//  Created by 배지해 on 5/7/24.
//

import UIKit

extension UIFont {
    static func pretendard(size fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        let familyName = "Pretendard"
        
        var weightString: String
        switch weight {
        case .bold:
            weightString = "Bold"
        case .heavy:
            weightString = "ExtraBold"
        case .ultraLight:
            weightString = "ExtraLight"
        case .light:
            weightString = "Light"
        case .medium:
            weightString = "Medium"
        case .regular:
            weightString = "Regular"
        case .semibold:
            weightString = "SemiBold"
        case .thin:
            weightString = "Thin"
        default:
            weightString = "Medium"
        }
        
        guard let font = UIFont(name: "\(familyName)-\(weightString)", size: fontSize) else {
            print("프리텐다드체 폰트 변환 실패")
            return .systemFont(ofSize: fontSize, weight: weight)
        }
        
        return font
    }
    
    static func aggro(size fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        let familyName = "OTSBAggro"
        
        var weightString: String
        switch weight {
        case .bold:
            weightString = "B"
        case .light:
            weightString = "L"
        case .medium:
            weightString = "M"
        default:
            weightString = "M"
        }
        
        guard let font = UIFont(name: "\(familyName)\(weightString)", size: fontSize) else {
            print("어그로체 폰트 변환 실패")
            return .systemFont(ofSize: fontSize, weight: weight)
        }
        return font
    }
    
    static func printAll() {
        familyNames.sorted().forEach { familyName in
            print("*** \(familyName) ***")
            fontNames(forFamilyName: familyName).sorted().forEach { fontName in
                print("\(fontName)")
            }
        }
    }
}
