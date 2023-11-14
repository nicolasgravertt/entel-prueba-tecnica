import { Divider } from "@mui/material";
import { Laptop } from "../../assets";
import "./Header.css";

const Header = () => {
  return (
    <>
      <div className="form-header-container">
        <div className="form-header-text-container">
          <h1
            style={{ color: "blue", fontWeight: 400, whiteSpace: "nowrap" }}
            id="title"
          >
            Formulario <span style={{ fontWeight: 600 }}>de prueba</span>
          </h1>
        </div>
        <div className="form-header-image">
          <img id="laptop" src={Laptop} alt="laptop"></img>
        </div>
        <Divider className="divider" />
      </div>
    </>
  );
};

export default Header;
