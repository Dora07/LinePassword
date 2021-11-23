

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
      reSet()
    
    }
    //熊熊反應圖片
    @IBOutlet weak var bearImage: UIImageView!
    //文字
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    
    //密碼四個圖
    @IBOutlet var imageShow: [UIImageView]!
    //按鍵
    @IBOutlet var numButton : [UIButton]!
    
    //設定系統密碼
    var systemPassword = "1234"
    //設定使用者輸入初始為空白
    var userEnter = ""
    
   //輸入密碼
    @IBAction func enterPassword(_ sender: UIButton)
    {   //使用者輸入密碼不等於4
        if userEnter.count != 4
        {
            if let inPutNumber = sender.currentTitle
            {
                //字串相加
                userEnter.append(inPutNumber)
            }
        }
        //密碼圖片顯現
        imagePasspord()
      print(userEnter)
    }
    
    //密碼圖片
    func imagePasspord()
    {
        switch userEnter.count
        {
        //當密碼圖片0顯現
        case 1 :
            imageShow[0].isHidden = false
            //圖片1..3隱藏
            for i in 1...3
            {
                imageShow[i].isHidden = true
            }
        //if條件式:
        case 2 :

            for i in 0...3
            {
                //1以上的圖片隱藏
                if i > 1
                {
                    imageShow[i].isHidden = true
                }
                else
                {
                    imageShow[i].isHidden = false
                }
            }
        //密碼三張圖片顯現,第四章隱藏
        case 3:
            
            for i in 0...2
            {
                imageShow[i].isHidden = false
            }
            imageShow[3].isHidden = true
        //密碼四張圖片都顯現
        case 4 :
            for i in 0...3
            {
                imageShow[i].isHidden = false
            }
            chackPassword()
            //default捕捉剩下的情況
        default: reSet()
          
        }
    }
    
    
    func reSet()
    {
        for i in 0...3
        {
            imageShow[i].isHidden = true
        }
        userEnter = ""
        labelOne.text = "パスコード入力"
        labelTwo.text = "パスコードを入力して下さい"
        bearImage.image = UIImage(named:"?")
        
    }
    
    //清除按鍵
    @IBAction func clearButton(_ sender: UIButton)
    {   //當使用者輸入不等於0時
        if userEnter.count != 0
        {  //移除上一步使用者動作
            userEnter.removeLast()
        }
        
        imagePasspord()
        
    }
    
    //檢查密碼
    func chackPassword()
    {   //如果使用者輸入密碼跟系統設定一樣
        if userEnter == systemPassword
        {   //文字變更
            labelOne.text = "パスワードが一致します"
            labelOne.text = "おめでとうございます"
            //圖片變更
            bearImage.image = UIImage(named: "O")
            //跳出訊息
            let controller = UIAlertController(title: "パスワードが一致します", message: "おめでとうございます", preferredStyle: .alert)
            let action = UIAlertAction(title: "オッケ", style: .default )
            {(_)in
                self.reSet()
            }
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
        }
        //如果使用者輸入密碼跟系統不一樣
        else if userEnter != systemPassword
        {   //文字變更
            labelOne.text = "パスワードが一致しません"
            labelTwo.text = "もう一度確認してください"
            //圖片變更
            bearImage.image = UIImage(named: "X")
            //跳出訊息
            let controller = UIAlertController(title:"認証エラ", message: "パスワードが一致しません", preferredStyle: .alert)
            let action = UIAlertAction(title: "もう一度して下さい", style: .default )
            {(_)in
                self.reSet()
            }
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
            
            
            
            
        }
    }
    
    
    
    
    
    
    
    
    
   
    
}

