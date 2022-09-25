//
//  ViewController.swift
//  FileOpsApp
//
//  Created by Ogulcan Kara on 13.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldGirdi: UITextField!
    
    @IBOutlet weak var imageViewGoster: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func oku(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            
            do{
                
                textFieldGirdi.text = try String(contentsOf: dosyaYolu, encoding: String.Encoding.utf8)
                
            }catch{
                print("Dosya okuma hatası")
            }
            
        }
        
    }
    
    
    @IBAction func yaz(_ sender: Any) {
        
        let mesaj:String = textFieldGirdi.text!
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            
            do{
                
                try mesaj.write(to: dosyaYolu, atomically: false, encoding: String.Encoding.utf8)
                textFieldGirdi.text = ""
                
            }catch{
                print("Dosya yazma hatası")
            }
            
        }
        
        
    }
    
    
    @IBAction func silText(_ sender: Any) {
        
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            
            if FileManager.default.fileExists(atPath: dosyaYolu.path){
                
                do{
                    
                    try FileManager.default.removeItem(at: dosyaYolu)
                    textFieldGirdi.text  = ""
                    
                }catch{
                    print("Dosya silme hatası")
                }
            
            }
            
        }
        
    }
    
    @IBAction func kaydet(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            let dosyaYolu = dir.appendingPathComponent("image.png")
            
            let resim = UIImage(named: "resim")
            
            do{
                
                try resim!.pngData()?.write(to: dosyaYolu)
                
            }catch{
                print("Resim yazma hatası")
            }
            
        }
        
    }
    
    @IBAction func goster(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            let dosyaYolu = dir.appendingPathComponent("image.png")
            
            self.imageViewGoster.image = UIImage(contentsOfFile: dosyaYolu.path)
        }
        
    }
    
    @IBAction func silImage(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            let dosyaYolu = dir.appendingPathComponent("image.png")
            
            if FileManager.default.fileExists(atPath: dosyaYolu.path){
                
                do{
                    
                    try FileManager.default.removeItem(at: dosyaYolu)
                    
                }catch{
                    print("Resim silme hatası")
                }
            
            }
            
        }
        
    }
    
    
    
}

