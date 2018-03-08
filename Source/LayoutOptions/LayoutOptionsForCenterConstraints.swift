//
// LayoutOptionsForCenterConstraints.swift
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

open class LayoutOptionsForCenterConstraints: LayoutOptions, LayoutOptionsEditableValueProtocol {
    public typealias ValueType = UIOffset
    internal convenience init(centerX: LayoutDescription, centerY: LayoutDescription?) {
        self.init(layoutDescription: centerX)
        self.centerYDescription = centerY
    }
    internal weak var centerYDescription: LayoutDescription?
    
    public required init(layoutDescription: LayoutDescription) { super.init(layoutDescription: layoutDescription) }
    
    @discardableResult
    open func value(_ value: ValueType) -> Self {
        layoutDescription.constant = value.horizontal
        centerYDescription?.constant = value.vertical
        return self
    }
    
    @discardableResult
    open override func priority(_ priority: UILayoutPriority) -> Self {
        super.priority(priority)
        centerYDescription?.priority = priority
        return self
    }
    
    @discardableResult
    open override func multiplier(_ m: Multiplier) -> Self {
        return multiplier(m.rawValue)
    }
    
    @discardableResult
    open override func multiplier(_ m: Float) -> Self {
        super.multiplier(m)
        centerYDescription?.multiplier = m
        return self
    }
    
    open var nsCenterXLayoutConstraint: NSLayoutConstraint? { return layoutDescription.nsLayoutConstraint }
    open var nsCenterYLayoutConstraint: NSLayoutConstraint? { return centerYDescription?.nsLayoutConstraint }
}
