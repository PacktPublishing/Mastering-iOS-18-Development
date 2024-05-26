//
//  ShareBookViewController.swift
//  ShareExtension
//
//  Created by Avi Tsadok on 17/05/2024.
//

import UIKit
import UniformTypeIdentifiers

struct Book: Codable {
    let title: String
    let author: String
    let numberOfPages: Int
}





extension UTType {
    static var book: UTType = UTType(exportedAs: "com.myapp.book")
}

class ShareBookViewController: UIViewController {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    @IBAction func completeButtonTapped() {
        extensionContext?.completeRequest(returningItems: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        
        if let inputItem = extensionContext?.inputItems.first as? NSExtensionItem,
           let attachment = inputItem.attachments?.first {
            
        }
        
        if let inputItem = self.extensionContext?.inputItems.first {
            
            if let extensionIten = inputItem as? NSExtensionItem {
                
                if extensionIten.attachments?.count ?? 0 > 0 {
                    if let firstAttachment = extensionIten.attachments?.first {
                        
                        if firstAttachment.hasItemConformingToTypeIdentifier(UTType.plainText.identifier) {
                            firstAttachment.loadItem(forTypeIdentifier: UTType.plainText.identifier) { item, error in
                                if let string = item as? String {
                                    DispatchQueue.main.async {
                                        self.topLabel.text = string
                                    }
                                }
                            }
                        }
                        
                        if firstAttachment.hasItemConformingToTypeIdentifier("com.myapp.book") {
                            
                            firstAttachment.loadItem(forTypeIdentifier: "com.myapp.book") { item,error  in
                                
                                if let error = error {
                                    print("Error loading item: \(error)")
                                    return
                                }
                                
                                guard let data = item as? Data else {
                                    print("Failed to cast item to Data")
                                    return
                                }
                                
                                do {
                                    let book = try JSONDecoder().decode(Book.self, from: data)
                                    DispatchQueue.main.async {
                                        // Do something with the book, like displaying it in the UI
                                    }
                                } catch {
                                    print("Failed to decode Book: \(error)")
                                }
                            }
                        }
                    }
                }
            }
        }
        
        if let book = self.extensionContext?.inputItems.first as? Book {
            topLabel.text = book.title
            bottomLabel.text = book.author
            }
        // Do any additional setup after loading the view.
    }
}
