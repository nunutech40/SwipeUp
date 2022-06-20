# SwipeUp
This is feature for pop up with swipe up.

![bSGCtp_a96f0b50aa9c10ba24a37502d6eb1436_00-00-00_00-00-05_2](https://user-images.githubusercontent.com/49187517/174574731-acb5a7a5-2e38-415a-9681-9ec7207628bf.gif)


# this is how i made it:


- I create a ViewController for poping up, when i click an action.

<img width="809" alt="Screenshot 2022-06-20 at 4 30 09 PM" src="https://user-images.githubusercontent.com/49187517/174571675-e0410039-6a78-4200-874e-e362dfa14074.png">

- Then, i add view with half height from the full screen.

<img width="247" alt="Screenshot 2022-06-20 at 4 32 57 PM" src="https://user-images.githubusercontent.com/49187517/174572254-73e04f56-c6ce-4c17-add0-96ad2f894e01.png">

- Then this is what make the view can swipe up.

```swift
func afterSwipe(_ swipe: String) {
        
        let getHeightFrame = self.heightFrame - 120
        
        UIView.animate(
            withDuration: 1.0,
            delay: 0.5, options:
                    .allowUserInteraction,
            animations: {
                if swipe == "up" {
                    self.heightViewPopUp.constant = getHeightFrame
                    self.tableView.isScrollEnabled = true
                    self.configureDisplayData(swipe: "up")
                } else {
                    self.heightViewPopUp.constant = 495
                    self.tableView.isScrollEnabled = false
                    self.configureDisplayData(swipe: "down")
                }
            },
            completion: nil)
    }
    
    @objc func swipeMade(_ sender: UISwipeGestureRecognizer) {
        
        if sender.direction == .up {
            
            UIView.animate(
                withDuration: 0.5,
                delay: 0.0,
                options: .allowUserInteraction, animations: {
                    self.view.frame.origin.y -= 75
                },
                completion: {_ in
                    self.afterSwipe("up")
                }
            )
            
        }
        
        if sender.direction == .down {
            
            UIView.animate(
                withDuration: 0.5,
                delay: 0.0,
                options: .allowUserInteraction, animations: {
                    self.view.frame.origin.y += 75
                },
                completion: {_ in
                    self.afterSwipe("down")
                }
            )
        }
        
    }
```

Tara... now you have an ViewController for pop up!

Use this for call your pop up

```swift
let popup = FeedBackHSView()
popup.modalPresentationStyle = .overCurrentContext
self.present(popup, animated: true)
```

# How to run this pop up on youmac.

- install xCode from appstore
- git clone https://github.com/nunutech40/SwipeUp.git in your directory
- open BU-Prodia.xcworkspace and run
