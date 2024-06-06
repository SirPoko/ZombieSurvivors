import wollok.game.*

object arya {
  
  var property position = game.at(7,7)
  var direction = "3"
  var property paso = 1
  
  method image() = "a" + direction + (paso % 3) + ".png"
   
  method moveUp() {
    position = position.up(1)
    direction = "3"
    paso = self.paso() + 1
  }
  
  method moveDown() {
    position = position.down(1)
    direction = "0"
    paso = self.paso() + 1  }
  
  method moveLeft() {
    position = position.left(1)
    direction = "1"
    paso = self.paso() + 1
  }
  
  method moveRight() {
    position = position.right(1)
    direction = "2"
    paso = self.paso() + 1
  }

}

object zombie {
  var property position = game.origin()
  var direction = "3"
  var property paso = 1
  
  method image() = (("z" + direction) + (paso % 3)) + ".png"
  
  method moveUp() {
    position = position.up(1)
    direction = "3"
    
    paso = self.paso() + 1
  }
  
  method moveDown() {
    position = position.down(1)
    direction = "0"
    
    paso = self.paso() + 1
  }
  
  method moveLeft() {
    position = position.left(1)
    direction = "1"
    
    paso = self.paso() + 1
  }
  
  method moveRight() {
    position = position.right(1)
    direction = "2"
    
    paso = self.paso() + 1
  }
  
  method seguir() {
    
    const aryaX = arya.position().toString().split("@")[0]
    return aryaX
  }
}