class Orbes{

    var property position
    var property step = 1
    const exp = 1
    method image() = "exp0" + (step % 5) + ".png"
    
    method serAgarrado() {
      link.ganarExp(exp)
      game.removeVisual(self)
    }


} 