// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f
type mytype = Int32

foreign let a : mytype
foreign var b : mytype = 1

foreign{
    var c : mytype
    let d : mytype = 1
}
