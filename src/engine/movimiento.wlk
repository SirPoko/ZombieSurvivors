import src.entities.arya.*

object movimiento {
    // calculamos hacia donde debe moverse el personaje para acercarse a arya
     method seguirDireccion(quien,aquien) = (aquien.position().x() - quien.position().x()).abs() < (aquien.position().y() - quien.position().y()).abs()
    
    method seguir(quien,aquien) {
      var axis = "x"
    }
}