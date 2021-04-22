//
//  ViewController.swift
//  FinalProject
//
//  Created by Sun hee Bae on 2021/03/21.
//

import UIKit

class IntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("test")
    }

    override func viewDidAppear(_ animated: Bool) {
        let vc = self.storyboard?.instantiateViewController(identifier: "mainVC")
        vc!.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: false, completion: nil)
    }

}

