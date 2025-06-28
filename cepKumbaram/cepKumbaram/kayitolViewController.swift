//
//  kayitolViewController.swift
//  cepKumbaram
//
//  Created by Bedirhan Yüksek on 18.08.2024.
//

import UIKit

class kayitolViewController: UIViewController {
    @IBOutlet weak var label: UILabel!    
    @IBOutlet weak var kullaniciKayitTextField: UITextField!
    @IBOutlet weak var sifreKayitTextField: UITextField!
    @IBOutlet weak var sifreTekrarTextField: UITextField!
    
    var kayitliKullanici = UserDefaults.standard.stringArray(forKey: "kullaniciAdi") ?? []
    var kayitliSifreler = UserDefaults.standard.stringArray(forKey: "kayitliSifre") ?? []
    var kaydedilen = ""
    
    var sifre = ""
    var sifreTekrar = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
    }
            
    @IBAction func kayitEtButon(_ sender: Any) {
        
        kaydedilen = kullaniciKayitTextField.text ?? ""
        sifre = sifreKayitTextField.text ?? ""
        sifreTekrar = sifreTekrarTextField.text ?? ""
        if kaydedilen.isEmpty{
            hataMesaji(baslik: "HATA", mesaj: "Kullanıcı adı boş olamaz")
            
        }
        else if kayitliKullanici.contains(kaydedilen){
            hataMesaji(baslik: "HATA", mesaj: "Bu kullanıcı zaten kayıtlı")
        }
        else if sifre.isEmpty {
            hataMesaji(baslik: "HATA", mesaj: "Şifre boş olamaz")
            
        }
        else if sifre != sifreTekrar{
            hataMesaji(baslik: "HATA", mesaj: "Şifreler uyuşmuyor")
        }
        
        else{
            kayitliKullanici.append(kaydedilen)
            kayitliSifreler.append(sifre)
            UserDefaults.standard.set(kayitliKullanici, forKey: "kullaniciAdi")
            UserDefaults.standard.set(kayitliSifreler, forKey: "kayitliSifre")
            hataMesaji(baslik: "BAŞARILI", mesaj: "Başarıyla kayıt oluşturuldu")
        }
        
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toKayitlilarVC" {
            let destinationVC = segue.destination as! kayitlilarViewController
            destinationVC.kayitliListe = UserDefaults.standard.stringArray(forKey: "kullaniciAdi") ?? []
            destinationVC.kayitliSifre = UserDefaults.standard.stringArray(forKey: "kayitliSifre") ?? []
        }
    }
    
    func hataMesaji(baslik: String, mesaj: String){
        let hataMesaj = UIAlertController(title: baslik, message: mesaj, preferredStyle: UIAlertController.Style.alert)
        let hataButon = UIAlertAction(title: "ok", style: UIAlertAction.Style.default) { UIAlertAction in
            print("ok")
        }
        hataMesaj.addAction(hataButon)
        self.present(hataMesaj, animated: true, completion: nil)
    }

}
