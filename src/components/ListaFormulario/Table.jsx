import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import Paper from "@mui/material/Paper";
import { useSelector } from "react-redux";
import { selectAllUsers } from "../../features/dataSlice";
import { useDispatch } from "react-redux";
import { userDeleted } from "../../features/dataSlice";
import { useSnackbar } from "notistack";
import { Basurero } from "../../assets";

export default function Lista() {
  const dispatch = useDispatch();
  const { enqueueSnackbar } = useSnackbar();
  const users = useSelector(selectAllUsers);

  const handleDelete = (id) => {
    try {
      dispatch(userDeleted(id));
      enqueueSnackbar("Usuario Eliminado Correctamente", {
        variant: "success",
      });
    } catch (error) {
      enqueueSnackbar(`${error}`, {
        variant: "error",
      });
    }
  };

  return (
    <TableContainer component={Paper}>
      <Table sx={{ minWidth: 650 }} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell>Nombre</TableCell>
            <TableCell align="right">Rut Vendedor</TableCell>
            <TableCell align="right">Patente Vehículo</TableCell>
            <TableCell align="right">Marca Vehículo</TableCell>
            <TableCell align="right">Modelo Vehículo</TableCell>
            <TableCell align="right">Eliminar</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {users.map((user) => (
            <TableRow
              key={user.id}
              sx={{ "&:last-child td, &:last-child th": { border: 0 } }}
            >
              <TableCell component="th" scope="row">
                {user.nombre}
              </TableCell>
              <TableCell align="right">{user.rut}</TableCell>
              <TableCell align="right">{user.patente}</TableCell>
              <TableCell align="right">{user.marca}</TableCell>
              <TableCell align="right">{user.modelo}</TableCell>
              <TableCell align="right">
                <img
                  src={Basurero}
                  alt="Icon"
                  style={{
                    width: "20px",
                    marginRight: "5px",
                    cursor: "pointer",
                  }}
                  onClick={() => handleDelete(user.id)}
                />
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
}
