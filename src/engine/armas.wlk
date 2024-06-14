import personajes.*
import wollok.game.*
class Armas {
  const property damage = 1
  const property empuje = 1
  const property enfriamiento = 1
  const property rangoX = 1
  const property rangoY = 2
  method image() = "arma.png"

    method ataque(entity) {  
      var posicionX = entity.position().x()
      var posicionY = entity.position().y()

      if (entity.direction() == "2") {
        game.addVisual(new Golpe(position = game.at(posicionX + 1, posicionY + 1)))
        game.addVisual(new Golpe(position = game.at(posicionX + 2, posicionY + 1)))
        game.addVisual(new Golpe(position = game.at(posicionX + 1, posicionY)))
        game.addVisual(new Golpe(position = game.at(posicionX + 2, posicionY)))
        game.addVisual(new Golpe(position = game.at(posicionX + 1, posicionY - 1)))
        game.addVisual(new Golpe(position = game.at(posicionX + 2, posicionY - 1)))
      } 
    }
}

class Golpe {
    var property position = game.origin()
    method image() = "x.png" //imagenes y animacion al caminar
    
}

object espada inherits Armas {

}

