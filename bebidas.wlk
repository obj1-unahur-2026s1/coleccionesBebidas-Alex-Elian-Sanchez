import ingredientes.*

object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}

object licuadoDeFrutas {
  const ingredientes = [frutas, leche, hielo]

  method agregarIngrediente(ingrediente) = ingredientes.add(ingrediente)

  method rendimientoQueOtorga(dosisConsumida) =
    ingredientes.sum({i => i.nutrientes()}) * (dosisConsumida / 1000)
}

object aguaSaborizada {
  var property bebida = licuadoDeFrutas

  method rendimientoQueOtorga(dosisConsumida) = 1 + bebida.rendimientoQueOtorga(dosisConsumida*0.25)
}

object coctel {
  const bebidas = []

  method verBebidas() = bebidas
  method agregarBebida(bebida) = bebidas.add(bebida)
  method rendimientoQueOtorga(dosisConsumida) =
  bebidas.fold(1, {acum, b => b.rendimientoQueOtorga(dosisConsumida / bebidas.size()) * acum})
}