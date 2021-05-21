//
//  InsideCalendarViewController.swift
//  FinalProject
//
//  Created by Sun hee Bae on 2021/05/04.
//

import UIKit
import Speech
import AVFoundation

class InsideCalendarViewController: UIViewController {
    let button = UIButton()
    let mic: UIImage = UIImage(named: "mic")!
   
    lazy var view0: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        let label = UILabel()
        label.text = "시작"
        label.textAlignment = .center
        view.addSubview(label)
        label.edgeTo(view: view)
        button.setImage(mic, for: .normal)
        view.addSubview(button)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 350)
        return view
    }()
    
    lazy var view1: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        let label = UILabel()
        label.text = "기간"
        label.textAlignment = .center
        view.addSubview(label)
        label.edgeTo(view: view)
        return view
    }()
    
    lazy var view2: UIView = {
        let view = UIView()
        view.backgroundColor = .systemIndigo
        let label = UILabel()
        label.text = "주기"
        label.textAlignment = .center
        view.addSubview(label)
        label.edgeTo(view: view)
        return view
    }()
    
    lazy var view3: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPurple
        let label = UILabel()
        label.text = "예정일 결과"
        label.textAlignment = .center
        view.addSubview(label)
        label.edgeTo(view: view)
        return view
    }()
    
    lazy var views = [view0, view1, view2, view3]
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        //scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: view.frame.height)
        
        for i in 0 ..< views.count {
            scrollView.addSubview(views[i])
            views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
        }
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = views.count
        pageControl.addTarget(self, action: #selector(pageControlTapHandler(sender:)), for: .touchUpInside)
        return pageControl
    }()
    
    @objc func pageControlTapHandler(sender: UIPageControl) {
        scrollView.scrollTo(horizontalPage: sender.currentPage, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "주기 설정"
        
        view.addSubview(scrollView)
        scrollView.edgeTo(view: view)
        
        view.addSubview(pageControl)
        pageControl.pinTo(view)
        
    }
}


extension InsideCalendarViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}

public extension UILabel {
    func edgeTo(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

public extension UIView {
    func pinTo(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12).isActive = true
    }
}


public extension UIScrollView {
    func edgeTo(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension UIScrollView {
    func scrollTo(horizontalPage: Int? = 0, verticalPage: Int? = 0, animated: Bool? = true) {
        var frame: CGRect = self.frame
        frame.origin.x = frame.size.width * CGFloat(horizontalPage ?? 0)
        frame.origin.y = frame.size.width * CGFloat(verticalPage ?? 0)
        self.scrollRectToVisible(frame, animated: animated ?? true)
    }
}
