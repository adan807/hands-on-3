
;; ( 1 )   Define una regla para encontrar a los clientes que no compraron nada

(defrule client-no-compra
    (costumer (costumer-id ?id) (nombre ?nom))
    (not (order-sale (folio ?folio) (costumer-id ?id)))
    => 
    (printout t ?nom " NO ha comprado nada!!!. " crlf)
)


;; ( 2 )   Define una regla para encontrar a los clientes compraron telefonos

(defrule compro-tel
    (costumer (costumer-id ?id) (nombre ?nom))
    (order-sale (prod-id ?pr) (costumer-id ?id))
    (smartphone (nombre ?tel) (prod-id ?pr))
    =>
    (printout t "El cliente: " ?nom " ha comprado un telefono: " ?tel crlf)
)


;; ( 3 )   Define una regla para encontrar a los clientes compraron Iphone

(defrule compro-Apple
    (costumer (costumer-id ?id) (nombre ?nom))
    (order-sale (prod-id ?pr) (costumer-id ?id))
    (smartphone (nombre ?tel) (prod-id ?pr) (marca Apple))
    =>
    (printout t ?nom ": compro un Iphone" crlf)
)

;; ( 4 )   Define una regla para encontrar a los clientes que gastaron mas de 10000 pesos

(defrule compro-caro
    (costumer (costumer-id ?id) (nombre ?nom))
    (order-sale (prod-id ?pr) (costumer-id ?id))
    (smartphone (nombre ?tel) (prod-id ?pr) (precio ?precio))
    (test ( > ?precio 10000))
    =>
    (printout t ?nom " gastó más de 10 000 en su telefono" crlf)
)

;; ( 5 )   Define una regla para encontrar a los clientes que compraron computadoras

(defrule compro-pc
    (costumer (costumer-id ?id) (nombre ?nom))
    (order-sale (prod-id ?pr) (costumer-id ?id))
    (computer (marca ?pc) (prod-id ?pr))
    =>
    (printout t "El cliente: " ?nom ". Ha comprado una PC:  " ?pc crlf)
)


;; ( 6 )   Define una regla para encontrar a los clientes que compraron una PC con procesador intel

(defrule compro-pc-processor
    (costumer (costumer-id ?id) (nombre ?nom))
    (order-sale (prod-id ?pr) (costumer-id ?id))
    (computer (procesador Intel) (prod-id ?pr))
    =>
    (printout t ?nom " -- Compró una Computadora con un Procesador Intel" crlf)
)

;; ( 7 )   Define una regla para encontrar a los clientes que tienen tarjetas de credito y de que banco

(defrule type-credit-card
    (costumer (costumer-id ?id) (nombre ?nom))
    (credit-card (banco ?bank) (costumer-id ?id))
    =>
    (printout t ?nom " -- tiene una tarjeta de credito de [ " ?bank " ]" crlf)
)

;; ( 8 )   Define una regla para encontrar a los clientes que tienen tarjetas de vales y de que grupo

(defrule type-voucher
    (costumer (costumer-id ?id) (nombre ?nom))
    (voucher (grupo ?group) (costumer-id ?id))
    =>
    (printout t ?nom "-- tiene una tarjeta de vales del grupo: + " ?group " +" crlf)
)

;; ( 9 )   Define una regla para encontrar a los clientes que tienen una tarjeta de credito que expira antes del 2027

(defrule ano-exp-credit-card
    (costumer (costumer-id ?id) (nombre ?nom))
    (credit-card (costumer-id ?id) (ano-exp ?ano))
    (test (< ?ano 27))
    =>
    (printout t "la tarjeta de credito de: " ?nom " expira antes del Enero del 2027." crlf)
)

;; ( 10 )   Define una regla para encontrar a los clientes que tienen una tarjeta de vales que expira mas alla de marzo del 2025

(defrule ano-exp-voucher
    (costumer (costumer-id ?id) (nombre ?nom))
    (voucher (costumer-id ?id) (ano-exp ?ano) (mes-exp ?mes))
    (test (or (and ( > ?mes 3) (>= ?ano 25)) (> ?ano 25)))
    =>
    (printout t "la tarjeta de vales de: " ?nom " tiene vigencia despues de Marzo del 2025" crlf)
)

;; ( 11 )   Define una regla para ofertar si compra mas de un Redmi Note 12 Obtiene un 40% de descuento en la siguiente compra

(defrule compro-note
    (costumer (costumer-id ?id) (nombre ?nom))
    (order-sale (prod-id ?pr) (costumer-id ?id) (cantidad ?cant))
    (smartphone (nombre ?tel) (prod-id ?pr) (marca Redmi) )
    (test ( > ?cant 1))
    =>
    (printout t ?nom "--  Tiene un 40% de Descuento en su siguiente compra. ya que compró "?cant" telefono Redmi, de la familia: " ?tel crlf)
)

;; ( 12 )   Define una regla para ofertar si se compran mas de 4 accesorios se tiene un precio de mayoreo del 80%

(defrule compro-cosas-apple
    (costumer (costumer-id ?id) (nombre ?nom))
    (order-sale (prod-id ?pr) (costumer-id ?id) (cantidad ?cant))
    (accesory (prod-id ?pr) (nombre ?acc) (precio ?pre))
    (test ( > ?cant 4 ))
    =>
    (printout t ?nom "-- Tuvo un precio de mayoreo porque compró más de 4 accesorios:  " ?cant " " ?acc " De: $" ?pre " a $" (* ?pre 0.80) " por unidad." crlf)
)

;; ( 13 )   Define una regla para ofertar si compra mas de una computadora con grafica Nvidia se tiene un descuendo de 30% en la compra total

(defrule compro-cosas-Nvidia
    (costumer (costumer-id ?id) (nombre ?nom))
    (order-sale (prod-id ?pr) (costumer-id ?id) (cantidad ?cant))
    (computer (prod-id ?pr) (marca ?mar) (procesador ?proc) (grafica Nvidia) (precio ?pre))
    (test ( > ?cant 1 ))
    =>
    (printout t ?nom "--  Obtuvo 30% Desc en el total final: Por comprar mas de 1 PC con grafica Nvidia. De pagar: $" ?pre " a $"  (* ?pre 0.70) "  por unidad." crlf)
)

;; ( 14 )   Define una regla para ofertar un 2x1 cuando compres PC con procesador AMD y con credit-card BBVA

(defrule compro-cosas-AMD
    (costumer (costumer-id ?id) (nombre ?nom))
    (order-sale (prod-id ?pr) (costumer-id ?id) (number-card ?number))
    (computer (prod-id ?pr) (marca ?mar) (procesador AMD) (precio ?pre))
    (credit-card (number-card ?number) (banco BBVA))
    =>
    (printout t ?nom "-- Tiene la oferta de 2 X 1 en su siguiente compra, ya que compró una PC con procesador AMD, con una tarjeta de credito BBVA" crlf)
)

;; ( 15 )   Define una regla para ofertar 

(defrule compro-cosas-AMD
    (costumer (costumer-id ?id) (nombre ?nom))
    (order-sale (prod-id ?pr) (costumer-id ?id) (number-card ?number))
    (computer (prod-id ?pr) (marca ?mar) (procesador Intel) (precio ?pre))
    (credit-card (number-card ?number) (banco Santander))
    =>
    (printout t ?nom "-- Tiene la oferta de 3 x 2 en accesorios en su siguiente compra, ya que compró una PC con procesador Intel, con una tarjeta de credito Santander" crlf)
)

;; ( 16 )   Define una regla para ofertar 

(defrule compro-cosas-AMD
    (costumer (costumer-id ?id) (nombre ?nom))
    (order-sale (prod-id ?pr) (costumer-id ?id) (number-card ?number) (cantidad ?cant))
    (accesory (prod-id ?pr) (marca Sony) (precio ?pre))
    (voucher (number-card ?number) (grupo Edenred))
    (test ( > ?cant 5 ))
    =>
    (printout t ?nom "-- Tiene descuento de 60% en precio por unidad, por compra de mayoreo, en audifonos Sony con tarjeta de vales Edenred.  Cantidad comprada: " ?cant ". De $" ?pre " a $" (* ?pre 0.40)  crlf)
)

;; ( 17 )   Define una regla para ofertar un 10% de descuento en productos Logitech

(defrule compro-cosas-Logitech
    (costumer (costumer-id ?id) (nombre ?nom))
    (order-sale (prod-id ?pr) (costumer-id ?id) )
    (accesory (prod-id ?pr) (marca Logitech) (precio ?pre))
    =>
    (printout t ?nom "-- Tiene un 10% de descuento en el precio original em productos Logitech. De: $" ?pre " a $" (* ?pre 0.90)   crlf)
)

;; ( 18 )   Define una regla para ofertar un 5% de descuento por pagar con tarjetas MasterCard

(defrule compro-grupo-MasterCard
    (costumer (costumer-id ?id) (nombre ?nom))
    (order-sale (prod-id ?pr) (costumer-id ?id) (number-card ?number))
    (smartphone (prod-id ?pr) (marca ?mar) (precio ?pre))
    (credit-card (number-card ?number) (grupo MasterCard))
    =>
    (printout t ?nom "-- Tiene un 5% de descuento por comprar un smartphone con una tarjeta MasterCard. De: $" ?pre " a $" (* ?pre 0.95) crlf)
)

;; ( 19 )   Define una regla para ofertar un 12% de descuendo al pagar con tarjetas VISA

(defrule compro-grupo-VISA
    (costumer (costumer-id ?id) (nombre ?nom))
    (order-sale (prod-id ?pr) (costumer-id ?id) (number-card ?number))
    (smartphone (prod-id ?pr) (marca ?mar) (precio ?pre))
    (credit-card (number-card ?number) (grupo VISA))
    =>
    (printout t ?nom "-- Tiene un 12% de descuento por comprar un smartphone con una tarjeta VISA. De: $" ?pre " a $" (* ?pre 0.95) crlf)
)


;; ( 20 )   Define una regla para identificar a los mayoristas

(defrule compro-grupo
    (costumer (costumer-id ?id) (nombre ?nom))
    (order-sale (prod-id ?pr) (costumer-id ?id) (cantidad ?cant))
    (or (smartphone (prod-id ?pr) (nombre ?name)) (computer (prod-id ?pr) (marca ?name)) (accesory (prod-id ?pr) (marca ?name)))
    
    (test ( > ?cant 4 ))
    =>
    (printout t ?nom "-- Ejerció una compra mayorista, comprando productos de [ " ?name " ] con una cantidad de: "?cant" productos comprados" crlf)
)

