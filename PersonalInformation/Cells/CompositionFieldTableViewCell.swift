//
//  CompositionFieldTableViewCell.swift
//  PersonalInformation
//
//  Created by Ronaël Bajazet on 06/05/2021.
//

import UIKit

public final class CompositionFieldTableViewCell: UITableViewCell {

  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var textField: UITextField!

  public override func awakeFromNib() {
    super.awakeFromNib()
    label.textColor = .textBody
  }

  public override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

  public func configure(with title: String, value: String) {
    label.text = title
    textField.text = value
  }
}
