//
// CenterLayoutAttribute.swift
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

open class CenterLayoutAttribute: LayoutAttribute<LayoutOptionsForCenterConstraints, LayoutOptionsForCenterConstraints> {
    internal convenience init(centerX: LayoutDescription, centerY: LayoutDescription?) {
        self.init(layoutDescription: centerX)
        self.centerYDescription = centerY
    }
    internal weak var centerYDescription: LayoutDescription?
    
    public required init(layoutDescription: LayoutDescription) { super.init(layoutDescription: layoutDescription) }
    
    internal override func relation(_ relation: NSLayoutRelation, to view: UIView) -> LayoutOptionsForCenterConstraints {
        prepareLayoutDescription(layoutDescription, with: relation, to: LayoutDescription.Item(view: view))
        prepareLayoutDescription(centerYDescription, with: relation, to: LayoutDescription.Item(view: view))
        return LayoutOptionsForCenterConstraints(centerX: layoutDescription, centerY: centerYDescription)
    }
    
    @available(iOS 9.0, *)
    internal override func relation(_ relation: NSLayoutRelation, to layoutGuide: UILayoutGuide) -> LayoutOptionsForCenterConstraints {
        prepareLayoutDescription(layoutDescription, with: relation, to: LayoutDescription.Item(layoutGuide: layoutGuide))
        prepareLayoutDescription(centerYDescription, with: relation, to: LayoutDescription.Item(layoutGuide: layoutGuide))
        return LayoutOptionsForCenterConstraints(centerX: layoutDescription, centerY: centerYDescription)
    }
    
    internal func prepareLayoutDescription(_ layoutDescription: LayoutDescription?, with relation: NSLayoutRelation, to item: LayoutDescription.Item?) {
        layoutDescription?.relation = relation
        layoutDescription?.secondItem = item
        if let l = layoutDescription {
            l.secondAttribute = l.firstAttribute
        }
    }
}

open class CenterViewLayoutAttribute: CenterLayoutAttribute, LayoutAttributeRelatedToSuperView {
    public typealias RelationToSuperview = LayoutOptionsForCenterConstraints
    
    open var equalToSuperview: RelationToSuperview { return relation(.equal, to: layoutDescriptionItem(from: layoutDescription)) }
    open var lessThanOrEqualToSuperview: RelationToSuperview { return relation(.lessThanOrEqual, to: layoutDescriptionItem(from: layoutDescription)) }
    open var greaterThanOrEqualToSuperview: RelationToSuperview { return relation(.greaterThanOrEqual, to: layoutDescriptionItem(from: layoutDescription)) }
    
    internal func relation(_ relation: NSLayoutRelation, to item: LayoutDescription.Item?) -> LayoutOptionsForCenterConstraints {
        prepareLayoutDescription(layoutDescription, with: relation, to: item)
        prepareLayoutDescription(centerYDescription, with: relation, to: item)
        return LayoutOptionsForCenterConstraints(centerX: layoutDescription, centerY: centerYDescription)
    }
}
