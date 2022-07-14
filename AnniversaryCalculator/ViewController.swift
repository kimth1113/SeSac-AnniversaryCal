//
//  ViewController.swift
//  AnniversaryCalculator
//
//  Created by 김태현 on 2022/07/14.
//

import UIKit
import Lottie

enum Anniversary: String {
    case day100 = "D+100"
    case day200 = "D+200"
    case day300 = "D+300"
    case day400 = "D+400"
}

class ViewController: UIViewController {

    // 스토리보드 편집 후 반드시 레이어 최상단에 위치하기 (편집 시, 최하단 위치)
    @IBOutlet weak var launchView: UIView!
    
    @IBOutlet var anniversaryImgs: [UIImageView]!
    @IBOutlet var anniversaryViews: [UIView]!
    
    @IBOutlet var dayLabelList: [UILabel]!
    
    @IBOutlet weak var dateDay100: UILabel!
    @IBOutlet weak var dateDay200: UILabel!
    @IBOutlet weak var dateDay300: UILabel!
    @IBOutlet weak var dateDay400: UILabel!
    
    
    
    let animationView: AnimationView = AnimationView(name: "87689-stream-of-hearts")
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        launchView.backgroundColor = .black
        launchView.addSubview(animationView)
        animationView.center = view.center
        
        animationView.play { _ in
            self.animationView.removeFromSuperview()
            self.launchView.isHidden = true
        }
        
        designAnniversaryImgs()
        designDayLabelList()
        designDateDays()
    }

    
    func designAnniversaryImgs() {
        let imgList = ["icecream", "macarons", "doughnut", "cake"]
        
        for i in 0..<anniversaryImgs.count {
            anniversaryImgs[i].image = UIImage(named: imgList[i])
            anniversaryImgs[i].contentMode = .scaleAspectFill
            anniversaryViews[i].layer.cornerRadius = 15
            anniversaryViews[i].clipsToBounds = true
        }
    }
    
    func designDayLabelList() {
        for i in 0..<dayLabelList.count {
            dayLabelList[i].text = "D+\(i+1)00"
            dayLabelList[i].textColor = .white
            dayLabelList[i].font = UIFont.boldSystemFont(ofSize: 20)
        }
        
        
    }
    
    func designDateDays() {
        let dateDayList = [dateDay100, dateDay200, dateDay300, dateDay400]
        
        for i in 0..<dateDayList.count {
            dateDayList[i]?.text = "미입력"
            dateDayList[i]?.textColor = .white
            dateDayList[i]?.font = UIFont.systemFont(ofSize: 20)
            dateDayList[i]?.numberOfLines = 2
            //날짜 선택 시 false로 변경
            dateDayList[i]?.isHidden = true
        }
    }
    
    
}

