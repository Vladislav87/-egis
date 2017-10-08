//
//  LoadFBVC.swift
//  Аegis
//
//  Created by Владислав Ходеев on 24.06.17.
//  Copyright © 2017 Владислав Ходеев. All rights reserved.
//

import UIKit

class LoadFBVC: UIViewController {
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fbURL = NSURL(string: "https://www.facebook.com/")
        let request = NSURLRequest(url: fbURL! as URL)
        webView.loadRequest(request as URLRequest)

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
