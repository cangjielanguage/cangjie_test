// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// random seed:1614236150311

// All global variable need to be defined before use!
internal let var12 : Float64 = (-34.0);

external var var18 : Record8 = Record8();

internal record Record8 {
    Record8() {}
    var var21 : Int64 = 102;
}

func main(): Int64 {
    false;

    var var15 : Char = 'k';

    match match var12 {
            case _ => var15
        } {
        case _ => var18
    }.var21;

    // CRC Check All Variables

    return 0;
}
