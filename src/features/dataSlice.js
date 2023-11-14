import { createSlice, nanoid } from "@reduxjs/toolkit";

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
  reducers: {
    userAdded: {
      reducer(state, action) {
        state.push(action.payload);
      },
      prepare(data) {
        return {
          payload: {
            id: nanoid(),
            ...data,
          },
        };
      },
    },
    userDeleted(state, action) {
      const userId = action.payload;
      return state.filter((user) => user.id !== userId);
    },
  },
});

export const selectAllUsers = (state) => state.users;

export const { userAdded, userDeleted } = usersSlice.actions;

export default usersSlice.reducer;
