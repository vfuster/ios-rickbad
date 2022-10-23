//
//  HistoryCell.swift
//  rickbad
//
//  Created by Valeria Fuster on 19/10/22.
//

import UIKit

class HistoryCell: UITableViewCell {

    @IBOutlet weak var winnerImage: UIImageView!
    @IBOutlet weak var winnerName: UILabel!
    @IBOutlet weak var winnerDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell() {
        winnerImage.layer.cornerRadius = 15
        winnerImage.layer.borderColor = CGColor(red: 139/255, green: 207/255, blue: 33/255, alpha: 1)
        winnerImage.layer.borderWidth = 1.5
        
        winnerName.textColor = UIColor.white
        winnerDate.textColor = UIColor(red: 148/255, green: 144/255, blue: 144/255, alpha: 1)
    }
}
