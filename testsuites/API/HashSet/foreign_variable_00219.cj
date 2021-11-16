// EXEC:%compiler %frontend -c %typecheck %stdx_cmp_opt %f

from std import collection.*
foreign let a : HashSet<Int32>
foreign var b : HashSet<Int32> = HashSet<Int32>([1])

foreign{
    var c : HashSet<Int32>
    let d : HashSet<Int32> = HashSet<Int32>([1])
}
