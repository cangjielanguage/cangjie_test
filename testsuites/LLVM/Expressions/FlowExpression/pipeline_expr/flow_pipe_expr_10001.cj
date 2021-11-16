// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func main(): Int64 {
    return { input:Int64=>input} |> {input:(Int64)->Int64 => input(0)}
}
