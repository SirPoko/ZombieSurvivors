import src.entities.arya.*

object movimiento {
    // calculamos hacia donde debe moverse el personaje para acercarse a arya
     method seguirAryaSentido(quien) = (arya.position().x() - quien.position().x()).abs() < (arya.position().y() - quien.position().y()).abs()
    
  
}