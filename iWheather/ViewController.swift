//
//  ViewController.swift
//  iWheather
//
//  Created by Hung CIE on 8/5/17.
//  Copyright © 2017 Hung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var value: UIButton!
    
    @IBOutlet weak var donvi: UILabel!
    
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var lblDanhNgon: UILabel!
    
    @IBOutlet weak var uiImageBackgroud: UIImageView!
    var _f: Bool = false
    let locationArr: [String] = ["Hà nội", "Hải Phòng", "Đà Nẵng", "Nam Định","Kon Tum"]
    let danhNgonArr: [String] = ["Cuộc sống vốn không công bằng. Hãy tập quen dần với điều đó.",
                                 "Càng trưởng thành, bạn sẽ nhận ra rằng tranh luận đúng sai hơn thua với người khác đôi khi không còn quan trọng nữa. Quan trọng hơn cả là chỉ muốn bình yên.",
                                 "Cuộc sống không tặng cho ta thứ gì cả. Những gì cuộc sống đem lại cho ta đều đã được ghi giá một các kín đáo.",
                                 "Đừng ngại thay đổi. Bạn có thể mất một cái gì đó tốt nhưng bạn có thể đạt được một cái gì đó còn tốt hơn."]
    var images:[String] = ["Blood","Moon","Sun"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshSoft()
        
    }
    //MARK: return random number
    func randomNumber(max: Int) -> Int {
        let ranNumber: Int =  Int(arc4random_uniform(UInt32(max)))
        return ranNumber
    }
    func ConvertToFahranheit(celsius: Double) -> Double {
        let result = celsius * 9/5 + 32
        return result
    }
    func ConvertToCelsius(Fahranheit: Double) -> Double{
        let result: Double = Double(( Fahranheit - 32 ) / 1.800)
        return result
    }
    func refreshSoft() {
        let numLocation = randomNumber(max: locationArr.count)
        let numDanhNgon = randomNumber(max: danhNgonArr.count)
         let numbackground = randomNumber(max: images.count)
        
        self.location.text = locationArr[numLocation]
        self.lblDanhNgon.text = danhNgonArr[numDanhNgon]
        if _f == false {
            self.value.setTitle(String(randomNumber(max: 100)), for: .normal)
            self.donvi.text = "C"
        }else{
             self.value.setTitle(String(ConvertToFahranheit(celsius: Double(randomNumber(max: 100)))), for: .normal)
            self.donvi.text = "F"
        }
        self.uiImageBackgroud.image = UIImage(named: images[numbackground])!
        
    }
    
    @IBAction func touchUpInsideRefresh(_ sender: UIButton) {
        refreshSoft()
    }
    
    @IBAction func touchUpInsideButtonValue(_ sender: Any) {
        let valueCurrent: Double = Double(value.titleLabel!.text!)!
        if _f == false {
            _f = true
            self.donvi.text = "F"
            self.value.setTitle(String(ConvertToFahranheit(celsius:valueCurrent)), for: .normal)
        }else{
            _f = false
            self.donvi.text = "C"
             self.value.setTitle(String(ConvertToCelsius(Fahranheit: valueCurrent)), for: .normal)
        }
        //refreshSoft()
    }
    
}

