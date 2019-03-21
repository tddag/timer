//
//  ViewController.swift
//  timer
//
//  Created by Tam Dang on 2019-03-20.
//  Copyright © 2019 tamdang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var playPauseButton: UIButton!
    
    var isTimerOn = false
    
    var duration = 0
    
    var timer = Timer()
    
    
    @IBAction func didTapStartOrPause(_ sender: Any) {
        isTimerOn.toggle()
        showPlayButton(!isTimerOn)
        toggleTimer(on: isTimerOn)
    }
    
    func toggleTimer(on: Bool) {
        if on {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] (_) in
                guard let strongSelf = self else { return }
                strongSelf.duration += 1
                strongSelf.label.text = String(strongSelf.duration)
            })
        } else {
            timer.invalidate()
        }
        
    }
    
    func showPlayButton(_ shouldShowPlayButton: Bool) {
        let imageName = shouldShowPlayButton ? "playIcon": "pauseIcon"
        playPauseButton.setImage(UIImage(named: imageName), for: .normal)
        playPauseButton.backgroundColor = shouldShowPlayButton ? .green : .yellow
    }
    
    
    @IBAction func didTapReset() {
        timer.invalidate()
        duration = 0
        label.text = String(duration)
        showPlayButton(true)
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

