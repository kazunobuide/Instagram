//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by 井手　和宣 on 2021/01/12.
//  Copyright © 2021 kazunobu.ide. All rights reserved.
//

import UIKit
import FirebaseUI
import FirebaseUI
import SVProgressHUD
import SDWebImage

class PostTableViewCell: UITableViewCell,UITextFieldDelegate {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    //（課題）
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var createCommentButton: UIButton!
    
    
    /*@IBAction func createMyCommentButton(_ sender: Any) {
        print("DEBUG_PRINT: ボタンが押されましたよPostTableViewCell")
        // コメント入力画面に遷移する
        performSegue(withIdentifier: "MyComment", sender: nil)
    }*/
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // PostDataの内容をセルに表示
    func setPostData(_ postData: PostData) {
        // 画像の表示
        postImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        let imageRef = Storage.storage().reference().child(Const.ImagePath).child(postData.id + ".jpg")
        postImageView.sd_setImage(with: imageRef)

        // キャプションの表示
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        
        //（課題）コメントの表示
        var commentString: String = ""
           let comment: [String] = postData.comment
        commentString = comment.joined(separator: "\n")
        for  comment in postData.comment{
            commentString = comment
            self.commentLabel.text = commentString
        }
        // 日時の表示
        self.dateLabel.text = ""
        if let date = postData.date {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateString = formatter.string(from: date)
            self.dateLabel.text = dateString
        }

        // いいね数の表示
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"

        // いいねボタンの表示
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
    }
    
}
