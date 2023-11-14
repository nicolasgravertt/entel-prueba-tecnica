import { Outlet } from "react-router-dom";
import Navbar from "./Navbar/Navbar";
import "./Layout.css";

const Layout = () => {
  return (
    <>
      <Navbar />
      <div className="layout-container">
        <Outlet />
      </div>
    </>
  );
};

export default Layout;
