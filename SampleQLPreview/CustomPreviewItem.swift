//
//  CustomPreviewItem.swift
//  SampleQLPreview
//
//  Created by 岩本康孝 on 2024/02/24.
//

import Foundation
import QuickLook

class CustomPreviewItem: NSObject, QLPreviewItem {

     var previewItemURL: URL?
     var previewItemTitle: String?

     init(url: URL?, title: String?) {
         previewItemURL = url
         previewItemTitle = title
     }
}
