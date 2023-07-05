//
//  RSSFeedTVCell.swift
//  DemoApp
//
//  Created by Ankit Verma on 30/06/23.
//

import UIKit

class RSSFeedTVCell: UITableViewCell {
    // MARK: - IB Outlets
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblDate: UILabel!
    @IBOutlet private weak var lblDescription: UILabel!
    
    // MARK: - View Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Functions
    func configure(with newsItem: NewsFeed) {
        lblTitle.text = newsItem.title
        lblDate.text = displayDate(date: newsItem.pubDate)
        lblDescription.text = newsItem.description
    }
    
    private func displayDate(date: Date) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy HH:mm"
        return dateFormatter.string(from:date)
    }
}
