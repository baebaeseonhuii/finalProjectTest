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
    
   // @IBOutlet weak var calendarScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "주기 설정"
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        let numPages = 3
        scrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(numPages), height: self.view.bounds.height)
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        self.view.addSubview(scrollView)
        
        
        //MARK:- Page 1
        let page1View = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        page1View.backgroundColor = .systemIndigo
        scrollView.addSubview(page1View)
        button.setImage(mic, for: .normal)
        view.addSubview(button)
        button.frame = CGRect(x: 100, y: 250, width: 200, height: 350)
        
        //MARK:- Page 2
        let page2View = UIView(frame: CGRect(x: self.view.bounds.width, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        page2View.backgroundColor = .systemYellow
        scrollView.addSubview(page2View)
        
        //MARK:- Page 3
        let page3View = UIView(frame: CGRect(x: self.view.bounds.width * 2, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        page3View.backgroundColor = .systemOrange
        scrollView.addSubview(page3View)

    }
}
