// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<TimeUnit>([TimeUnit.Month,TimeUnit.Second])

enum TimeUnit {
    | Year| Month | Second 
}


func comp(lhs:TimeUnit, rhs:TimeUnit):Bool{
    let lhsPrefer: Bool = match (lhs) {
        case $Year => false
        case $Month => true
        case $Second => false
        case _ => false
    }

    let rhsPrefer: Bool = match (rhs) {
        case $Year => false
        case $Month => false
        case $Second => true
        case _ => false
    }
    
    if(!lhsPrefer && !rhsPrefer){
        return true
    }else{
        return false
    }
    
}

func main(): Int64 {

    a1.sortBy(comp)

    let enumSort3: Bool = match (a1[1]) {
        case $Year => false
        case $Month => true
        case $Second => false
        case _ => false
    }

    let enumSort4: Bool = match (a1[0]) {
        case $Year => false
        case $Month => false
        case $Second => true
        case _ => false
    }

    if(enumSort3 && enumSort4){
        return 0
    }
    return 1
}
