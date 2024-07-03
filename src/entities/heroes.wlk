import src.entities.personajes.*
import src.engine.armas.*
class Heroe inherits Personaje {
  var equipamiento = []
  var exp = 0
  var nivel = 1

  method ganarExp(cantidad) {
    exp =+ cantidad
  }

  method subirNivel() {
    
  }
}



object link inherits Heroe(vidaMax = 100, vidaActual = 100) {
  override method image() = "a" + direction + (step % 3) + ".png"
  override method atacar() {
    game.say(self,"Toma esto!!")
    espada.ataque(self)
  }
  
}