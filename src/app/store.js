import { configureStore } from "@reduxjs/toolkit";
import userReducer from "../features/dataSlice";

export const store = configureStore({
  reducer: {
    users: userReducer,
  },
});
