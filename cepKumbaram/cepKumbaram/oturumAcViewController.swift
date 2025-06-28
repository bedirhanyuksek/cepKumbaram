//
//  oturumAcViewController.swift
//  cepKumbaram
//
//  Created by Bedirhan Yüksek on 19.08.2024.
//

import UIKit

class oturumAcViewController: UIViewController {
    @IBOutlet weak var bakiyeLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var besImageView: UIImageView!
    @IBOutlet weak var onImageView: UIImageView!
    @IBOutlet weak var yirmiImageView: UIImageView!
    @IBOutlet weak var elliImageView: UIImageView!
    @IBOutlet weak var yuzImageView: UIImageView!
    @IBOutlet weak var ikiYuzImageView: UIImageView!
    
    var bakiye = 0
    var index = 0
    var kontrolIsim = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        besImageView.isUserInteractionEnabled = true
        onImageView.isUserInteractionEnabled = true
        yirmiImageView.isUserInteractionEnabled = true
        elliImageView.isUserInteractionEnabled = true
        yuzImageView.isUserInteractionEnabled = true
        ikiYuzImageView.isUserInteractionEnabled = true
        
        kontrolIsim = UserDefaults.standard.stringArray(forKey: "kullaniciAdi") ?? []
        index = UserDefaults.standard.integer(forKey: "kullanici")
        
        bakiye = UserDefaults.standard.integer(forKey: kontrolIsim[index])
        
        bakiyeLabel.text = "Bakiye: \(bakiye)"
        
        
        let besGesture = UITapGestureRecognizer(target: self, action: #selector(besEkle))
        besImageView.addGestureRecognizer(besGesture)
        let onGesture = UITapGestureRecognizer(target: self, action: #selector(onEkle))
        onImageView.addGestureRecognizer(onGesture)
        let yirmiGesture = UITapGestureRecognizer(target: self, action: #selector(yirmiEkle))
        yirmiImageView.addGestureRecognizer(yirmiGesture)
        let elliGesture = UITapGestureRecognizer(target: self, action: #selector(elliEkle))
        elliImageView.addGestureRecognizer(elliGesture)
        let yuzGesture = UITapGestureRecognizer(target: self, action: #selector(yuzEkle))
        yuzImageView.addGestureRecognizer(yuzGesture)
        let ikiYuzGesture = UITapGestureRecognizer(target:self, action: #selector(ikiYuzEkle))
        ikiYuzImageView.addGestureRecognizer(ikiYuzGesture)
    }
    
    @objc func besEkle(){
        bakiye += 5
        bakiyeLabel.text = "Bakiye: \(bakiye)"
        
        UserDefaults.standard.set(bakiye, forKey: kontrolIsim[index])
        
    }
    @objc func onEkle(){
        bakiye += 10
        bakiyeLabel.text = "Bakiye: \(bakiye)"
        UserDefaults.standard.set(bakiye, forKey: kontrolIsim[index])
    }
    @objc func yirmiEkle(){
        bakiye += 20
        bakiyeLabel.text = "Bakiye: \(bakiye)"
        UserDefaults.standard.set(bakiye, forKey: kontrolIsim[index])
    }
    @objc func elliEkle(){
        bakiye += 50
        bakiyeLabel.text = "Bakiye: \(bakiye)"
        UserDefaults.standard.set(bakiye, forKey: kontrolIsim[index])
    }
    @objc func yuzEkle(){
        bakiye += 100
        bakiyeLabel.text = "Bakiye: \(bakiye)"
        UserDefaults.standard.set(bakiye, forKey: kontrolIsim[index])
    }
    @objc func ikiYuzEkle(){
        bakiye += 200
        bakiyeLabel.text = "Bakiye: \(bakiye)"
        UserDefaults.standard.set(bakiye, forKey: kontrolIsim[index])
    }
    
    
    
    
}
