//
// ViewController.swift
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
import SuperPuperDuperLayout

extension CGSize {
    init(square: CGFloat) { self.init(width: square, height: square) }
}

class ViewController: UIViewController {
    
    //MARK: - Appearance
    
    private struct Appearance {
        let avatarSize = CGSize(square: 50)
    }
    private let appearance = Appearance()
    
    
    //MARK: - Views
    
    private lazy var avatarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.layer.cornerRadius = appearance.avatarSize.width / 2
        return view
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        hierarchy()
        layout()
    }
    
    //MARK: - Hierarchy
    
    private func hierarchy() {
        view.addSubview(avatarView)
    }
    
    //MARK: - Layout
    
    private func layout() {
        Layout.to(view: avatarView) {
            $0.size.equal.value(appearance.avatarSize)
            $0.center.equalToSuperview.value(.init(horizontal: 0, vertical: 0))
        }
    }
}