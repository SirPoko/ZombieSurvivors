import personajes.*
import wollok.game.*
import src.entities.zombie.*

class Armas {
  const property damage = 1
  const property empuje = 1
  const property enfriamiento = 1
  const property rangoX = 1
  const property rangoY = 2
  var property area = []
  
  method image() = "arma.png"
  
  method generarGolpe(x, y) {
    const posicionX = x
    
    const posicionY = y
  }
  
  method ataque(entity) {
    const posicionX = entity.position().x()
    const posicionY = entity.position().y()
    if (entity.direction() == "2") {
      area.add(game.at(posicionX + 1, posicionY + 1))
      area.add(game.at(posicionX + 2, posicionY + 1))
      area.add(game.at(posicionX + 1, posicionY))
      area.add(game.at(posicionX + 2, posicionY))
      area.add(game.at(posicionX + 1, posicionY - 1))
      area.add(game.at(posicionX + 2, posicionY - 1))
    }
    const golpeados = self.verificarGolpe()
    golpeados.forEach(
      { e => e.perderVida(damage)})
    area = []
  }
  
  method verificarGolpe() {
    return spawn.zombieL().filter(
      { enemigo => area.contains(enemigo.position()) }
    )
  }
}

class Golpe {
  var property position = game.origin()
  var property fuerza
  
  method image() = "x.png" //imagenes y animacion al caminar
}

object espada inherits Armas {
  
}