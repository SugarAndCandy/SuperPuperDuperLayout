//
// RelatedElement.swift
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

open class RelatedElement: EditableItem {
    fileprivate func layoutOptionsForSingleConstraintProvider(with attribute: NSLayoutAttribute) -> LayoutOptionsForSingleConstraint {
        layoutDescription.secondAttribute = attribute
        return LayoutOptionsForSingleConstraint(layoutDescription: layoutDescription)
    }
}

open class VerticalRelatedElement: RelatedElement, VerticalAxisLayoutTraits {
    public typealias VerticalAttributeType = LayoutOptionsForSingleConstraint
    open var top: VerticalAttributeType                     { return layoutOptionsForSingleConstraintProvider(with: .top) }
    open var bottom: VerticalAttributeType                  { return layoutOptionsForSingleConstraintProvider(with: .bottom) }
    open var centerY: VerticalAttributeType                 { return layoutOptionsForSingleConstraintProvider(with: .centerY) }
    open var topMargin: VerticalAttributeType               { return layoutOptionsForSingleConstraintProvider(with: .topMargin) }
    open var bottomMargin: VerticalAttributeType            { return layoutOptionsForSingleConstraintProvider(with: .bottomMargin) }
    open var centerYWithinMargins: VerticalAttributeType    { return layoutOptionsForSingleConstraintProvider(with: .centerYWithinMargins) }
}

open class VerticalRelatedExtendedElement: VerticalRelatedElement, VerticalAxisExtendedLayoutTraits {
    open var lastBaseline: VerticalAttributeType { return layoutOptionsForSingleConstraintProvider(with: .lastBaseline) }
    open var firstBaseline: VerticalAttributeType { return layoutOptionsForSingleConstraintProvider(with: .firstBaseline) }
}

open class HorizontalRelatedElement: RelatedElement, HorizontalAxisLayoutTraits {
    public typealias HorizontalAttributeType = LayoutOptionsForSingleConstraint
    open var left: HorizontalAttributeType                  { return layoutOptionsForSingleConstraintProvider(with: .left) }
    open var right: HorizontalAttributeType                 { return layoutOptionsForSingleConstraintProvider(with: .right) }
    open var leading: HorizontalAttributeType               { return layoutOptionsForSingleConstraintProvider(with: .leading) }
    open var trailing: HorizontalAttributeType              { return layoutOptionsForSingleConstraintProvider(with: .trailing) }
    open var centerX: HorizontalAttributeType               { return layoutOptionsForSingleConstraintProvider(with: .centerX) }
    open var leftMargin: HorizontalAttributeType            { return layoutOptionsForSingleConstraintProvider(with: .leftMargin) }
    open var rightMargin: HorizontalAttributeType           { return layoutOptionsForSingleConstraintProvider(with: .rightMargin) }
    open var leadingMargin: HorizontalAttributeType         { return layoutOptionsForSingleConstraintProvider(with: .leadingMargin) }
    open var trailingMargin: HorizontalAttributeType        { return layoutOptionsForSingleConstraintProvider(with: .trailingMargin)  }
    open var centerXWithinMargins: HorizontalAttributeType  { return layoutOptionsForSingleConstraintProvider(with: .centerXWithinMargins) }
}

open class DimensionRelatedElement: RelatedElement, DimensionLayoutTraits {
    public typealias DimensionAttributeType = LayoutOptionsForSingleConstraint
    open var width: DimensionAttributeType      { return layoutOptionsForSingleConstraintProvider(with: .width) }
    open var height: DimensionAttributeType     { return layoutOptionsForSingleConstraintProvider(with: .height) }
}
