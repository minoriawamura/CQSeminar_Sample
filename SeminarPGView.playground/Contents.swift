//: Playground - noun: a place where people can play

import UIKit


// テキストラベルの定義
let labelSample = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
labelSample.backgroundColor = UIColor.cyan
labelSample.text = "CQセミナー"
labelSample.textAlignment = NSTextAlignment.center

// テキストフィールドの定義
let textFieldSample = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
textFieldSample.backgroundColor = UIColor.white
textFieldSample.borderStyle = UITextBorderStyle.line


// UI部品を動作させて見る

// UIViewの定義
class PGView: UIView {
    
    let myField = UITextField()
    
    // イニシャライザ
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGray
    }
    
    // テキストラベル作成
    func makeLabel(frame: CGRect, text: String) -> UILabel {
        let label = UILabel(frame: frame)
        label.text = text
        label.backgroundColor = UIColor.white
        label.textAlignment = NSTextAlignment.right
        
        return label
    }
    
    // テキストフィールド作成
    func makeTextFieldd(frame: CGRect, placeholder: String) -> UITextField {
        let textField = UITextField(frame: frame)
        textField.backgroundColor = UIColor.white
        textField.placeholder = placeholder
        
        return textField
    }
    
    // ボタンの作成
    func makeButton(frame: CGRect, title: String, tag: Int) -> UIButton {
        let button = UIButton(type: .roundedRect)
        button.frame = frame
        button.tag = tag
        button.layer.cornerRadius = 10.0
        
        button.setTitle(title, for: UIControlState.normal)
        button.backgroundColor = UIColor.white

        button.addTarget(self, action: #selector(self.onTapButton(_:)), for: .touchUpInside)
        return button
    }
    
    // ボタンアクションの定義
    func onTapButton(_ sender: UIButton)  {
        if self.backgroundColor == UIColor.lightGray {
            self.backgroundColor = UIColor.cyan
            myField.textColor = UIColor.blue
        } else {
            self.backgroundColor = UIColor.lightGray
            myField.textColor = UIColor.white
        }
    }

    override func draw(_ rect: CGRect) {
        let frame = CGRect(x: 100, y: 200, width: 100, height: 50)
        let button = makeButton(frame: frame, title: "Change Color", tag: 0)
        let label2 = makeLabel(frame: CGRect(x: 30, y: 100, width: 70, height: 35), text: "Label")
        myField.frame = CGRect(x: 120, y: 100, width: 150, height: 35)
        myField.placeholder = "Type Something"
        myField.textColor = UIColor.white
        myField.backgroundColor = UIColor.red
        
        self.addSubview(button)
        self.addSubview(label2)
        self.addSubview(myField)
    }

}

let myView = PGView(frame: CGRect(x: 0, y: 0, width: 300, height: 400))


// プレイグラウンドにWindowのプレビュー表示
import PlaygroundSupport

PlaygroundPage.current.liveView = myView
PlaygroundPage.current.needsIndefiniteExecution = true
