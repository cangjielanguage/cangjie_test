package pkgs

external record Data { //EXPECTED: regex value type recursive detected: 'Data->Data'
  let a : Data
}
