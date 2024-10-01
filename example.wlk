object universidad {
  
  method marchar() {
    game.width(21)
    game.height(10)
    game.boardGround("congreso.jpg")
    game.onTick(300,"agregar",{self.agregarManifestante()})
    keyboard.space().onPressDo{ 
      game.removeTickEvent("agregar")
      game.addVisual(convocatoria)
    }
  }

  method agregarManifestante(){
      const columna = (-1..game.width()-2).anyOne()
      const fila = (-2..1).anyOne()
      const nro = (1..5).anyOne()
      game.addVisual(new Manifestante(position = game.at(columna,fila),nro = nro))
  }    
}


class Manifestante{

  const nro = 1
  var position

  method image() = "manifestante" + nro + ".png"
  
  method position() = position
}

object convocatoria{

  method position() = game.origin().right(7)
  method image() = "marcha.jpg"
}