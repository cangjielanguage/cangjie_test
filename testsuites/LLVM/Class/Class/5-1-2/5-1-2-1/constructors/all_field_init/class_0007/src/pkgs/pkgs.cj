package pkgs

class Data {
    var a : Int32 //EXPECTED: regex the uninitialized member variable 'a' is not initialized in the constructor of class or record
    let b : Int32  //EXPECTED: regex the uninitialized member variable 'b' is not initialized in the constructor of class or record

    let b1 : Array<Int32>  //EXPECTED: regex the uninitialized member variable 'b1' is not initialized in the constructor of class or record
    let b2 : List<Int32>[]  //EXPECTED: regex the uninitialized member variable 'b2' is not initialized in the constructor of class or record

    let b3 : Data  //EXPECTED: regex the uninitialized member variable 'b3' is not initialized in the constructor of class or record
}
