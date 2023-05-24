//
//  PdfViewerVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 04/05/23.
//

import UIKit
import WebKit

class PdfViewerVC: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet private weak var webView: WKWebView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadPdf()
    }
}

// MARK: - Functions
extension PdfViewerVC {
    private func loadPdf() {
        guard let pdfUrl = Bundle.main.url(forResource: "wkwebview", withExtension: "pdf") else {
            return
        }
        webView.loadFileURL(pdfUrl, allowingReadAccessTo: pdfUrl.deletingLastPathComponent())
    }
}
