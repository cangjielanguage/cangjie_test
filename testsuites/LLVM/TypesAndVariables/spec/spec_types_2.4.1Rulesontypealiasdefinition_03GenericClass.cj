// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class GenericClassA<T, V>{
}
class GenericClassB<T, V>{
}

type Class1<V> = GenericClassA<Int64, V>  // ok. ClassA is a generic class
type Class2<Value,V> = GenericClassB<Int64, V>
type Int<T> = Int32
func main(){
    return 0
}

