import wollok.game.*
import src.entities.arya.*
import src.entities.zombie.*

object movimiento {
  // calculamos hacia donde debe moverse el personaje para acercarse a arya
  const movProhib = [arya.position()]
  method seguir(who, toWho) {
    
    const difX = who.position().x() - toWho.position().x()
    const difY = who.position().y() - toWho.position().y()
    
    if (difX.abs() > difY.abs()) {
      if (difX < 0) {
        self.right(who)
        
      } else {
        self.left(who)
        
      }
    } else {
      if (difY < 0) {
        self.up(who)
        
      } else {
        self.down(who)
        
      }
    }
  }
 
  
  method up(who) {
    const donde = who.position().up(1)    
    
    if (movProhib.contains(donde)) {
      game.say(arya, "no puede pasar")
    }
    
    else
    {
      who.moveUp()
    }
    
  }
  
  method down(who) {
    who.moveDown()
  }
  
  method left(who) {
    who.moveLeft()
  }
  
  method right(who) {
    who.moveRight()
  }


  
}


