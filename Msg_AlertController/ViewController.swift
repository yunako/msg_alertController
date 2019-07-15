//
//  ViewController.swift
//  Msg_AlertController
//
//  Created by YUNA KO on 15/07/2019.
//  Copyright © 2019 YUNAKO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var result: UILabel!
    @IBAction func alert(_ sender: Any) {
        
        //컨트롤러 초기화
        let alert = UIAlertController(title:"선택",message:"항목을 선택해주세요",preferredStyle: .actionSheet)
        //확인버튼
        let ok = UIAlertAction(title:"확인",style:.default){
            (_) in
            self.result.text = "확인버튼을 클릭했습니다."
        }
        //취소버튼
        let cancel = UIAlertAction(title:"취소",style:.cancel){
            (_) in
            self.result.text = "취소버튼을 클릭했습니다."
        }
        //실행버튼
        let exec = UIAlertAction(title:"실행", style:.destructive){
            (_) in
            self.result.text = "실행버튼을 클릭했습니다."
        }
        //중지 버튼
        let stop = UIAlertAction(title:"중지",style:.default){
            (_) in
            self.result.text = "중지버튼을 클릭했습니다."
        }
        //버튼을 컨트롤러에 등록
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
        
        
        //메시지 창 실행
        self.present(alert, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

