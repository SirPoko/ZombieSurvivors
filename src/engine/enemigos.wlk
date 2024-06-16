import movimiento.*
import src.engine.personajes.*
import src.engine.armas.*

class Enemigo inherits Personaje {
  const atkDamage
  
  override method activarse() {
    if (movimiento.comprobarAdyacencia(self, link)) self.atacar()
    else self.moverse()
  }
  
  method moverse() {
    
  }
}

class Zombie inherits Enemigo (vidaMax = 10, vidaActual = 10, atkDamage = 5) {
  override method image() = (("z" + direction) + (step % 3)) + ".png"

  override method atacar() {
    const garrazo = new AnimacionGolpe(
      position = link.position(),
      imagen = "ataqueGarra"
    )
    link.perderVida(atkDamage)
    game.addVisual(garrazo)
    game.schedule(300, { game.removeVisual(garrazo) })
  }
  
  override method moverse() {
    movimiento.seguir2(self, link)
  }
}

object spawner {
  var property enemigos = []
  
  method spawn() {
    const nuevoZombie = new Zombie()
    if (enemigos.size() < 5) {game.addVisual(nuevoZombie)
    enemigos.add(nuevoZombie)}
    
  }
  
  method activarEnemigos() {
   if (enemigos.size() > 0) enemigos.forEach({ z => z.activarse()})}

  method remove(enemigo) {
    if (enemigos.contains(enemigo)) {
      game.removeVisual(enemigo)
      enemigos.remove(enemigo)
    }
  }
}