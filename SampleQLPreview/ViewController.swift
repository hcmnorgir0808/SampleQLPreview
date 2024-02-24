//
//  ViewController.swift
//  SampleQLPreview
//
//  Created by 岩本康孝 on 2024/02/24.
//

import UIKit
import QuickLook

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedButton(_ sender: Any) {
        // UIViewControllerのサブクラス
     //   let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "QuickViewController") as! QuickViewController
        let vc = QLPreviewController()
        vc.dataSource = self
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

extension ViewController: QLPreviewControllerDelegate {
    // 閉じる前に呼ばれる
    func previewControllerWillDismiss(_ controller: QLPreviewController) {
        print(#function)
    }

    // 閉じた後に呼ばれる
    func previewControllerDidDismiss(_ controller: QLPreviewController) {
        print(#function)
    }

    func previewController(_ controller: QLPreviewController, editingModeFor previewItem: QLPreviewItem) -> QLPreviewItemEditingMode {
        // 編集モード
        .createCopy
    }
}

extension ViewController: QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        // previewの数
        return 3
    }

    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        // ファイル読み込み
        // URLはfile-typeのもの
        guard let fileURL = Bundle.main.url(forResource: "icons8-diary-100", withExtension: "png") else { fatalError() }
        return CustomPreviewItem(url: fileURL, title: "icon")
    }
}
