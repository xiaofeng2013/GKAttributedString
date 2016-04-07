//
//  NSAttributedString+Extension.swift
//  guokrjingxuan
//
//  Created by 王兆昱 on 16/2/18.
//  Copyright © 2016年 guokr. All rights reserved.
//

import Foundation
import UIKit

public extension NSAttributedString {
    
    public func numberOfLinesWithSize(size: CGSize, options: NSStringDrawingOptions, context: NSStringDrawingContext?) -> Int {
        var font: UIFont?
        var lineSpacing: CGFloat?
        enumerateAttributesInRange(NSRange(location: 0, length: length), options: NSAttributedStringEnumerationOptions.LongestEffectiveRangeNotRequired) { (value, range, stop) -> Void in
            if let _font = value[NSFontAttributeName] as? UIFont {
                font = _font
            }
            if let _style = value[NSParagraphStyleAttributeName] as? NSParagraphStyle {
                lineSpacing = _style.lineSpacing
            }
            if font != nil && lineSpacing != nil {
                stop.memory = true
            }
        }
        let rect = boundingRectWithSize(size, options: options, context: context)
        let height = rect.size.height
        if let lineHeight = font?.lineHeight, spacing = lineSpacing {
            let _lineHeight = max(lineHeight, font!.pointSize + 2)
            if height > _lineHeight && height < _lineHeight * 2 {
                return 1
            } else {
                return Int(round( (height + spacing) / (_lineHeight + spacing) ))
            }
        } else {
            return 0
        }
    }
    
    public func fixedBoundingRectWithSize(size: CGSize, options: NSStringDrawingOptions, context: NSStringDrawingContext?) -> CGRect {
        var font: UIFont?
        var lineSpacing: CGFloat?
        enumerateAttributesInRange(NSRange(location: 0, length: length), options: NSAttributedStringEnumerationOptions.LongestEffectiveRangeNotRequired) { (value, range, stop) -> Void in
            if let _font = value[NSFontAttributeName] as? UIFont {
                font = _font
            }
            if let _style = value[NSParagraphStyleAttributeName] as? NSParagraphStyle {
                lineSpacing = _style.lineSpacing
            }
            if font != nil && lineSpacing != nil {
                stop.memory = true
            }
        }
        let rect = boundingRectWithSize(size, options: options, context: context)
        if var lineHeight = font?.lineHeight {
            let spacing = lineSpacing ?? 0
            lineHeight = max(lineHeight, font!.pointSize + 2)
            let numberOfLines = Int(round( rect.size.height / (lineHeight + spacing) ))
            let fixedHeight = CGFloat(numberOfLines) * (lineHeight + spacing) + 1
            return CGRect(x: 0, y: 0, width: size.width, height: fixedHeight)
        } else {
            return rect
        }
    }
    
    public func boundingRectWithSize(size: CGSize, maxNumberOfLines: Int, options: NSStringDrawingOptions, context: NSStringDrawingContext?) -> CGRect {
        var font: UIFont?
        var lineSpacing: CGFloat?
        enumerateAttributesInRange(NSRange(location: 0, length: length), options: NSAttributedStringEnumerationOptions.LongestEffectiveRangeNotRequired) { (value, range, stop) -> Void in
            if let _font = value[NSFontAttributeName] as? UIFont {
                font = _font
            }
            if let _style = value[NSParagraphStyleAttributeName] as? NSParagraphStyle {
                lineSpacing = _style.lineSpacing
            }
            if font != nil && lineSpacing != nil {
                stop.memory = true
            }
        }
        let height = boundingRectWithSize(size, options: options, context: context).size.height
        if let lineHeight = font?.lineHeight, spacing = lineSpacing {
            let _lineHeight = max(lineHeight, font!.pointSize + 2)
            var numberOfLines = Int(round( height / (_lineHeight + spacing) ))
            if maxNumberOfLines > 0 {
                numberOfLines = numberOfLines > maxNumberOfLines ? maxNumberOfLines : numberOfLines
            }
            let fixedHeight = CGFloat(numberOfLines) * (_lineHeight + spacing)
            return CGRect(x: 0, y: 0, width: size.width, height: fixedHeight)
        } else {
            return CGRectZero
        }
    }
    
}