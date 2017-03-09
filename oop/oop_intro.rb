
42.class
# => Fixnum

Fixnum.superclass
# => Integer

Integer.superclass
# => Numeric

Numeric.superclass
# => Object

42.methods - Fixnum.methods
# => [:%, :&, :*, ... :to_f, :div, :divmod, :abs, ...]
