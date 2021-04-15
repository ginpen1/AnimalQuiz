//
//  ViewController.swift
//  AnimalQuiz
//
//  Created by T. Kurohama on 2021/04/05.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pandaImageView: UIImageView!
    @IBOutlet weak var chickenImageView: UIImageView!
    @IBOutlet weak var rabbitImageView: UIImageView!
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var marubatuImageView: UIImageView!
    
    
    var player0:AVAudioPlayer?
    var player1:AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        appTitle.font = UIFont(name: "pupupu-free", size: 58)
        
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = UIColor.black.cgColor
        
        pandaImageView.image = UIImage(named: "panda")
        chickenImageView.image = UIImage(named: "chicken")
        rabbitImageView.image = UIImage(named: "rabbit")
        marubatuImageView.image = UIImage(named: "marubatu")
        
               // 再生する音声ファイルを指定
               let url = Bundle.main.bundleURL.appendingPathComponent("mainbgm.mp3")
               do {
                   try player0 = AVAudioPlayer(contentsOf: url)
                   player0!.prepareToPlay()
               } catch {
                   print("Error")
               }
               player0!.volume = 0.5
               player0!.play()
               //音声をループさせる
               player0!.numberOfLoops = -1
    }
    
    //ボタンを押したら効果音がなるように設定
    @IBAction func playSound(sender: AnyObject) {
        // 再生する音声ファイルを指定
        let soundURL = Bundle.main.url(forResource: "startButtonSE", withExtension: "mp3")
         do {
             player1 = try AVAudioPlayer(contentsOf: soundURL!)
             player1!.prepareToPlay()
             player1?.play()
         } catch {
             print("error...")
         }
    }
}
