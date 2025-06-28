//
//  kayitlilarViewController.swift
//  cepKumbaram
//
//  Created by Bedirhan Yüksek on 19.08.2024.
//

import UIKit

class kayitlilarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var TableView: UITableView!
    
    var kayitliListe = [String]()
    var kayitliSifre = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kayitliListe = UserDefaults.standard.stringArray(forKey: "kullaniciAdi") ?? []
        kayitliSifre = UserDefaults.standard.stringArray(forKey: "kayitliSifre") ?? []
        
        TableView.delegate = self
        TableView.dataSource = self
        TableView.reloadData()
        
        
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kayitliListe.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = kayitliListe[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let uyari = UIAlertController(title: "UYARI", message: "Bu kullanıcıyı silmek istediğinize emin misiniz?", preferredStyle: UIAlertController.Style.alert)
            let uyariButonu = UIAlertAction(title: "ok", style: UIAlertAction.Style.default) { UIAlertAction in
                
                UserDefaults.standard.removeObject(forKey: self.kayitliListe[indexPath.row])
                self.kayitliListe.remove(at: indexPath.row)
                self.kayitliSifre.remove(at: indexPath.row)
                UserDefaults.standard.set(self.kayitliSifre, forKey: "kayitliSifre")
                UserDefaults.standard.set(self.kayitliListe, forKey: "kullaniciAdi")
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            }
            let iptalButon = UIAlertAction(title: "iptal", style: UIAlertAction.Style.default) { UIAlertAction in
                print("iptal")
            }
            uyari.addAction(uyariButonu)
            uyari.addAction(iptalButon)
            self.present(uyari, animated: true, completion: nil)
            
            
            
        }
    }
    

}
