//
//  PlayerViewController.swift
//  MoosicApp
//
//  Created by Remu on 04/01/2021.
//  Copyright © 2021 Umer. All rights reserved.
//
import AVFoundation

import UIKit

class PlayerViewController: UIViewController {

    public var position: Int = 0
    public var songs: [Song] = []
    
    
    @IBOutlet var holder: UIView!

    var player: AVAudioPlayer?
    
    
    // UI Elements
    
    private let albumImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    private let songNameLabel : UILabel = {
          let label = UILabel()
          label.textAlignment = .center
        label.numberOfLines = 0
        
          return label
      }()
           
    
    private let userNameLabel : UILabel = {
             let label = UILabel()
             label.textAlignment = .center
           label.numberOfLines = 0
           
             return label
         }()
    
    let playPauseButton = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if holder.subviews.count == 0 {
            configure()
            
        }
    }
    
    func configure(){
        // set up the music player
        
        let song = songs[position]
        
        let url = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
      
        do{
         try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

        
            guard let url = url else {
                return
            }

            player = try AVAudioPlayer(contentsOf: URL(string: url)!)

            guard let player = player else{
                return
            }
            player.play()
            
        }catch{
            print("error occured")
        }
      // set up UI
        
//        Album Cover
        
        albumImageView.frame = CGRect(x: 20, y: 10, width: holder.frame.width-40, height: holder.frame.width-40)
        
        songNameLabel.frame = CGRect(x: 10, y:  albumImageView.frame.size.height + 10, width: holder.frame.width-20, height: 70)

        userNameLabel.frame = CGRect(x: 10, y:  albumImageView.frame.size.height + 80, width: holder.frame.width-20, height:70)

        
        songNameLabel.text = song.name
        
        userNameLabel.text = song.user_name
        
        
        albumImageView.image = UIImage(named: song.imageName)
        holder.addSubview(albumImageView)
        holder.addSubview(songNameLabel)
        holder.addSubview(userNameLabel)
        
//         player controls
        let nextButton  = UIButton()
        let backButton = UIButton()
        
        playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        nextButton.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
        backButton.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
        
        playPauseButton.tintColor = .purple
        backButton.tintColor = .purple
        nextButton.tintColor = .purple
        
        // frames
        
              
        // Add actions
        playPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)

        
        let yPosition = userNameLabel.frame.origin.y + 70 + 20
              let size: CGFloat = 70

              playPauseButton.frame = CGRect(x: (holder.frame.size.width - size) / 2.0,
                                             y: yPosition,
                                             width: size,
                                             height: size)

              nextButton.frame = CGRect(x: holder.frame.size.width - size - 20,
                                        y: yPosition,
                                        width: size,
                                        height: size)

              backButton.frame = CGRect(x: 20,
                                        y: yPosition,
                                        width: size,
                                        height: size)

        
        holder.addSubview(backButton)
        holder.addSubview(playPauseButton)
        holder.addSubview(nextButton)
        
        
        
        

        let slider = UISlider(frame: CGRect(x: 20, y: holder.frame.size.height-60, width: holder.frame.size.width-40, height: 50))

        slider.value = 0.5
        slider.addTarget(self,  action: #selector(didSlideSlider(_:)), for: .valueChanged )
        holder.addSubview(slider)
        
    }
    
    @objc func didTapBackButton() {
           if position > 0 {
               position = position - 1
               player?.stop()
               for subview in holder.subviews {
                   subview.removeFromSuperview()
               }
               configure()
           }
       }

       @objc func didTapNextButton() {
           if position < (songs.count - 1) {
               position = position + 1
               player?.stop()
               for subview in holder.subviews {
                   subview.removeFromSuperview()
               }
               configure()
           }
       }

       @objc func didTapPlayPauseButton() {
           if player?.isPlaying == true {
               // pause
               player?.pause()
               // show play button
               playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)

               // shrink image
               UIView.animate(withDuration: 0.2, animations: {
                   self.albumImageView.frame = CGRect(x: 30,
                                                      y: 30,
                                                      width: self.holder.frame.size.width-60,
                                                      height: self.holder.frame.size.width-60)
               })
           }
           else {
               // play
               player?.play()
               playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)

               // increase image size
               UIView.animate(withDuration: 0.2, animations: {
                   self.albumImageView.frame = CGRect(x: 10,
                                                 y: 10,
                                                 width: self.holder.frame.size.width-20,
                                                 height: self.holder.frame.size.width-20)
               })
           }
       }

    
    
    @objc func didSlideSlider(_ slider: UISlider){
        let value = slider.value
        
        player?.volume = value
        
    }

    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let player = player {
            player.stop()
        }
    }

}
