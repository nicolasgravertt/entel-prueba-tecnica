import { createSlice } from "@reduxjs/toolkit";

const initialState = [
  {
    id: 1,
    nombre: "Nicolas",
    rut: "19999999-9",
    patente: "1AV2BA",
    marca: "Mercedez",
    modelo: "Modelo 1",
    precio: "5 pesos",
  },
  {
    id: 2,
    nombre: "Maria",
    rut: "12999999-9",
    patente: "ASDQWW",
    marca: "Kia",
    modelo: "Morning",
    precio: "20 pesos",
  },
];

const usersSlice = createSlice({
  name: "users",
  initialState,
  reducers: {},
});

export const selectAllUsers = (state) => state.users;

export default usersSlice.reducer;
