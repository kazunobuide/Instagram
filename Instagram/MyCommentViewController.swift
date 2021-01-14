//
//  MyCommentViewController.swift
//  Instagram
//
//  Created by 井手　和宣 on 2021/01/13.
//  Copyright © 2021 kazunobu.ide. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class MyCommentViewController: UIViewController {
    var outputValue: PostData! = nil
    var postData: PostData!
    
    @IBOutlet weak var commentTextField: UITextField!
    @IBAction func commentButton(_ sender: Any) {
        print("コメント投稿ボタンが押されました")
        if let commentUserName = Auth.auth().currentUser?.displayName{
            var updateComment:FieldValue
            let comment = "\(commentUserName):\(self.commentTextField.text!)"
            updateComment = FieldValue.arrayUnion([comment])
            let postRef = Firestore.firestore().collection(Const.PostPath).document(outputValue.id)
            postRef.updateData(["comment":updateComment])
        }
        // 画面を閉じてタブ画面に戻る
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func commentCancelButton(_ sender: Any) {
        // 画面を閉じてタブ画面に戻る
        print("コメントをキャンセルしました")
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
