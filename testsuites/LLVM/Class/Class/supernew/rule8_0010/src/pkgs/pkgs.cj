package pkgs

external class Data{
	init(){   //EXPECTED: regex recursive constructor calling detected
	  this(true)
	}

  init(i: Bool)	{
    this()
  }
}