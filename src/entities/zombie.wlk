import wollok.game.*
import src.engine.movimiento.*
import src.entities.arya.*
import src.engine.personajes.*

class Zombies {
  var property position = game.at(3, 3)
  var property direction = "0"
  var property paso = 1
  var property vidaMax = 0
  var property vidaActual = 0
  
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
  
  method chocar(entity) {
    game.say(arya, "auch")
    
  }

  // metodos para ganar o perder vida

  method perderVida(cantidad) {
    game.say(self,"Ay me pegaron:" + cantidad)
    vidaActual = (vidaActual - cantidad).max(0)
     movimiento.actualizarPosicion(self,self.position().right(1))
    position = position.right(1)
  }

  method ganarVida(cantidad) {
    vidaActual = (vidaActual + cantidad).min(vidaMax)
  }
} 


//Spawn de zombies

object spawn {
  var property zombieL = []
  
  method zombie(cantidad) {
    if (zombieL.size() < cantidad) {
      const zombieNew = new Zombies()
      game.addVisual(zombieNew)
      zombieL.add(zombieNew)
    }
  }
  
  
  method moverZombies() {
    if (zombieL.size() > 0) zombieL.forEach({ z => movimiento.seguir(z, link) })
  }

}