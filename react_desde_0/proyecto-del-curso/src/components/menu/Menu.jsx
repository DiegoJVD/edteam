import { NavLink } from "react-router-dom"
import "./Menu.css"

const Menu = () => {
  return (
    <>
      <nav className="main-menu">
        <u>
          <li><NavLink to="/">Inicio</NavLink></li>
          <li><NavLink to="/criptomonedas">Lista de Criptos</NavLink></li>
        </u>
      </nav>
    </>
  )
}

export default Menu