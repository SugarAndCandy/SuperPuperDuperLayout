//
// LayoutAttribute.swift
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

public protocol LayoutAttributeRelatedToSuperView {
    associatedtype RelationToSuperview
    var equalToSuperview: RelationToSuperview { get }
    var lessThanOrEqualSuperview: RelationToSuperview { get }
    var greaterThanOrEqualSuperview: RelationToSuperview { get }
}

public extension LayoutAttributeRelatedToSuperView where Self: EditableItem, RelationToSuperview: EditableItem {
    var equalToSuperview: RelationToSuperview { return relation(.equal, to: layoutDescriptionItem(from: layoutDescription)) }
    var lessThanOrEqualSuperview: RelationToSuperview { return relation(.lessThanOrEqual, to: layoutDescriptionItem(from: layoutDescription)) }
    var greaterThanOrEqualSuperview: RelationToSuperview { return relation(.greaterThanOrEqual, to: layoutDescriptionItem(from: layoutDescription)) }
    
    internal func layoutDescriptionItem(from layoutDescription: LayoutDescription?) -> LayoutDescription.Item? {
        if let view = layoutDescription?.firstItem.someItem as? UIView {
            return LayoutDescription.Item(view: view.superview)
        } else {
            guard #available(iOS 9.0, *) else { return nil }
            return LayoutDescription.Item(view: (layoutDescription?.firstItem.someItem as? UILayoutGuide)?.owningView)
        }
    }
    
    internal func relation(_ relation: NSLayoutRelation, to item: LayoutDescription.Item?) -> RelationToSuperview {
        layoutDescription.relation = relation
        layoutDescription.secondItem = item
        return RelationToSuperview(layoutDescription: layoutDescription)
    }
}

open class LayoutAttribute<RelationToView: EditableItem, RelationToLayoutGuide: EditableItem>: EditableItem {
    open func equal(to view: UIView) -> RelationToView {
        return relation(.equal, to: view)
    }
    
    open func lessThanOrEqual(to view: UIView) -> RelationToView {
        return relation(.lessThanOrEqual, to: view)
    }
    
    open func greaterThanOrEqual(to view: UIView) -> RelationToView {
        return relation(.greaterThanOrEqual, to: view)
    }
    
    internal func relation(_ relation: NSLayoutRelation, to view: UIView) -> RelationToView {
        layoutDescription.relation = relation
        layoutDescription.secondItem = LayoutDescription.Item(view: view)
        return RelationToView(layoutDescription: layoutDescription)
    }
    
    @available(iOS 9.0, *)
    open func equal(to layoutGuide: UILayoutGuide) -> RelationToLayoutGuide {
        return relation(.equal, to: layoutGuide)
    }
    
    @available(iOS 9.0, *)
    open func lessThanOrEqual(to layoutGuide: UILayoutGuide) -> RelationToLayoutGuide {
        return relation(.lessThanOrEqual, to: layoutGuide)
    }
    
    @available(iOS 9.0, *)
    open func greaterThanOrEqual(to layoutGuide: UILayoutGuide) -> RelationToLayoutGuide {
        return relation(.greaterThanOrEqual, to: layoutGuide)
    }
    
    @available(iOS 9.0, *)
    internal func relation(_ relation: NSLayoutRelation, to layoutGuide: UILayoutGuide) -> RelationToLayoutGuide {
        layoutDescription.relation = relation
        layoutDescription.secondItem = LayoutDescription.Item(layoutGuide: layoutGuide)
        return RelationToLayoutGuide(layoutDescription: layoutDescription)
    }
}
