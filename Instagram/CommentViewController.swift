//
//  CommentViewController.swift
//  Instagram
//
//  Created by 福園康弘 on 2017/09/10.
//  Copyright © 2017年 yasuhiro.fukuzono. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class CommentViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var postData: PostData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        // キーボードを表示する
        textField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleCancelButton(_ sender: Any) {
        // キーボードを隠す
        textField.resignFirstResponder()
        // 画面を閉じる
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handlePostCommentButton(_ sender: Any) {
        
        // postDataに必要な情報を取得しておく
        let name = Auth.auth().currentUser?.displayName
        let comment = postData?.comment
       
        // 辞書を作成してFirebaseに保存する
        let postRef = Database.database().reference().child(Const.PostPath).child((postData?.id!)!)
        
        let changeComment = ["comment": "\(comment!)\n\(name!) : \(textField.text!)"]
        postRef.updateChildValues(changeComment)

        
        // キーボードを隠す
        textField.resignFirstResponder()
        // 画面を閉じる
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
