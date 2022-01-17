//
//  CommentCell.swift
//  MVC-N
//
//  Created by Александр Касьянов on 17.01.2022.
//

import UIKit

//класс для кастомной ячейки
class CommentCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    //заполняем view через модель Comment
    func configure(with comment: Comment) {
        self.label.text = comment.name
        self.textView.text = comment.body
    }
}
