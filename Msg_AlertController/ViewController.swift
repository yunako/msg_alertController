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
    @IBAction func login(_ sender: Any) {
        let title = "iTunes Store에 로그인"
        let message = "사용자의 Apple ID sqlpro@naver.com의 암호를 입력하십시오"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default){
            (_) in
            //확인버튼을 클릭했을 때 처리할 내용
            if let tf = alert.textFields?[0]{
                print("입력된 값은 \(tf.text!)입니다")
            }else {
                print("입력된 값이 없습니다.")
            }
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        
        //텍스트 필드 추가
        alert.addTextField(configurationHandler: { (tf) in
            //텍스트필드의 속성결정
            tf.placeholder = "암호" //안내 메세지
            tf.isSecureTextEntry = true//비밀번호 처리
        })
        //텍스트 필드 추가
        alert.addTextField()
        
        self.present(alert, animated:false)
        
    }
    
    @IBAction func auth(_ sender: Any) {
        
        let msg = "로그인"
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default){
            (_) in
            //확인 버튼을 클릭했을 때 처리할 내용
            let loginId = alert.textFields?[0].text
            let loginPw = alert.textFields?[1].text
            
            if loginId == "sqlpro" && loginPw == "1234" {
                self.result.text = "인증되었습니다."
                
            }else{
                self.result.text = "인증에 실패하였습니다."
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        //텍스트 필드 추가 - 아이디
        alert.addTextField(configurationHandler: { (tf) in
            //텍스트필드의 속성설정
            tf.placeholder = "아이디" //안내 메시지
            tf.isSecureTextEntry = false //비밀번호 처리 안함
            
        })
        //텍스트 필드 추가 - 비밀번호
        alert.addTextField(configurationHandler: { (tf) in
            //텍스트필드의 속성설정
            tf.placeholder = "비밀번호" //안내 메시지
            tf.isSecureTextEntry = true //비밀번호 처리 안함
            
        })
        
        //클로저의 다양한 표현식
        //원형
        alert.addTextField(configurationHandler: {
            (textfield: UITextField) in
            textfield.placeholder = "비밀번호"
            textfield.isSecureTextEntry = true
            
            })
        //변형 1 트레일링 클로저 문법
        alert.addTextField(){
            (textfield : UITextField) in
            textfield.placeholder = "비밀번호"
            textfield.isSecureTextEntry = true
        }
        //변형 2 클로저 인자값의 타입 생략
        alert.addTextField(){
            (tf) in
            tf.placeholder = "비밀번호"
            tf.isSecureTextEntry = true
        }
        //변형 1 클로저 인자값 생략
        alert.addTextField(){
            $0.placeholder = "비밀번호"
            $0.isSecureTextEntry = true
        }
        
        self.present(alert, animated:false)
    }
    
}

