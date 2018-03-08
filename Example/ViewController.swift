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

class ViewController: UIViewController {
    
    //MARK: - Appearance
    
    private struct Appearance {
        let cornerRadius = CGFloat(8)
        let photoHeight = CGFloat(70)
        let offsetBetweenGeneralElements = CGFloat(20)
        let offsetBetweenTitleLines = CGFloat(5)
        let titleLineHeight = CGFloat(40)
        let descriptionLineHeight = CGFloat(320)
        let margins = UIEdgeInsets(top: 10, left: 15, bottom: -10, right: -15)
    }
    private let appearance = Appearance()
    
    
    //MARK: - Views
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var photoView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = appearance.cornerRadius
        return view
    }()
    
    private lazy var titleFirstLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = appearance.cornerRadius
        return view
    }()
    
    private lazy var titleSecondLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = appearance.cornerRadius
        return view
    }()
    
    private lazy var titleThirdLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = appearance.cornerRadius
        return view
    }()
    
    private lazy var descriptionView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = appearance.cornerRadius
        return view
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "SuperPuperDuperLayout"
        hierarchy()
        layout()
    }
    
    //MARK: - Hierarchy
    
    private func hierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(photoView)
        contentView.addSubview(titleFirstLineView)
        contentView.addSubview(titleSecondLineView)
        contentView.addSubview(titleThirdLineView)
        contentView.addSubview(titleThirdLineView)
        contentView.addSubview(descriptionView)
    }
    
    //MARK: - Layout
    
    private func layout() {
        Layout.to(scrollView) {
            if #available(iOS 11.0, *) {
                $0.edges.equal(to: view.safeAreaLayoutGuide).value(.zero)
            } else {
                $0.edges.equalToSuperview.value(.zero)
            }
        }
        Layout.to(contentView) {
            $0.edges.equalToSuperview.value(appearance.margins)
            $0.centerX.equalToSuperview.centerX.value(0)
        }
        Layout.to(photoView) {
            $0.top.equalToSuperview.top.value(0)
            $0.leading.equalToSuperview.leading.value(0)
            $0.trailing.equalToSuperview.trailing.value(0)
            $0.height.equal.value(appearance.photoHeight)
        }
        Layout.to(titleFirstLineView) {
            $0.top.equal(to: photoView).bottom.value(appearance.offsetBetweenGeneralElements)
            $0.leading.equalToSuperview.leading.value(0)
            $0.trailing.equalToSuperview.trailing.value(0)
            $0.height.equal.value(appearance.titleLineHeight)
        }
        Layout.to(titleSecondLineView) {
            $0.top.equal(to: titleFirstLineView).bottom.value(appearance.offsetBetweenTitleLines)
            $0.leading.equalToSuperview.leading.value(0)
            $0.trailing.equalToSuperview.trailing.value(0)
            $0.height.equal.value(appearance.titleLineHeight)
        }
        Layout.to(titleThirdLineView) {
            $0.top.equal(to: titleSecondLineView).bottom.value(appearance.offsetBetweenTitleLines)
            $0.leading.equalToSuperview.leading.value(0)
            $0.trailing.equalToSuperview.trailing.value(0)
            $0.height.equal.value(appearance.titleLineHeight)
        }
        Layout.to(descriptionView) {
            $0.top.equal(to: titleThirdLineView).bottom.value(appearance.offsetBetweenGeneralElements)
            $0.bottom.equalToSuperview.bottom.value(0)
            $0.leading.equalToSuperview.leading.value(0)
            $0.trailing.equalToSuperview.trailing.value(0)
            $0.height.equal.value(appearance.descriptionLineHeight)
        }
    }
}
