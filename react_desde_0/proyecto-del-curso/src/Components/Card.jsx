
function Card({ id, nombre, precio, simbolo, cambio24hrs }) {

    return (
        <>
            <div className="card">
                <div className="card__bar">
                </div>
                <div className="card__content">
                    <h3>{nombre}</h3>
                    <div  className="card__price">
                        <h5>Precio:</h5> {parseFloat(precio).toFixed(2)} USD
                    </div>
                    <div  className="card__price">
                        <h5>Codigo:</h5> {simbolo} USD
                    </div>
                    <div  className="card__price" style={{color: cambio24hrs >= 0 ? 'green' : 'red'}}>
                        <h5>Variacion 24hrs:</h5> {parseFloat(cambio24hrs).toFixed(2)} USD
                    </div>
                </div>

            </div>
        </>
    )
}

export default Card
