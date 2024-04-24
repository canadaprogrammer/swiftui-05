//
//  ViewController.swift
//  SwiftUItoUIKit
//
//  Created by Jungjin Park on 2024-04-24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBSegueAction func goToSwiftUI(_ coder: NSCoder) -> UIViewController? {
        let greetings = "Hello From UIKit"
        let rootView = Greetings(textFromUIKit: greetings)
        return UIHostingController(coder: coder, rootView: rootView)
    }
    
    
}

