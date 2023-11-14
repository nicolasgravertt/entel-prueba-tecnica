import Header from "../../components/Formulario/Header";
import TextField from "@mui/material/TextField";
import { Formik, Form, Field } from "formik";
import * as yup from "yup";
import { Divider } from "@mui/material";
import { useDispatch } from "react-redux";
import { userAdded } from "../../features/dataSlice";
import { useSnackbar } from "notistack";
import "./Formulario.css";

const validationSchema = yup.object().shape({
  nombre: yup.string().required("Nombre es requerido"),
  rut: yup
    .string()
    .matches(/^[0-9]{1,2}\.?[0-9]{3}\.?[0-9]{3}-?[0-9kK]$/, "RUT Invalido")
    .required("Rut requerido."),
  patente: yup.string().required("patente es requerida"),
  marca: yup.string().required("marca es requerida"),
  modelo: yup.string().required("modelo es requerido"),
  precio: yup.string().required("precio es requerido"),
});

const initialValues = {
  nombre: "",
  rut: "",
  patente: "",
  marca: "",
  modelo: "",
  precio: "",
};

const Formulario = () => {
  const dispatch = useDispatch();
  const { enqueueSnackbar } = useSnackbar();
  const handleSubmit = (values, { resetForm }) => {
    try {
      dispatch(userAdded(values));
      resetForm();
      enqueueSnackbar("Usuario Agregado Correctamente", { variant: "success" });
    } catch (error) {
      enqueueSnackbar(`${error}`, {
        variant: "error",
      });
    }
  };

  return (
    <>
      <Header />
      <div className="flex-form-container">
        <div className="form-container">
          <div className="form-container-title">
            <h2>Nuevo Formulario</h2>
            <p>
              Lorem Ipsum is simply dummy text of the printing and typesetting
              industry. Lorem Ipsum has been the bed industrys standard dummy
              text ever since.
            </p>
          </div>
          <Formik
            initialValues={initialValues}
            validationSchema={validationSchema}
            onSubmit={handleSubmit}
          >
            {({ touched, errors }) => (
              <Form>
                <h3>Datos del vendedor:</h3>
                <div className="seller-form-container">
                  <Field
                    className="item-nombre"
                    id="nombre"
                    name="nombre"
                    label="Nombre Completo *"
                    helperText={touched.nombre && errors.nombre}
                    as={TextField}
                    error={Boolean(touched.nombre && errors.nombre)}
                  />
                  <Field
                    id="rut"
                    name="rut"
                    label="Rut Vendedor *"
                    helperText={touched.rut && errors.rut}
                    as={TextField}
                    error={Boolean(touched.rut && errors.rut)}
                  />
                </div>
                <Divider style={{ paddingTop: "20px" }} />
                <h3>Datos del vehículo:</h3>
                <div className="vehicle-form-container">
                  <Field
                    id="patente"
                    name="patente"
                    label="Patente del vehículo *"
                    helperText={touched.patente && errors.patente}
                    as={TextField}
                    error={Boolean(touched.patente && errors.patente)}
                  />
                  <Field
                    id="marca"
                    name="marca"
                    label="Marca del vehículo *"
                    helperText={touched.marca && errors.marca}
                    as={TextField}
                    error={Boolean(touched.marca && errors.marca)}
                  />
                  <Field
                    id="modelo"
                    name="modelo"
                    label="Modelo del vehículo *"
                    helperText={touched.modelo && errors.modelo}
                    as={TextField}
                    error={Boolean(touched.modelo && errors.modelo)}
                  />
                  <Field
                    id="precio"
                    name="precio"
                    label="Precio del vehículo *"
                    helperText={touched.precio && errors.precio}
                    as={TextField}
                    error={Boolean(touched.precio && errors.precio)}
                  />
                </div>
                <Divider style={{ paddingTop: "20px" }} />
                <div className="button-container">
                  <button type="submit">Enviar</button>
                </div>
              </Form>
            )}
          </Formik>
        </div>
      </div>
    </>
  );
};

export default Formulario;
