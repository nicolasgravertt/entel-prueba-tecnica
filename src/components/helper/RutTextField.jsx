/* eslint-disable react/prop-types */
import TextField from "@mui/material/TextField";
import MaskedInput from "react-text-mask";

const RutMask = (props) => {
  const { inputRef, ...other } = props;

  const rutMask = (value) => {
    const rut = value.replace(/[^0-9kK]/g, "");
    const rutArray = rut.split("");
    if (rutArray.length > 8) {
      rutArray.splice(8, 0, "-");
    }
    return rutArray.join("");
  };

  return (
    <MaskedInput
      {...other}
      ref={inputRef}
      mask={[/\d/, /\d/, /\d/, /\d/, /\d/, /\d/, /\d/, /\d/, "-", /[0-9kK]/]}
      placeholderChar={"\u2000"}
      showMask
      guide={false}
      keepCharPositions
      pipe={rutMask}
    />
  );
};

const RutTextField = (props) => {
  return (
    <TextField
      {...props}
      InputProps={{
        inputComponent: RutMask,
      }}
    />
  );
};

export default RutTextField;
