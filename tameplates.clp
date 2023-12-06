
(deftemplate smartphone
        (slot prod-id)
        (multislot nombre)
        (slot marca)
        (slot modelo)
        (slot precio)
)

(deftemplate computer
        (slot prod-id)
        (slot marca)
        (slot procesador)
        (slot grafica)
        (slot precio)
)

(deftemplate accesory                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   	  (slot prod-id)
        (multislot nombre)
        (slot marca)
        (slot precio)
)

(deftemplate costumer
        (slot costumer-id)
        (multislot nombre)
        (slot phone)
)

(deftemplate order-sale
        (slot folio)
        (slot prod-id)
        (slot costumer-id)
        (slot number-card)
        (slot cantidad (default 1))
)

(deftemplate credit-card
        (slot number-card)
        (slot costumer-id)
        (slot banco)
        (slot grupo)
        (slot mes-exp (type INTEGER))
        (slot ano-exp (type INTEGER))
)

(deftemplate voucher
        (slot number-card)
        (slot costumer-id)
        (slot grupo)
        (slot mes-exp (type INTEGER))
        (slot ano-exp (type INTEGER))
)
