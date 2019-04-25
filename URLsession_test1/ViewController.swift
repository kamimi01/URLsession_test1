//
//  ViewController.swift
//  URLsession_test1
//
//  Created by AA370627 on 2019/04/12.
//  Copyright © 2019 AA370627. All rights reserved.
//
/*
import UIKit
import SVProgressHUD //使用目的：エラーのポップアップを表示するため

class ViewController: UIViewController {
    //buttonとソースコードを接続
    @IBAction func button(_ sender: Any) {
        //外部サイトを表示するための定義
        let url = URL(string:"https://retty.me/area/PRE13/ARE15/SUB1501/LCAT1/CAT350/")
        let request = URLRequest(url: url!)
        //スキーマの正誤判断
        if UIApplication.shared.canOpenURL(url! as URL) == false{
            //UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
            
            let task = URLSession.shared.dataTask(with: request){ data, response, error in
                if let error = error{
                    print("エラーのメッセージ：\(error.localizedDescription)")
                    if error.localizedDescription == "unsupported URL"{
                        print("不正なURLです!!スキーマが不正。httpステータスコード取得不可。")
                        
                        //重い処理を実行
                        DispatchQueue.main.sync {
                            // メインスレッドに移行してから実行する処理をここに書く（重い処理）
                            SVProgressHUD.showError(withStatus:"不正なURLです!!スキーマが不正。httpステータスコード取得不可。")
                        }
                        
                    }
                }else {
                    print("ブラウザを開くことができません。ステータスコードなし。")
                    SVProgressHUD.showError(withStatus:"ブラウザを開くことができません。httpステータスコード取得不可。")
                }
            }
            task.resume()
            return  //
        }
        
        //エラーの出し分け
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            if let error = error{
                print("エラーのメッセージ：\(error.localizedDescription)")
                if error.localizedDescription == "A server with the specified hostname could not be found."{
                    print("不正なURLです!!ホスト名が不正。httpステータスコード取得不可。")
                    
                    DispatchQueue.main.sync {
                        // メインスレッドに移行してから実行する処理をここに書く（重い処理）
                        //画面遷移せずにポップアップを表示する必要がある
                        SVProgressHUD.showError(withStatus:"不正なURLです!!ホスト名が不正。httpステータスコード取得不可。")
                    }
                }else {
                    //if UIApplication.shared.canOpenURL(url! as URL){
                    //外部ブラウザを表示する
                    UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
                }
                return
            }
            //httpステータスコードの取得
            //メインスレッドに移行してから実行する処理をここに書く（重い処理）
            DispatchQueue.main.sync{
                if let response = response as? HTTPURLResponse {
                    print("response：\(response)")
                    print("response.statusCode = \(response.statusCode)")
                    if response.statusCode != 200{
                        print("不正なURLです!!パス名が不正。ステータスコードは\(response.statusCode)")
                            //画面遷移せずにポップアップを表示する必要がある
                        SVProgressHUD.showError(withStatus:"不正なURLです!!パス名が不正。ステータスコードは\(response.statusCode)")
                    }else if UIApplication.shared.canOpenURL(url! as URL){
                            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
                    }

                }else{
                    print("エラー3")
                }
            }
        }
        task.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

*/

/*
import UIKit
import SVProgressHUD //使用目的：エラーのポップアップを表示するため

class ViewController: UIViewController {
    //buttonとソースコードを接続
    @IBAction func button(_ sender: Any) {
        //外部サイトを表示するための定義
        let url = URL(string:"https://retty.me/area/PRE13/ARE15/SUB1501/LCAT1/CAT350/")
        let request = URLRequest(url: url!)
        
        if UIApplication.shared.canOpenURL(url!) == true {
        
                    print("URL1：\(String(describing: url))")
                    UIApplication.shared.open(url!, options: [:], completionHandler:nil)
                    //問題→端末側の設定を戻してもURLが正しいのに遷移できない
        }else{
            
                let task = URLSession.shared.dataTask(with: request){ data, response, error in
                    //print("エラーのメッセージ：\(error!.localizedDescription)")
                    DispatchQueue.main.sync {
                    if let error = error{
                        
                        SVProgressHUD.showError(withStatus:"ページが見つかりません。")
                        print("URL2：\(String(describing: url))")
                    }else {
                        SVProgressHUD.showError(withStatus:"safariが無効となっています。")
                        print("URL3：\(String(describing: url))")
                    }
                }
                }
            
                task.resume()
            
            
            
        
    }
    
        //overrideを削除
        func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
}
}
*/

/*
import UIKit
import SVProgressHUD //使用目的：エラーのポップアップを表示するため

class ViewController: UIViewController {
    //buttonとソースコードを接続
    @IBAction func button(_ sender: Any) {
        //外部サイトを表示するための定義
        let url = URL(string:"https://retty.me/area/PRE13/ARE15/SUB1501/LCAT1/CAT350/")
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            DispatchQueue.main.sync {
                if let error = error{
                    // URLエラー(スキーマ不正、相手ホスト名不正)
                    print("URLが不正です！")
                    print(error.localizedDescription)
                    SVProgressHUD.showError(withStatus: "URLが不正です！")
                } else {
                    // 指定URLで接続できるのでURLは正しい
                    if UIApplication.shared.canOpenURL(url!) == true {
                        // URLは正しく、safariも起動可能
                        print("URLは正しく、safariも起動可能")
                        UIApplication.shared.open(url!, options: [:], completionHandler:nil)
                    } else {
                        // URLは正しいが、safariが起動不可にされている
                        print("URLは正しいが、safariが起動不可")
                        SVProgressHUD.showError(withStatus: "safariが無効です！")
                    }
                }
            }
            }
            task.resume()
        
        //overrideを削除
        func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
        }
        
        
    }
}
*/

import UIKit
import SVProgressHUD //使用目的：エラーのポップアップを表示するため

class ViewController: UIViewController {
    //buttonとソースコードを接続
    @IBAction func button(_ sender: Any) {
        //外部サイトを表示するための定義
        //let urltest = "https://retty.me/area/PRE13/ARE15/SUB1501/LCAT1/CAT350/"
        //let urltest = ""
        let urltest = "https://www.ibm.com/jp-ja/?ar=1"
        
        //safariが起動可能かどうかを確認
        if UIApplication.shared.canOpenURL(URL(string: "http://")!){
            print("safari インストール済み")
            //URLが不正かどうかを確認、nilでないことを確認
            
            //URLが不正かどうかを確認、nilでないことを確認
            if let url = URL(string: urltest), UIApplication.shared.canOpenURL(url) == true{
                UIApplication.shared.open(url, options: [:], completionHandler:nil)
            }else{
                print("URLが不正")
                //URLが不正（スキーマ名が不正、urlがnilになっている）
                print("url:\(urltest)")
                SVProgressHUD.showError(withStatus: "URLが不正です！")
            }
        }else {
            //safariが無効
            print("safari インストールされていない")
            SVProgressHUD.showError(withStatus: "Safariが無効です！")
            }
    }
}

        
/*
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            DispatchQueue.main.sync {
                if let error = error{
                    // URLエラー(スキーマ不正、相手ホスト名不正)
                    print("URLが不正です！")
                    print(error.localizedDescription)
                    SVProgressHUD.showError(withStatus: "URLが不正です！")
                } else {
                    // 指定URLで接続できるのでURLは正しい
                    if UIApplication.shared.canOpenURL(url!) == true {
                        // URLは正しく、safariも起動可能
                        print("URLは正しく、safariも起動可能")
                        UIApplication.shared.open(url!, options: [:], completionHandler:nil)
                    } else {
                        // URLは正しいが、safariが起動不可にされている
                        print("URLは正しいが、safariが起動不可")
                        SVProgressHUD.showError(withStatus: "safariが無効です！")
                    }
                }
            }
        }
        task.resume()
        
        //overrideを削除
        func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
        }
        
        
    }
}
*/
