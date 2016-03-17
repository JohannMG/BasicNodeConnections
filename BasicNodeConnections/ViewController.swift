//
//  ViewController.swift
//  BasicNodeConnections
//
//  Created by Johann Garces on 3/16/16.
//  Copyright © 2016 johannmg. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let standardNodeViewSize = CGSize(width: 200, height: 100)
    let backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1.00)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //setup color
        view.backgroundColor = backgroundColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addNodeButton(sender: UIButton) {
        
        let newNode = getNewNodeView()
        newNode.frame = CGRect(origin: CGPoint(x: 50.5, y: 50.5), size: standardNodeViewSize)
        view.addSubview(newNode)
        
    }
    
    func getNewNodeView() -> NodeView {
        let newView = UINib(nibName: "NodeView", bundle: NSBundle.mainBundle()).instantiateWithOwner(self, options: nil)[0] as! NodeView
        return newView
    }
}

