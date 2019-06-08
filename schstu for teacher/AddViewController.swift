//
//  AddViewController.swift
//  schstu for teacher
//
//  Created by 吉川椛 on 2019/04/29.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit

//変数の設置
var TodoKobetsunonakami = [String]()

class AddViewController: ViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        contentTextView.text = saveData.object(forKey: "content") as? String
        
    }
    
    @IBAction func saveMemo() {
        
        saveData.set(contentTextView.text, forKey: "content")
        
        let alert: UIAlertController = UIAlertController(title: "OK", message: "メモの保存が完了しました", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title: "OK", style: .default, handler: { action in
                
                self.navigationController?.popViewController(animated: true)
            }
            )
        )
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return  true
    }
}
