import personajes.*

class Armas {
  const property damage = 1
  const property empuje = 1
  const property enfriamiento = 1
  const property rangoX = 1
  const property rangoY = 2
  method image() = "arma.png"

    method ataque(entity) {  
      if (entity.direction() == "2") {
        game.addVisual(new Golpe(position = game.at(entity.position().up(1), entity.position().right(1))))
        game.addVisual(new Golpe(position = game.at(entity.position().up(1), entity.position().right(2))))
        game.addVisual(new Golpe(position = game.at(entity.position().up(0), entity.position().right(1))))
        game.addVisual(new Golpe(position = game.at(entity.position().up(0), entity.position().right(2))))
        game.addVisual(new Golpe(position = game.at(entity.position().up(-1), entity.position().right(1))))
        game.addVisual(new Golpe(position = game.at(entity.position().up(-1), entity.position().right(2))))
        } 
      
    
    
    }
}

class Golpe {
    var property position 
    visual
}

object espada inherits Armas {

}

