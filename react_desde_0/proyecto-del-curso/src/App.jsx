import { useEffect, useState } from 'react'
import axios from 'axios'
import './App.css'
import Card from './Components/Card'

function App() {

  const [coins, setCoins] = useState([])

  useEffect(() => {
    axios.get('https://api.coincap.io/v2/assets')
      .then(data => {
        setCoins(data.data.data)
      })
      .catch(error => console.log(error))
  }, [])

  if (coins.length === 0) {
    return <h1>Loading...</h1>
  }

  return (
    <>
    <div style={{display: 'flex', alignItems: 'space-between', width: '100vw'}}>
      <h1 style={{color: "white"}}>Lista de criptomonedas</h1>
      <div style={{width: '80%', justifyItems: 'end'}}>
        <h3 style={{color: "white"}}>Nombre</h3>
      </div>
    </div>
      <div className='card__Container'>
      {
        
        coins.map(
          ({ id, name, priceUsd, symbol, changePercent24Hr }) => (
            <Card id={id} nombre={name} precio={priceUsd} simbolo={symbol} cambio24hrs={changePercent24Hr} />
          )
        )
      }
      </div>
    </>
  )
}

export default App
