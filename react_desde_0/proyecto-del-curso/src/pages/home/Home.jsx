import React from 'react'
import { Link } from 'react-router-dom'

const Home = () => {
  return (
    <>
        <h1> Hola, Bienbenido a EDmarket</h1>
        <p>Cónoce las 100 criptos mas usadas</p>
        <Link to="/criptomonedas">Ver criptomonedas</Link>
    </>
  )
}

export default Home