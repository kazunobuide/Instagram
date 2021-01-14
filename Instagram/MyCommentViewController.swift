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
    var postData: PostData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var sendingButton: UIButton!
    
    
    
    
    @IBAction func handleSendingButton(_ sender: Any) {
        let postRef = Firestore.firestore().collection(Const.PostPath).document(outputValue.id)
        postRef.updateData(["comment": self.commentTextField.text as Any])
        self.dismiss(animated: true, completion: nil)
        print("DEBUG_PRINT: 投稿ボタンがタップされました。")
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
