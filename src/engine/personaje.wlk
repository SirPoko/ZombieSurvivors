class Personaje {
  var property position = game.center()
  var property direction = "0" //variable que indica hacia donde mira el personaje
  var property step = 1        //variable utilizada para "animar" el movimiento
  
  method name() = ((direction) + (step % 3)) + ".png"
  
  method activarse() {
    
  }
  
  method atacar() {
    
  }

  
  
  //metodos para mover el personaje
  method moveUp() {
    position = position.up(1)
    direction = "3"
    step = self.step() + 1
  }
  
  method moveDown() {
    position = position.down(1)
    direction = "0"    
    step = self.step() + 1
  }
  
  method moveLeft() {
    position = position.left(1)
    direction = "1"
    step = self.step() + 1
  }
  
  method moveRight() {
    position = position.right(1)
    direction = "2"
    step = self.step() + 1
  }
}