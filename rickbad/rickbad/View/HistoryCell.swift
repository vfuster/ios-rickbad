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
    
}
