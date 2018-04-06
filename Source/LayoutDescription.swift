//
// LayoutDescription.swift
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

open class LayoutDescription {
    public final class Item {
        public init(view: UIView?) { self.view = view }
        public weak var view: UIView?
        
        @available(iOS 9.0, *)
        public init(layoutGuide: UILayoutGuide?) { self.layoutGuide = layoutGuide }
        
        @available(iOS 9.0, *)
        public var layoutGuide: UILayoutGuide? {
            get { return _layoutGuide as? UILayoutGuide }
            set { _layoutGuide = newValue }
        }
        private var _layoutGuide: AnyObject?
        
        public var someItem: Any? {
            guard #available(iOS 9.0, *) else { return view }
            return view != nil ? view : layoutGuide
        }
    }
    
    public init(firstItem: LayoutDescription.Item, firstAttribute: NSLayoutAttribute) {
        self.firstItem = firstItem
        self.firstAttribute = firstAttribute
    }
    open var firstItem: LayoutDescription.Item
    open var firstAttribute: NSLayoutAttribute
    open var relation: NSLayoutRelation?
    open var secondItem: LayoutDescription.Item?
    open var secondAttribute = NSLayoutAttribute.notAnAttribute
    open var priority = UILayoutPriority.defaultHigh
    open var multiplier = Float(1)
    open var constant = CGFloat(0)
    
    open var nsLayoutConstraint: NSLayoutConstraint? {
        guard _nsLayoutConstraint == nil else { return _nsLayoutConstraint }
        guard let firstItem = firstItem.someItem else { return nil }
        guard firstAttribute != .notAnAttribute else { return nil }
        guard let relation = relation else { return nil }
        guard secondItem == nil || secondAttribute != .notAnAttribute else { return nil }
        if secondItem == nil { secondAttribute = firstAttribute }
        _nsLayoutConstraint = NSLayoutConstraint(item: firstItem,
                                                      attribute: firstAttribute,
                                                      relatedBy: relation,
                                                      toItem: secondItem?.someItem,
                                                      attribute: secondAttribute,
                                                      multiplier: CGFloat(multiplier),
                                                      constant: constant)
        _nsLayoutConstraint?.shouldBeArchived = true
        return _nsLayoutConstraint
    }
    
    /// Cached 'open var nsLayoutConstraint: NSLayoutConstraint?'
    private weak var _nsLayoutConstraint: NSLayoutConstraint?
}

open class EditableItem {
    public required init(layoutDescription: LayoutDescription) { self.layoutDescription = layoutDescription }
    internal unowned let layoutDescription: LayoutDescription
}
