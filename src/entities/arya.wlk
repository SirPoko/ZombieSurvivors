import wollok.game.*

object arya {
  var property position = game.center()
  var direccion = "3"
  var property paso = 1
  method image() = "a" + direccion + (paso % 3) + "f.png"
  
  method moveUp() {
    position = position.up(1)
    direccion = "3"
    paso = self.paso() + 1
  }
  
  method moveDown() {
    position = position.down(1)
    direccion = "0"
    paso = self.paso() + 1  }
  
  method moveLeft() {
    position = position.left(1)
    direccion = "1"
    paso = self.paso() + 1
  }
  
  method moveRight() {
    position = position.right(1)
    direccion = "2"
    paso = self.paso() + 1
  }

}
