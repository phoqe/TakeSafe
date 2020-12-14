//
//  MailView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-12-14.
//

import SwiftUI
import MessageUI
import UIKit

struct MailView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?
        
        init(presentation: Binding<PresentationMode>, result: Binding<Result<MFMailComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            
            guard error == nil else {
                self.result = .failure(error!)
                
                return
            }
            
            self.result = .success(result)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation, result: $result)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        let build = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
        
        vc.mailComposeDelegate = context.coordinator
        vc.setToRecipients(["takesafe@phoqe.com"])
        vc.setSubject("Feedback for \(version) (\(build))")
        
        return vc
    }
    
    func updateUIViewController(_ vc: MFMailComposeViewController, context: UIViewControllerRepresentableContext<MailView>) {
        
    }
}
