import wollok.game.*
import src.engine.movimiento.*
import src.entities.arya.*
class Zombies {
  var property position = game.at(3, 3)
  var direction = "0"
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
    if (zombieL.size() > 0) {zombieL.forEach({ z => movimiento.seguir(z, arya) })}
    
  }
}