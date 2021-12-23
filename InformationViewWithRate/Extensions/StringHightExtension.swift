//
//  StringHightExtension.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 06.12.2021.
//

import UIKit

extension String {
///  В строке, в диапазоне с 'withTeg'  до endTeg  меняется attribute на tegAttribute
    func changeStyle(startTeg: String, endTeg: String, normalAttribute: [NSAttributedString.Key : Any], tegAttribute: [NSAttributedString.Key : Any]) -> NSAttributedString {
        
//        Создаем
        let exitText = NSMutableAttributedString()
        let components = self.components(separatedBy: " ")
        //        flag для того чтобы проверить находимся ли мы в диапазоне тегов
        var flagChange = false
        
        for component in components {
            var text: NSAttributedString?
            //            Если мы между тегов, нужно менять стиль
            if  !flagChange {
                // если мы не на теге начала, и не в диапазоне изменений- записываем текст
                if component != startTeg  {
                    text = NSAttributedString(string: component, attributes: normalAttribute)
                    //                   Если мы на теге начала, меняем flag на активный
                } else {
                    flagChange = true
                }
            } else {
                // если мы не на конце тега меняем стиль
                if component != endTeg {
                    text = NSAttributedString(string: component, attributes: tegAttribute)
                } else {
                    // Если мы на теге конца, меняем флаг
                    flagChange = false
                }
            }
            guard let text = text else { continue }
            exitText.append(text)
            exitText.append(NSAttributedString(attributedString: NSAttributedString(string: " ")))
        }
        return exitText
    }
    
    
    
}
