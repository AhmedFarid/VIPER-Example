//
//  UserDetailsViewController.swift
//  VIPERExample
//
//  Created by Macintosh on 11/09/2022.
//

import UIKit

class UserDetailsViewController: UIViewController {
  
  var presenter: UserDetailsPresenterProtocol!

  @IBOutlet weak var userNameLB: UILabel!
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UserDetailsViewController: UserDetailsViewProtocol {

  
   
  func showLoadingIndicator() {
    print("loading")
  }
  
  func hideLoadingIndicator() {
    print("stop")
  }
  
  func udateView() {
    
  }
}
