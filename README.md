# KBubble
İOS touchesBegan() Bubble Animation


![alt tag](https://cloud.githubusercontent.com/assets/16580898/25073712/b5c6c536-22f4-11e7-8b34-254fd8c7d9a2.png)

Create Animation

```Swift

override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        
    KBubble.add(to: self.view, color: .lightGray, touches: touches)
        
        
    }

```
