// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let b = Array<String>(["a", "b", "c"])
		b.set(0, "d");
		b.set(1, "d");
		b.set(2, "d");

    if(b[0] != "d" || b[1] != "d" || b[2] != "d"){
      return 2
    }
    return 0
}
