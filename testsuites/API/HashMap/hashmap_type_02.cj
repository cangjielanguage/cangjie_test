// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*

func main(): Int64 {
    var HashMap01:HashMap<IntNative,UIntNative> = HashMap<IntNative,UIntNative>([(1,2)])
    var HashMap02:HashMap<UIntNative,IntNative> = HashMap<UIntNative,IntNative> ([(1,2)])
    var value1 = HashMap01[1]
    var value2 = HashMap02[1]
    if ( HashMap01.size() != 1 ){
        return 1
    }
    if ( HashMap02.size() != 1 ){
        return 2
    }
    if ( value1 != 2 ){
        return 3
    }
    if  (value2 != 2 ){
        return 4
    }
    return 0
}
