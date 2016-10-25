//
//  ViewController.swift
//  BirdFly
//
//  Created by admin on 10/24/16.
//  Copyright © 2016 tien. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var bird = UIImageView()
    var audioPlayer = AVAudioPlayer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawJungle()
        addBird()
        flyUpandDown()
        playSong()
        
    }

    func drawJungle() {
        
        // set background
        let background = UIImageView(image: UIImage(named:"Jungle.jpg"))
        
        // frame: bao gom toa  do (x,y) doi tuong day
        //bounds: Biên giới, biên
        background.frame = self.view.bounds
        
        background.contentMode = .ScaleAspectFill // fill đầy cho tỉ lệ
        
        self.view.addSubview(background) // add biến background
        
    }
    
    func addBird() {
        
        bird = UIImageView(frame: CGRectMake(0, 0, 110, 68))
        
        // add lên view sẽ được repeat lặp lại
        bird.animationImages = [UIImage(named:"bird0.png")!, UIImage(named:"bird1.png")!,UIImage(named:"bird2.png")!,UIImage(named:"bird3.png")!,UIImage(named:"bird4.png")!,UIImage(named:"bird5.png")!]
        
        bird.animationRepeatCount = 0
        bird.animationDuration = 1 // toc do load anh
        bird.startAnimating()
        self.view.addSubview(bird)
  
    }
    func flyUpandDown() {
        
        UIView.animateWithDuration(2, animations: {
            
            self.bird.center = CGPointMake(self.view.bounds.size.width - 50, self.view.bounds.size.height - 50)
            
        }) { (finished) in
            
            // vừa quay lại vừa check 1 góc
        self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1),CGAffineTransformMakeRotation(0))
                
                UIView.animateWithDuration(2, animations: {
                    
                self.bird.center = CGPointMake(50, 600 )
                    
                }) { (finished) in
                
                self.bird.transform =  CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, 1, -1),CGAffineTransformMakeRotation(115))
                            
                            UIView.animateWithDuration(2, animations: {
                                
                            self.bird.center = CGPointMake(300, 50 )
                                
                            }) { (finished) in
                                
                            self.bird.transform =  CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1),CGAffineTransformMakeRotation(115))
                                
                                
                                UIView.animateWithDuration(2, animations: {
                                    
                                self.bird.center = CGPointMake(50, 50 )
                                    
                                }) { (finished) in
                                    
                                self.bird.transform = CGAffineTransformIdentity
                                self.flyUpandDown()
                     
                        }
                                
                    }
                
                }
            
            }
        
        }
    
    func playSong() {
        
        let filePath = NSBundle.mainBundle().pathForResource("chao mao hot", ofType: ".mp3")
        
        let url = NSURL(fileURLWithPath: filePath!)
        
        audioPlayer = try! AVAudioPlayer(contentsOfURL: url)
        
        audioPlayer.prepareToPlay()
        
        audioPlayer.play()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

