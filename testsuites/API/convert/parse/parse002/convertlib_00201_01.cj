// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import convert.*

func getResultParse<T>(f: (String)-> Option<T>, arg: String, default: T): T{
    var parse = f(arg)
    var res = matchResult<T>(parse, default)
    return res
}

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(x) => x
        case $None => default
    }
    return result
}


func main():Int64 {
    var res9 = getResultParse<Float16>(parseFloat16, "-65504.0", 0.1)
    var res9_1 = getResultParse<Float16>(parseFloat16, "6.104e-5", 0.1)
    var res9_2 = getResultParse<Float16>(parseFloat16, "65504.0", 0.1)
    var res10 = getResultParse<Float32>(parseFloat32, "-3.4e38", 0.1)
    var res10_1 = getResultParse<Float32>(parseFloat32, "1.18e-38", 0.1)
    var res10_2 = getResultParse<Float32>(parseFloat32, "3.4e38", 0.1)
    var res11 = getResultParse<Float64>(parseFloat64, "-1.79e308", 0.1)
    var res11_1 = getResultParse<Float64>(parseFloat64, "2.23e-308", 0.1)
    var is_in_result11_1: Bool = 2.23e-308 - res11_1 < 0.00000001
    var res11_2 = getResultParse<Float64>(parseFloat64, "1.79e308", 0.1)

    if (res9 != -65504.0) {
        return 1
    }
    if (res9_1 != 6.104e-5) {
        return 1
    }
    if (res9_2 != 65504.0) {
        return 1
    }
    if (res10 != -3.4e38) {
        return 1
    }
    if (res10_1 != 1.18e-38) {
        return 1
    }
    if (res10_2 != 3.4e38) {
        return 1
    }
    if (res11 != -1.79e308) {
        return 1
    }
    if (!is_in_result11_1) {
        return 1
    }
    if (res11_2 != 1.79e308) {
        return 1
    }


    return 0
}