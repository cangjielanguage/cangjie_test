// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

external class Buffer<E> {
    var myData2: Array<Option<E>> = @{Option<E>.None};
    var c = match (myData2[0]) {
        case Some(x) => "1";
        case _ =>"3";
    }
}

func main() {
  var a = Buffer<Float32>();
  var b = Buffer<Int8>();
  0
}

