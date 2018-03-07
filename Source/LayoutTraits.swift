//
// LayoutTraits.swift
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

import Foundation

public protocol VerticalAxisLayoutTraits {
    associatedtype VerticalAttributeType
    var top: VerticalAttributeType { get }
    var bottom: VerticalAttributeType { get }
    var centerY: VerticalAttributeType { get }
    var topMargin: VerticalAttributeType { get }
    var bottomMargin: VerticalAttributeType { get }
    var centerYWithinMargins: VerticalAttributeType { get }
}

public protocol VerticalAxisExtendedLayoutTraits: VerticalAxisLayoutTraits {
    var lastBaseline: VerticalAttributeType { get }
    var firstBaseline: VerticalAttributeType { get }
}

public protocol HorizontalAxisLayoutTraits {
    associatedtype HorizontalAttributeType
    var left: HorizontalAttributeType { get }
    var right: HorizontalAttributeType { get }
    var leading: HorizontalAttributeType { get }
    var trailing: HorizontalAttributeType { get }
    var centerX: HorizontalAttributeType { get }
    var leftMargin: HorizontalAttributeType { get }
    var rightMargin: HorizontalAttributeType { get }
    var leadingMargin: HorizontalAttributeType { get }
    var trailingMargin: HorizontalAttributeType { get }
    var centerXWithinMargins: HorizontalAttributeType { get }
}

public protocol DimensionLayoutTraits {
    associatedtype DimensionAttributeType
    var width: DimensionAttributeType { get }
    var height: DimensionAttributeType { get }
}

public protocol ExtendedLayoutTraits {
    associatedtype EdgesLayoutAttributeType
    associatedtype SizeLayoutAttributeType
    associatedtype CenterLayoutAttributeType
    var edges: EdgesLayoutAttributeType { get }
    var size: SizeLayoutAttributeType { get }
    var center: CenterLayoutAttributeType { get }
}
