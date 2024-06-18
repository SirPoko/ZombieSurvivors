import wollok.game.*



object movimiento {
  var property posicionesOcupadas = []

  method comprobarAdyacencia(entity, target) {
    const difX = entity.position().x() - target.position().x()
    const difY = entity.position().y() - target.position().y()   
    return difX.abs() + difY.abs() == 1
  }

  method seguir(entity, target) {
    const difX = entity.position().x() - target.position().x()
    const difY = entity.position().y() - target.position().y()
    if (difX.abs() > difY.abs()) {
      if (difX < 0) self.right(entity) else self.left(entity)
    } else {
      if (difY < 0) self.up(entity) else self.down(entity)
    }
  }

   method seguir2(entity, target) {
    const difX = entity.position().x() - target.position().x()
    const difY = entity.position().y() - target.position().y()
    if (difX.abs() > difY.abs()) {
      if (difX < 0) entity.moveRight(1) else entity.moveLeft(1)
    } else {
      if (difY < 0) entity.moveUp(1) else entity.moveDown(1)
    }
  }


  method posicionOcupada(aDonde) = posicionesOcupadas.contains(aDonde)

  //metodos para mover la entity en distintas direcciones, comprobando que la casilla no este ocupada
  method up(entity) {
    const aDonde = entity.position().up(1)
    
    if (posicionesOcupadas.contains(aDonde)) {
      
      entity.direction("3")
    } else {
      self.actualizarPosicion(entity, aDonde)
      entity.moveUp()
    }
  }
  
  method down(entity) {
    const aDonde = entity.position().down(1)
    if (posicionesOcupadas.contains(aDonde)) {
      
      entity.direction("0")
    } else {
      self.actualizarPosicion(entity, aDonde)
      entity.moveDown()
    }
  }
  
  method left(entity) {
    const aDonde = entity.position().left(1)
    if (posicionesOcupadas.contains(aDonde)) {
      
      entity.direction("1")
    } else {
      self.actualizarPosicion(entity, aDonde)
      entity.moveLeft()
    }
  }
  
  method right(entity) {
    const aDonde = entity.position().right(1)
    if (posicionesOcupadas.contains(aDonde)) {
      
      entity.direction("2")
    } else {
      self.actualizarPosicion(entity, aDonde)
      entity.moveRight()
    }
  }
  
  method actualizarPosicion(entity, nuevaPosicion) {
    
    const nuevasPosiciones = posicionesOcupadas.filter({ p => p != entity.position() }) // Filtrar las posiciones ocupadas para eliminar la posición anterior del objeto
    
    nuevasPosiciones.add(nuevaPosicion)

    posicionesOcupadas = nuevasPosiciones // Agregar la nueva posición de la entity
    
   
    
  }

}