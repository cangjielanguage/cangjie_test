// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type intarray = Array<Int32>
type floatarray = Array<Float32>

record Data<T> {
    let width: T

    init(x: T){
        width = x
    }
}

func main(): Int64 {
    let array1: intarray = @{1, 2}
    let array2: floatarray = @{1.01, 2.01}
    let data1: Data<intarray> = Data<intarray>(array1)
    let data2: Data<floatarray> = Data<floatarray>(array2)
    var res1 = data1.width
    var res2 = data2.width
    if (res1[0] == 1 && res2[1] < 2.02 && res2[1] > 2.00) {
        return 0
    }
    return 1
}
