//
// LayoutFactories.swift
//
// Copyright (c) 2018-Present Sugar And Candy ( https://github.com/SugarAndCandy )
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import UIKit

public extension VerticalAxisLayoutTraits where Self: ConstraintFactory, VerticalAttributeType: EditableItem {
    var top: VerticalAttributeType { return VerticalAttributeType(layoutDescription: layoutDescription(for: .top)) }
    var bottom: VerticalAttributeType { return VerticalAttributeType(layoutDescription: layoutDescription(for: .bottom)) }
    var centerY: VerticalAttributeType { return VerticalAttributeType(layoutDescription: layoutDescription(for: .centerY)) }
    var topMargin: VerticalAttributeType { return VerticalAttributeType(layoutDescription: layoutDescription(for: .topMargin)) }
    var bottomMargin: VerticalAttributeType { return VerticalAttributeType(layoutDescription: layoutDescription(for: .bottomMargin)) }
    var centerYWithinMargins: VerticalAttributeType { return VerticalAttributeType(layoutDescription: layoutDescription(for: .centerYWithinMargins)) }
}

public extension VerticalAxisExtendedLayoutTraits where Self: ConstraintFactory, VerticalAttributeType: EditableItem {
    var lastBaseline: VerticalAttributeType { return VerticalAttributeType(layoutDescription: layoutDescription(for: .lastBaseline)) }
    var firstBaseline: VerticalAttributeType { return VerticalAttributeType(layoutDescription: layoutDescription(for: .firstBaseline)) }
}

public extension HorizontalAxisLayoutTraits where Self: ConstraintFactory, HorizontalAttributeType: EditableItem {
    var left: HorizontalAttributeType { return HorizontalAttributeType(layoutDescription: layoutDescription(for: .left)) }
    var right: HorizontalAttributeType { return HorizontalAttributeType(layoutDescription: layoutDescription(for: .right)) }
    var leading: HorizontalAttributeType { return HorizontalAttributeType(layoutDescription: layoutDescription(for: .leading)) }
    var trailing: HorizontalAttributeType { return HorizontalAttributeType(layoutDescription: layoutDescription(for: .trailing)) }
    var centerX: HorizontalAttributeType { return HorizontalAttributeType(layoutDescription: layoutDescription(for: .centerX)) }
    var leftMargin: HorizontalAttributeType { return HorizontalAttributeType(layoutDescription: layoutDescription(for: .leftMargin)) }
    var rightMargin: HorizontalAttributeType { return HorizontalAttributeType(layoutDescription: layoutDescription(for: .rightMargin)) }
    var leadingMargin: HorizontalAttributeType { return HorizontalAttributeType(layoutDescription: layoutDescription(for: .leadingMargin)) }
    var trailingMargin: HorizontalAttributeType { return HorizontalAttributeType(layoutDescription: layoutDescription(for: .trailingMargin)) }
    var centerXWithinMargins: HorizontalAttributeType { return HorizontalAttributeType(layoutDescription: layoutDescription(for: .centerXWithinMargins)) }
}

public extension DimensionLayoutTraits where Self: ConstraintFactory, DimensionAttributeType: EditableItem {
    var width: DimensionAttributeType { return DimensionAttributeType(layoutDescription: layoutDescription(for: .width)) }
    var height: DimensionAttributeType { return DimensionAttributeType(layoutDescription: layoutDescription(for: .height)) }
}

open class ConstraintFactory {
    public required init(firstItem: LayoutDescription.Item) { self.firstItem = firstItem }
    internal var firstItem: LayoutDescription.Item
    internal var layoutDescriptions = [LayoutDescription]()
    
    internal func setup() {
        (firstItem.someItem as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(layoutDescriptions.flatMap { $0.nsLayoutConstraint })
    }
    
    fileprivate func layoutDescription(for attribute: NSLayoutAttribute) -> LayoutDescription {
        let newLayoutDescription = LayoutDescription(firstItem: firstItem, firstAttribute: attribute)
        layoutDescriptions.append(newLayoutDescription)
        return newLayoutDescription
    }
}

open class ConstraintViewFactory: ConstraintFactory, VerticalAxisExtendedLayoutTraits, HorizontalAxisLayoutTraits, DimensionLayoutTraits, ExtendedLayoutTraits {
    public typealias VerticalAttributeType = VerticalViewLayoutAttribute
    public typealias HorizontalAttributeType = HorizontalViewLayoutAttribute
    public typealias DimensionAttributeType = DimensionViewLayoutAttribute
    
    public typealias EdgesLayoutAttributeType = EdgesViewLayoutAttribute
    public typealias SizeLayoutAttributeType = SizeViewLayoutAttribute
    public typealias CenterLayoutAttributeType = CenterViewLayoutAttribute
    
    open var edges: EdgesLayoutAttributeType {
        let topLayoutDescription = layoutDescription(for: .top)
        let bottomLayoutDescription = layoutDescription(for: .bottom)
        let leadingLayoutDescription = layoutDescription(for: .leading)
        let trailingLayoutDescription = layoutDescription(for: .trailing)
        return EdgesLayoutAttributeType(top: topLayoutDescription,
                                        bottom: bottomLayoutDescription,
                                        leading: leadingLayoutDescription,
                                        trailing: trailingLayoutDescription)
    }
    
    open var size: SizeLayoutAttributeType {
        let widthLayoutDescription = layoutDescription(for: .width)
        let heightLayoutDescription = layoutDescription(for: .height)
        return SizeLayoutAttributeType(width: widthLayoutDescription, height: heightLayoutDescription)
    }
  
    open var center: CenterLayoutAttributeType {
        let centerXLayoutDescription = layoutDescription(for: .centerX)
        let centerYLayoutDescription = layoutDescription(for: .centerY)
        return CenterLayoutAttributeType(centerX: centerXLayoutDescription, centerY: centerYLayoutDescription)
    }
}

open class ConstraintLayoutGuideFactory: ConstraintFactory, VerticalAxisLayoutTraits, HorizontalAxisLayoutTraits, DimensionLayoutTraits, ExtendedLayoutTraits {
    public typealias VerticalAttributeType = VerticalLayoutAttribute
    public typealias HorizontalAttributeType = HorizontalLayoutAttribute
    public typealias DimensionAttributeType = DimensionLayoutAttribute
    
    public typealias EdgesLayoutAttributeType = EdgesLayoutAttribute
    public typealias SizeLayoutAttributeType = SizeLayoutAttribute
    public typealias CenterLayoutAttributeType = CenterLayoutAttribute
    
    open var edges: EdgesLayoutAttributeType {
        let topLayoutDescription = layoutDescription(for: .top)
        let bottomLayoutDescription = layoutDescription(for: .bottom)
        let leadingLayoutDescription = layoutDescription(for: .leading)
        let trailingLayoutDescription = layoutDescription(for: .trailing)
        layoutDescriptions.append(contentsOf: [topLayoutDescription, bottomLayoutDescription, leadingLayoutDescription, trailingLayoutDescription])
        return EdgesLayoutAttributeType(top: topLayoutDescription,
                                        bottom: bottomLayoutDescription,
                                        leading: leadingLayoutDescription,
                                        trailing: trailingLayoutDescription)
    }
    
    open var size: SizeLayoutAttributeType {
        let widthLayoutDescription = layoutDescription(for: .width)
        let heightLayoutDescription = layoutDescription(for: .height)
        layoutDescriptions.append(contentsOf: [widthLayoutDescription, heightLayoutDescription])
        return SizeLayoutAttributeType(width: widthLayoutDescription, height: heightLayoutDescription)
    }
    
    open var center: CenterLayoutAttributeType {
        let centerXLayoutDescription = layoutDescription(for: .centerX)
        let centerYLayoutDescription = layoutDescription(for: .centerY)
        return CenterLayoutAttributeType(centerX: centerXLayoutDescription, centerY: centerYLayoutDescription)
    }
}
