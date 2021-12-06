//
//  StringHightExtension.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 06.12.2021.
//

import UIKit

@available(iOS 10.0, *)
extension String {
//  В строке от @ до * делаем шрифт жирным
    func wordsHighlighted(fontSize: CGFloat = UIFont.systemFontSize) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        let range = NSRange(location: 0, length: self.utf16.count)
        do {
            let regex = try NSRegularExpression(pattern: "([@])" + ".+\\*")
            let results = regex.matches(in: self, range: range)

            results.forEach { result in
                attributedString.addAttributes(
                    [.font: UIFont.boldSystemFont(ofSize: fontSize)],
                    range: result.range)
            }
        } catch let error as NSError{
            print(error)
        }
        return attributedString
    }
}
