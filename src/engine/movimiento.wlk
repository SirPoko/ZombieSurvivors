import wollok.game.*
import src.entities.enemigos.*
import src.entities.personajes.*


object movimiento {
  var property posicionesOcupadas = []

  method comprobarAdyacencia(entity, target) {
    const difX = entity.position().x() - target.position().x()
    const difY = entity.position().y() - target.position().y()   
    return difX.abs() + difY.abs() == 1
  }

  method seguir2(entity, target) {
    const difX = entity.position().x() - target.position().x()
    const difY = entity.position().y() - target.position().y()
    game.say(entity, self.mayorX(difX, difY))
    if (self.mayorX(difX, difY)) {
      self.seguirEnX(difX, entity)
      
    } else {
      self.seguirEnY(difY, entity)
    }
  }

  method seguirEnX(dif, entity) {
    if (self.seguirPositivo(dif)) entity.moveRight(1) else entity.moveLeft(1)
  }

  method seguirEnY(dif, entity) {
    if (self.seguirPositivo(dif)) entity.moveUp(1) else entity.moveDown(1)
  }
  
  method mayorX(difX,difY) {
    return difX.abs() > difY.abs()    
  }
  
  method seguirPositivo(dif) {
    return dif < 0
  }

  method posicionOcupada(aDonde) = posicionesOcupadas.contains(aDonde)
  
  method posicionOcupada2(posicion) {
    

    return spawner.hayEnemigo(posicion) || posicion == link.position()
  }

  method actualizarPosicion(entity, nuevaPosicion) {
    
    const nuevasPosiciones = posicionesOcupadas.filter({ p => p != entity.position() }) // Filtrar las posiciones ocupadas para eliminar la posición anterior del objeto
    
    nuevasPosiciones.add(nuevaPosicion)

    posicionesOcupadas = nuevasPosiciones // Agregar la nueva posición de la entity
    
   
    
  }

}