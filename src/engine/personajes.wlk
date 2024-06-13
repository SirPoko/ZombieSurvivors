import movimiento.*
class Personaje {
  var property position = game.center()
  var property direction = "0" //variable que indica hacia donde mira el personaje
  var property step = 1        //variable utilizada para "animar" el movimiento
  var property vidaMax = 0
  var property vidaActual = 0
  
  method image() = "id" + direction + (step % 3) + ".png" //imagenes y animacion al caminar
  
  method activarse() {
    
  }
  
  method atacar() {
    
  }

  //metodos para mover el personaje
  method moveUp() {
    if (movimiento.movValido(self.position().up(1)))
    direction = "3"
    else
    movimiento.actualizarPosicion2(self,self.position().up(1))
    direction = "3"
    step = self.step() + 1
    position = position.up(1)
    
    
    
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

//metodos para empujar el personaje
  method pushUp() {
    position = position.up(1)
  }
  
  method pushDown() {
    position = position.down(1)
  }
  
  method pushLeft() {
    position = position.left(1)
  }
  
  method pushRight() {
    position = position.right(1)
  }
  
  // metodos para ganar o perder vida

  method perderVida(cantidad) {
    vidaActual = (vidaActual - cantidad).max(0)
  }

  method ganarVida(cantidad) {
    vidaActual = (vidaActual + cantidad).min(vidaMax)
  }


}

class Heroe inherits Personaje {
  
}

class Enemigo inherits Personaje {
  override method activarse  () {
    
  }

  method seguir() {
    
  }

}