//
//  ViewController.swift
//  SampleStore
//
//  Created by Renusa Andra on 1/26/16.
//  Copyright © 2016 Renusa Andra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!

    @IBAction func processGetToken(sender: UIButton) {
        VTConfig.setCLIENT_KEY("VT-client-3YUXFj6X0XBpeDgf");
        VTConfig.setVT_IsProduction(false);
        
        let cardDetails = VTCardDetails()
        cardDetails.card_number = "4811111111111114"
        cardDetails.card_cvv = "123"
        cardDetails.card_exp_month = 1
        cardDetails.card_exp_year = 2020
        cardDetails.secure = false
        
        let vtDirect = VTDirect()
        vtDirect.card_details = cardDetails
        vtDirect.getToken {(vtToken, exception) -> Void in
            if let token = vtToken {
                self.messageLabel.text = token.token_id
            }
        }
    }

}

