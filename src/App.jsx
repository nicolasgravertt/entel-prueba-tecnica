import { Routes, Route } from "react-router-dom";
import Layout from "./components/Layout/Layout";
import Formulario from "./pages/Formulario/Formulario";
import ListaFormulario from "./pages/ListaFormulario/ListaFormulario";
import "./App.css";

function App() {
  return (
    <Routes>
      <Route path="/" element={<Layout />}>
        <Route index element={<Formulario />} />
        <Route path="listar" element={<ListaFormulario />} />
        <Route path="*" element={<h1>Not Found</h1>} />
      </Route>
    </Routes>
  );
}

export default App;
