import wollok.game.*
import src.entities.arya.*
import src.entities.zombie.*

object movimiento {
  // calculamos hacia donde debe moverse el personaje para acercarse a arya
  method seguir(who, toWho) {
    const difX = who.position().x() - toWho.position().x()
    const difY = who.position().y() - toWho.position().y()
    if (difX.abs() > difY.abs()) {
      if (difX > 0) {
        self.up(who)
        return "arriba"
      } else {
        self.down(who)
        return "abajo"
      }
    } else {
      if (difY > 0) {
        self.right(who)
        return "derecha"
      } else {
        self.left(who)
        return "izquierda"
      }
    }
  }
  
  method up(who) {
    who.moveUp()
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