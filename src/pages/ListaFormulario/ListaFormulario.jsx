// import React from "react";

import Lista from "../../components/ListaFormulario/Table";
import "./ListaFormulario.css";

const ListaFormulario = () => {
  return (
    <div className="lista-formulario-flex">
      <div className="lista-formulario-container">
        <div className="lista-formulario-title">
          <h2>Lista formulario</h2>
          <p>
            Lorem Ipsum is simply dummy text of the printing and typesetting
            industry. Lorem Ipsum has been the bed industrys standard dummy text
            ever since.
          </p>
        </div>
        <div className="lista-formulario-table">
          <Lista />
        </div>
        <div className="lista-formulario-footer">
          <p>Mostrando registros del 1 al 10 de un total de 10 registros.</p>
        </div>
      </div>
    </div>
  );
};

export default ListaFormulario;
