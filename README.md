# SwipeUp

This is feauture for pop up with swipe up.

-- I create a ViewController for poping up, when i click an action.

<img width="809" alt="Screenshot 2022-06-20 at 4 30 09 PM" src="https://user-images.githubusercontent.com/49187517/174571675-e0410039-6a78-4200-874e-e362dfa14074.png">

-- Then, i add view with half height from the full screen.

<img width="247" alt="Screenshot 2022-06-20 at 4 32 57 PM" src="https://user-images.githubusercontent.com/49187517/174572254-73e04f56-c6ce-4c17-add0-96ad2f894e01.png">

-- Then this is what make the view can swipe up.

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
