//
//  PostTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 13/09/2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let identifier = "postCell"
    
    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var postCollectionView: UICollectionView!
    
    //postContents include: image, title, detail, likeCounter, commentCounter
    var postContents = [
        ["image": "image1", "title": "Ở nhà đọc sách - muôn vàn thử thách", "detail": "Thử thách \"Mai này con kể ba nghe\" đang diễn ra rất tích cực và blah blah blah", "likeCounter": "0", "commentCounter": "0", "isLiked": "false"],
        ["image": "image2", "title": "Ở nhà đọc sách - muôn vàn thử thách", "detail": "Ở nhà đọc sách - muôn vàn thử thách", "likeCounter": "0", "commentCounter": "0", "isLiked": "false"],
        ["image": "image3", "title": "\"Lấp lánh lấp lánh\" - Món đồ trang trí xinh xắn cho căn phòng của bé", "detail": "\"Khung ảnh ký ức vui vẻ\" là một chương trình dành cho bé", "likeCounter": "0", "commentCounter": "0", "isLiked": "false"],
        ["image": "image1", "title": "\"Lấp lánh lấp lánh\" - Món đồ trang trí xinh xắn cho căn phòng của bé", "detail": "\"Khung ảnh ký ức vui vẻ\" là một chương trình dành cho bé", "likeCounter": "0", "commentCounter": "0", "isLiked": "false"],
        ["image": "image2", "title": "\"Lấp lánh lấp lánh\" - Món đồ trang trí xinh xắn cho căn phòng của bé", "detail": "\"Khung ảnh ký ức vui vẻ\" là một chương trình dành cho bé", "likeCounter": "0", "commentCounter": "0", "isLiked": "false"],
        ["image": "image3", "title": "\"Lấp lánh lấp lánh\" - Món đồ trang trí xinh xắn cho căn phòng của bé", "detail": "\"Khung ảnh ký ức vui vẻ\" là một chương trình dành cho bé", "likeCounter": "0", "commentCounter": "0", "isLiked": "false"]
    ]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        postCollectionView.register(PostCollectionViewCell.nib(), forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        postCollectionView.dataSource = self
        postCollectionView.delegate = self
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "PostTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// MARK: - Collection view data source
extension PostTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postContents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as! PostCollectionViewCell
        
        cell.cellImage.image = UIImage(named: postContents[indexPath.item]["image"]!)
        cell.cellTitle.text = postContents[indexPath.item]["title"]?.uppercased()
        cell.cellDetail.text = postContents[indexPath.item]["detail"]
        cell.buttonLikeCounter.text = postContents[indexPath.item]["likeCounter"]
        cell.cellCommentCounter.text = postContents[indexPath.item]["commentCounter"]
        cell.cellCommentLabel.text = "Bình luận"
        
        //Set up shadow and corner radius for view container
        cell.cellContentView.layer.cornerRadius = 10
        cell.cellContentView.layer.shadowColor = UIColor.gray.cgColor
        cell.cellContentView.layer.shadowOpacity = 0.5
        //cell.cellContentView.layer.shadowOffset = CGSize(
        
        //Set up like button
        cell.cellLikeButton.addTarget(self, action: #selector(likeButtonTapped(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    // MARK: - Like button is tapped function
    @objc func likeButtonTapped(sender: UIButton) {
        sender.isSelected = true

        if postContents[sender.tag]["isLiked"] == "false" {
            postContents[sender.tag]["isLiked"] = "true"

            //Convert from string to Int -> plus 1 -> convert from Int to String
            var tempCount = Int(postContents[sender.tag]["likeCounter"] ?? "0")!
            tempCount += 1
            postContents[sender.tag]["likeCounter"] = String(tempCount)

            //Set image to full heart with red color
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            sender.tintColor = UIColor.red
        } else {
            postContents[sender.tag]["isLiked"] = "false"

            //Convert from string to Int -> minus 1 -> convert from Int to String
            var tempCount = Int(postContents[sender.tag]["likeCounter"] ?? "0")!
            tempCount -= 1
            postContents[sender.tag]["likeCounter"] = String(tempCount)

            //Set image to empty heart with black color
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
            sender.tintColor = UIColor.black
        }

        postCollectionView.reloadData()

    }
    
    
}
// MARK: - Collection view delegate
extension PostTableViewCell: UICollectionViewDelegate {
    
}

// MARK: - Collection view delegate flow layout
extension PostTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
}
