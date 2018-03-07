//
// EdgesLayoutAttribute.swift
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

open class EdgesLayoutAttribute: LayoutAttribute<LayoutOptionsForConstraintsOfEdges, LayoutOptionsForConstraintsOfEdges> {
    internal convenience init(top: LayoutDescription, bottom: LayoutDescription?, leading: LayoutDescription?, trailing: LayoutDescription?) {
        self.init(layoutDescription: top)
        self.bottom = bottom
        self.leading = leading
        self.trailing = trailing
    }
    internal weak var bottom: LayoutDescription?
    internal weak var leading: LayoutDescription?
    internal weak var trailing: LayoutDescription?
    
    public required init(layoutDescription: LayoutDescription) { super.init(layoutDescription: layoutDescription) }
    
    internal override func relation(_ relation: NSLayoutRelation, to view: UIView) -> LayoutOptionsForConstraintsOfEdges {
        prepareLayoutDescription(layoutDescription, with: relation, to: LayoutDescription.Item(view: view))
        prepareLayoutDescription(bottom, with: relation, to: LayoutDescription.Item(view: view))
        prepareLayoutDescription(leading, with: relation, to: LayoutDescription.Item(view: view))
        prepareLayoutDescription(trailing, with: relation, to: LayoutDescription.Item(view: view))
        return LayoutOptionsForConstraintsOfEdges(top: layoutDescription, bottom: bottom, leading: leading, trailing: trailing)
    }
    
    @available(iOS 9.0, *)
    internal override func relation(_ relation: NSLayoutRelation, to layoutGuide: UILayoutGuide) -> LayoutOptionsForConstraintsOfEdges {
        prepareLayoutDescription(layoutDescription, with: relation, to: LayoutDescription.Item(layoutGuide: layoutGuide))
        prepareLayoutDescription(bottom, with: relation, to: LayoutDescription.Item(layoutGuide: layoutGuide))
        prepareLayoutDescription(leading, with: relation, to: LayoutDescription.Item(layoutGuide: layoutGuide))
        prepareLayoutDescription(trailing, with: relation, to: LayoutDescription.Item(layoutGuide: layoutGuide))
        return LayoutOptionsForConstraintsOfEdges(top: layoutDescription, bottom: bottom, leading: leading, trailing: trailing)
    }
    
    internal func prepareLayoutDescription(_ layoutDescription: LayoutDescription?, with relation: NSLayoutRelation, to item: LayoutDescription.Item?) {
        layoutDescription?.relation = relation
        layoutDescription?.secondItem = item
        if let l = layoutDescription {
            l.secondAttribute = l.firstAttribute
        }
    }
}

open class EdgesViewLayoutAttribute: EdgesLayoutAttribute, LayoutAttributeRelatedToSuperView {
    public typealias RelationToSuperview = LayoutOptionsForConstraintsOfEdges
    
    open var equalToSuperview: RelationToSuperview { return relation(.equal, to: layoutDescriptionItem(from: layoutDescription)) }
    open var lessThanOrEqualSuperview: RelationToSuperview { return relation(.lessThanOrEqual, to: layoutDescriptionItem(from: layoutDescription)) }
    open var greaterThanOrEqualSuperview: RelationToSuperview { return relation(.greaterThanOrEqual, to: layoutDescriptionItem(from: layoutDescription)) }
    
    internal func relation(_ relation: NSLayoutRelation, to item: LayoutDescription.Item?) -> LayoutOptionsForConstraintsOfEdges {
        prepareLayoutDescription(layoutDescription, with: relation, to: item)
        prepareLayoutDescription(bottom, with: relation, to: item)
        prepareLayoutDescription(leading, with: relation, to: item)
        prepareLayoutDescription(trailing, with: relation, to: item)
        return LayoutOptionsForConstraintsOfEdges(top: layoutDescription, bottom: bottom, leading: leading, trailing: trailing)
    }
}
