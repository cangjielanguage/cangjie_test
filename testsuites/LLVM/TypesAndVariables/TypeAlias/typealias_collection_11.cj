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
    let array2: floatarray = @{1.001, 2.001}
    var list2: List<Data<intarray>> = [Data<intarray>(array1)]
    var list3: List<Data<floatarray>> = [Data<floatarray>(array2)]
    let res1 = list2[0].width
    let res2 = list3[0].width

    if (res1[0] == 1 && (2.000 < res2[1] && res2[1] < 2.002)) {
        return 0
    }
    return 1
}
