// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let b = Array<Float16>([1.0, 2.0, 3.0])
		b[0] = 4.0;
		b[1] = 4.0;
		b[2] = 4.0;

     let num1: Float16 = match (b.get(0)) {
      case Some(4.0) => 4.0 
      case _ => 0.0
    }

     let num2: Float16 = match (b.get(1)) {
      case Some(4.0) => 4.0 
      case _ => 0.0
    }

     let num3: Float16 = match (b.get(2)) {
      case Some(4.0) => 4.0 
      case _ => 0.0
    }

    if(num1 != 4.0 || num2 != 4.0 || num3 != 4.0){
      return 2
    }
    return 0
}
