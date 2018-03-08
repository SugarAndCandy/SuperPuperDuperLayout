//
// SizeLayoutAttribute.swift
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

open class SizeLayoutAttribute: LayoutAttribute<LayoutOptionsForConstraintsOfSize, LayoutOptionsForConstraintsOfSize> {
    internal convenience init(width: LayoutDescription, height: LayoutDescription?) {
        self.init(layoutDescription: width)
        self.heightDescription = height
    }
    internal weak var heightDescription: LayoutDescription?
    
    public required init(layoutDescription: LayoutDescription) { super.init(layoutDescription: layoutDescription) }
    
    internal override func relation(_ relation: NSLayoutRelation, to view: UIView) -> LayoutOptionsForConstraintsOfSize {
        let options = super.relation(relation, to: view)
        options.heightDescription = heightDescription
        options.heightDescription?.relation = relation
        options.heightDescription?.secondItem = LayoutDescription.Item(view: view)
        return options
    }
    
    @available(iOS 9.0, *)
    internal override func relation(_ relation: NSLayoutRelation, to layoutGuide: UILayoutGuide) -> LayoutOptionsForConstraintsOfSize {
        let options = super.relation(relation, to: layoutGuide)
        options.heightDescription = heightDescription
        options.heightDescription?.relation = relation
        options.heightDescription?.secondItem = LayoutDescription.Item(layoutGuide: layoutGuide)
        return options
    }
    
    open var equal: LayoutOptionsForConstraintsOfSize {
        return optionsForConstraintsOfSize(for: .equal)
    }
    
    open var lessThanOrEqual: LayoutOptionsForConstraintsOfSize {
        return optionsForConstraintsOfSize(for: .lessThanOrEqual)
    }
    
    open var greaterThanOrEqual: LayoutOptionsForConstraintsOfSize {
        return optionsForConstraintsOfSize(for: .greaterThanOrEqual)
    }
    
    internal func optionsForConstraintsOfSize(for relation: NSLayoutRelation, to item: LayoutDescription.Item) -> LayoutOptionsForConstraintsOfSize {
        layoutDescription.secondItem = item
        heightDescription?.secondItem = item
        return optionsForConstraintsOfSize(for: relation)
    }
    
    internal func optionsForConstraintsOfSize(for relation: NSLayoutRelation) -> LayoutOptionsForConstraintsOfSize {
        layoutDescription.relation = relation
        heightDescription?.relation = relation
        return LayoutOptionsForConstraintsOfSize(width: layoutDescription, height: heightDescription)
    }
}

open class SizeViewLayoutAttribute: SizeLayoutAttribute, LayoutAttributeRelatedToSuperView {
    public typealias RelationToSuperview = LayoutOptionsForConstraintsOfSize
    
    open var equalToSuperview: RelationToSuperview { return relation(.equal, to: layoutDescriptionItem(from: layoutDescription)) }
    open var lessThanOrEqualToSuperview: RelationToSuperview { return relation(.lessThanOrEqual, to: layoutDescriptionItem(from: layoutDescription)) }
    open var greaterThanOrEqualToSuperview: RelationToSuperview { return relation(.greaterThanOrEqual, to: layoutDescriptionItem(from: layoutDescription)) }
    
    internal func relation(_ relation: NSLayoutRelation, to item: LayoutDescription.Item?) -> LayoutOptionsForConstraintsOfSize {
        layoutDescription.relation = relation
        layoutDescription.secondItem = item
        heightDescription?.relation = relation
        heightDescription?.secondItem = item
        return LayoutOptionsForConstraintsOfSize(layoutDescription: layoutDescription)
    }
}
