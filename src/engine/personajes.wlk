import movimiento.*
class Personaje {
  var property position = game.center()
  var property direction = "3" //variable que indica hacia donde mira el personaje
  var property step = 1        //variable utilizada para "animar" el movimiento
  var property vidaMax = 0
  var property vidaActual = 0
  
  method image() = "id" + direction + (step % 3) + ".png" //imagenes y animacion al caminar
  
  method activarse() {
    
  }
  
  method atacar() {
    
  }

  //metodos para mover el personaje
  method moveUp(dist) {
    const posicionSiguiente = self.position().up(dist)
    
    if (movimiento.posicionOcupada(posicionSiguiente))
    direction = "3"
    else
    movimiento.actualizarPosicion(self,self.position().up(dist))
    direction = "3"
    step = self.step() + 1
    position = position.up(dist)  
  }
  
  

  method moveDown(dist) {
    const posicionSiguiente = self.position().down(dist)
    
    if (movimiento.posicionOcupada(posicionSiguiente))
    direction = "0"
    else
    movimiento.actualizarPosicion(self,self.position().down(dist))
    direction = "0"
    step = self.step() + 1
    position = position.down(dist)  
  }
  
  method moveLeft(dist) {
    const posicionSiguiente = self.position().left(dist)
    
    if (movimiento.posicionOcupada(posicionSiguiente))
    direction = "1"
    else
    movimiento.actualizarPosicion(self,self.position().left(dist))
    direction = "1"
    step = self.step() + 1
    position = position.left(dist)  
  }
  
  method moveRight(dist) {
    const posicionSiguiente = self.position().right(dist)
    
    if (movimiento.posicionOcupada(posicionSiguiente))
    direction = "2"
    else
    movimiento.actualizarPosicion(self,self.position().right(dist))
    direction = "2"
    step = self.step() + 1
    position = position.right(dist)  
  }

//metodos para empujar el personaje
  method pushUp(dist) {
    position = position.up(dist)
    movimiento.actualizarPosicion(self,self.position().up(dist))
  }
  
  method pushDown(dist) {
    movimiento.actualizarPosicion(self,self.position().down(dist))
    position = position.down(dist)
  }
  
  method pushLeft(dist) {
    movimiento.actualizarPosicion(self,self.position().left(dist))
    position = position.left(dist)
  }
  
  method pushRight(dist) {
     movimiento.actualizarPosicion(self,self.position().right(dist))
    position = position.right(dist)
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

object link inherits Heroe {
    override method image() = "a" + direction + (step % 3) + ".png"
}


