import personajes.*
import wollok.game.*
import src.entities.zombie.*
import src.engine.enemigos.*
class Armas {
  const property damage = 1
  const property empuje = 1
  const property enfriamiento = 1
  const property rangoX = 1
  const property rangoY = 2
  var property areaGolpeada = []
  
  method image() = "arma.png" 
  
  
  
  //logica para el ataque del arma
  method ataque(entity) {
    
  }
  //en este metodo se verifica si el area golpeada coincide con la posicion de los objetos en la lista indicada
  
  method verificarGolpe() = spawner.enemigos().filter(
    { enemigo => areaGolpeada.contains(enemigo.position()) }
  )
}

class AnimacionGolpe {
  var property position = game.origin()
  var property imagen  
  method image() = imagen + ".png" //imagenes y animacion al caminar
}

object espada inherits Armas {
  override method ataque(entity) {
    const posicionX = entity.position().x()
    const posicionY = entity.position().y()

    //se calcula el area golpeada en base a la posicion del personaje que esta atacando en el caso de la espada, el ataque se realiza a ambos lados del personaje.y()
    //se calcula el area golpeada en base a la posicion del personaje que esta atacando en el caso de la espada, el ataque se realiza a ambos lados del personaje
    
    areaGolpeada.add(game.at(posicionX - 1, posicionY + 1))
    areaGolpeada.add(game.at(posicionX - 2, posicionY + 1))
    areaGolpeada.add(game.at(posicionX - 1, posicionY))
    areaGolpeada.add(game.at(posicionX - 2, posicionY))
    areaGolpeada.add(game.at(posicionX - 1, posicionY - 1))
    areaGolpeada.add(game.at(posicionX - 2, posicionY - 1))
    areaGolpeada.add(game.at(posicionX + 1, posicionY + 1))
    areaGolpeada.add(game.at(posicionX + 2, posicionY + 1))
    areaGolpeada.add(game.at(posicionX + 1, posicionY))
    areaGolpeada.add(game.at(posicionX + 2, posicionY))
    areaGolpeada.add(game.at(posicionX + 1, posicionY - 1))
    areaGolpeada.add(game.at(posicionX + 2, posicionY - 1))
    
    self.animacionAtaque(entity)
    
    const golpeados = self.verificarGolpe()
    // cada uno de los enemigos golpeados recibe daño
    golpeados.forEach({ e => e.pushRight(empuje) })
    golpeados.forEach({ e => e.perderVida(damage) })
    //se vacia el area golpeada luego de ya haber realizado el daño
    areaGolpeada = []
  }

  method animacionAtaque(entity) {
    const posicionX = entity.position().x() -1
    const posicionY = entity.position().y() -2
    const golpeEspada = new AnimacionGolpe (position = game.at(posicionX , posicionY), imagen = "corteDerecha")
    game.sound("linkSword.wav").play()
    game.addVisual(golpeEspada)
    game.schedule(300, {game.removeVisual(golpeEspada)})
  }
}

