import React from 'react'
import ReactDOM from 'react-dom/client'
import { BrowserRouter, Route, Routes, } from 'react-router-dom'
import App from './pages/app/App'
import Pagina404 from './pages/404'
import Cuadricula from './pages/cuadricula/Cuadricula'
import Home from './pages/home/Home'
import CriptoPage from './pages/cuadricula/CriptoPage'

ReactDOM.createRoot(document.getElementById('root')).render(

  <>
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<App />}>
          <Route index element={<Home />} />
        </Route>
        <Route path="/criptomonedas" element={<App />}>
          <Route index element={<Cuadricula />} />
          <Route path=":id" element={<CriptoPage />} />
        </Route>
        <Route path='*' element={<Pagina404 />} />
      </Routes>
    </BrowserRouter>
  </>

)
