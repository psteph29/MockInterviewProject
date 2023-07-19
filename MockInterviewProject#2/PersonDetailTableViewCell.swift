//
//  PersonDetailTableViewCell.swift
//  MockInterviewProject#2
//
//  Created by Paige Stephenson on 7/17/23.
//

import UIKit

class PersonDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    var person: Person?
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPerson(person: Person) {
        self.person = person
        genderLabel.text = person.gender ?? ""
        if let city = person.location?.city, let state = person.location?.state, let country = person.location?.country {
          locationLabel.text = "\(city), \(state), \(country)"
        } else {
          locationLabel.text = ""
        }
        nationalityLabel.text = person.nat ?? ""
        nameLabel.text = "\(person.name.first) \(person.name.last)"
      }


}









