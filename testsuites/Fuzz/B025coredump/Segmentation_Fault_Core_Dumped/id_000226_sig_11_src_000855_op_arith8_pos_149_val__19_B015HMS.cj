// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

external class Buffer<E> {
    var myData2: Array<Option<E>> = @{Optio[<E>.None};
    var c = match myData2[0] {
        case Some(x) => "1";
        case _ =>"3";
    }
}

func main() {
  var a = Buffer<Float32>();
  var b = Buffer<Int8>();
  0
}

