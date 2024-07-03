import src.engine.movimiento.*
import src.engine.armas.*
import src.entities.personajes.*
import src.entities.heroes.*

class Enemigo inherits Personaje {
  const atkDamage
  
  override method activarse() {
    if (movimiento.comprobarAdyacencia(self, link)) self.atacar()
    else self.moverse()
  }
  
  method moverse() {
    
  }

  method dejarDrop() {
    
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
  const property enemigos = []
  
  
  method spawn() {
    if (enemigos.size() < 1) {
      const nuevoZombie = new Zombie()
      game.addVisual(nuevoZombie)
      enemigos.add(nuevoZombie)
    }
  }
  
  method activarEnemigos() {
    if (enemigos.size() > 0) enemigos.forEach({ z => z.activarse() })
  }
  
  method remove(enemigo) {
    if (enemigos.contains(enemigo)) {
      game.removeVisual(enemigo)
      enemigos.remove(enemigo)
    }
  }
  
  method hayEnemigo(posicion) {
    const posicionEnemigos = enemigos.map({ e => e.position() })
    return posicionEnemigos.contains(posicion)
  }
}