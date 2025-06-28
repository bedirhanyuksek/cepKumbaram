//
//  ViewController.swift
//  cepKumbaram
//
//  Created by Bedirhan Yüksek on 18.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var kullaniciTextField: UITextField!
    @IBOutlet weak var sifreTextField: UITextField!
    
    var kayitliIsimler = [String]()
    var kayitliSifreler = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kayitliIsimler = UserDefaults.standard.stringArray(forKey: "kullaniciAdi") ?? []
        kayitliSifreler = UserDefaults.standard.stringArray(forKey: "kayitliSifre") ?? []
        
        
        
        print(kayitliIsimler)
        print(kayitliSifreler)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        kayitliIsimler = UserDefaults.standard.stringArray(forKey: "kullaniciAdi") ?? []
        kayitliSifreler = UserDefaults.standard.stringArray(forKey: "kayitliSifre") ?? []
        print(kayitliIsimler)
        print(kayitliSifreler)
    }
    @IBAction func kayitliKullanicilarButon(_ sender: Any) {
        performSegue(withIdentifier: "toKayitlilarVC", sender: nil)
    }
    
    @IBAction func oturumAcButon(_ sender: Any) {
        
        if let index = kayitliIsimler.firstIndex(of: kullaniciTextField.text ?? ""){
            if let indexS = kayitliSifreler.firstIndex(of: sifreTextField.text ?? ""){
                if index == indexS {
                    performSegue(withIdentifier: "toOturumAcVC", sender: nil)
                    UserDefaults.standard.set(index, forKey: "kullanici")
                }
                
            }
            else if sifreTextField.text != kayitliSifreler[index]{
                uyariMesaji(baslik: "HATA", mesaj: "Şifre yanlış!")
            }
            
        
            
        }
        if kullaniciTextField.text == ""{
            uyariMesaji(baslik: "HATA", mesaj: "Kullanıcı adı giriniz")
        }
        if kayitliIsimler.contains(kullaniciTextField.text ?? ""){
            
        }else{
            uyariMesaji(baslik: "HATA", mesaj: "Kullanıcı bulunamadı")
        }
        
        
        
        
        
    }
    
    @IBAction func kayitOlButon(_ sender: Any) {
        performSegue(withIdentifier: "toKayitolVC", sender: nil)
    }
    
    func uyariMesaji(baslik: String, mesaj: String){
        
        let sifreYanlis = UIAlertController(title: baslik, message: mesaj, preferredStyle: UIAlertController.Style.alert)
        let okButon = UIAlertAction(title: "ok", style: UIAlertAction.Style.default) { UIAlertAction in
            print("ok")}
            sifreYanlis.addAction(okButon)
            self.present(sifreYanlis, animated: true, completion: nil)
    }
    
    
    
}

