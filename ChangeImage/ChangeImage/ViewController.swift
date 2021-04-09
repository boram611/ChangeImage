//
//  ViewController.swift
//  ChangeImage
//
//  Created by on 2021/04/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    // 이미지 선언
    var numImage = 0
    var imgName = ["img1.png","img2.png","img3.png"]
    
    //시간
    let interval = 3.0 // 3초
    let timeSelector: Selector = #selector(ViewController.updateTime)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        displayImage(number: numImage)
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    
    func displayImage(number : Int)  {
        imgView.image = UIImage(named: imgName[number])
    }

    // Async Task 3초마다 이미지 변경
    @objc func updateTime(){
        if Int(interval) % 3 == 0 {
            numImage += 1
            if numImage >= imgName.count{
            numImage = 0
        }
        
        displayImage(number: numImage)
        print(numImage)
        }
    }
}

