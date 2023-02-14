import React from 'react'
import { useParams } from 'react-router-dom'

const CriptoPage = () => {

    const params = useParams();

  return (
    <div>CriptoPage {params.id}</div>
  )
}

export default CriptoPage