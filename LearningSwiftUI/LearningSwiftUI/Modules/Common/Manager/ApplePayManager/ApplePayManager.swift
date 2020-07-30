//
//  ApplePayManager.swift
//  LearningSwiftUI
//
//  Created by Deepak Kumar on 03/07/20.
//  Copyright © 2020 macadmin. All rights reserved.
//

import PassKit

final class ApplePayManager: NSObject {
    // MARK: - PROPERTIES
    var countryCode: String
    var currencyCode: String
    private lazy var billingContact: PKContact = {
        let contact: PKContact = PKContact()
        contact.emailAddress = nil
        contact.name = nil
        contact.phoneNumber = nil
        let postalAdress: CNMutablePostalAddress = CNMutablePostalAddress()
        postalAdress.postalCode = ""
        postalAdress.city = ""
        postalAdress.country = ""
        postalAdress.state = ""
        postalAdress.street = ""
        postalAdress.subAdministrativeArea = ""
        postalAdress.subLocality = ""
        
        contact.postalAddress = postalAdress
        
        return contact
    }()
    
    private lazy var paymentRequest: PKPaymentRequest = {
        let request: PKPaymentRequest = PKPaymentRequest()
        request.billingContact = billingContact
        request.countryCode = countryCode //"IN", "US"
        request.currencyCode = currencyCode //"INR", "USD"
        request.merchantCapabilities = .capability3DS//PKMerchantCapability([.capability3DS, .capabilityCredit, .capabilityDebit, .capabilityEMV])
        request.merchantIdentifier = ""
        request.paymentSummaryItems = [.init(label: "iPhone X 64GB", amount: 120000)]
        request.requiredBillingContactFields = [.emailAddress, .name, .phoneNumber, .postalAddress]
        request.requiredShippingContactFields = [.emailAddress, .name, .phoneNumber, .postalAddress]
        request.shippingContact = billingContact
        request.shippingMethods = [.init(label: "iPhone X 64GB", amount: 120000)]
        request.shippingType = .delivery
        request.supportedCountries = ["IN", "US"]
        request.supportedNetworks = [.maestro, .masterCard, .quicPay, .visa, .vPay]

        return request
    }()
    
    var btnApplePay: PKPaymentButton = {
        let btn: PKPaymentButton = PKPaymentButton(paymentButtonType: .buy, paymentButtonStyle: .black)
        btn.cornerRadius = 10
        //btn.addTarget(self, action: #selector(buyBtnTapped), for: .touchUpInside)
        return btn
    }()
    
    func buyBtnTapped() {
        guard let paymentVC = PKPaymentAuthorizationViewController(paymentRequest: paymentRequest),
            let window = SwiftHelper.getSceneDelegate()?.window
        else {
            return
            
        }
        paymentVC.delegate = self
        window.rootViewController?.present(paymentVC, animated: true, completion: nil)
        
    }
    // MARK: - LIFE CYCLE METHODS
    init(countryCode: String, currencyCode: String) {
        self.countryCode = countryCode
        self.currencyCode = currencyCode
    }
}

// MARK: - PKPaymentAuthorizationViewControllerDelegate
extension ApplePayManager: PKPaymentAuthorizationViewControllerDelegate {
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        completion(.init(status: .success, errors: nil))
    }
}
