//
//  TodayTableViewCell.swift
//  Today Extension
//
//  Created by Felipe Mendes on 11/01/19.
//  Copyright © 2019 Felipe Mendes. All rights reserved.
//

import UIKit

class TodayTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with event: Event) {
        cellTitle.text = localized("extension_title")
        eventTitle.text = event.title
        eventDate.text = event.price
    }

}
