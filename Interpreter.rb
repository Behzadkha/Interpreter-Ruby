#All the subclasses have the interpret function in common but the interpret function in the main class(IBXpr) should not be called.
class IBExpr
	def interpret()
		puts "Warning: called interpret on empty expression"
	end
	
end
class Cons < IBExpr #subclass of IBExpr similar to the provided c++ sample code.
	attr_accessor :constant
	def initialize(c)
		@constant = c
	end
	def interpret()
		if constant == true || constant == false #if the input is true or false, prints an error
			puts "Something went wrong"
			return -1
		end
		return constant #return the int
	end
end
class Neg < IBExpr
	attr_accessor :negative
	def initialize(e)
		@negative = e
	end
	def interpret()
		if negative.interpret == true || negative.interpret == false #if the input is true or false, prints an error
			puts "Something went wrong"
			return -1
		end
		return (- (negative.interpret))
	end
end
class Abs < IBExpr
	attr_accessor :absolute
	def initialize(e)
		@absolute = e
	end
	def interpret()
		r = absolute.interpret()
		if r == true || r == false
			puts "Something went wrong"
			return -1
		else 
			if r >= 0
				return r
			else
				return - r
			end
		end
		
	end
end
class Plus < IBExpr
	attr_accessor :subExp1, :subExp2
	def initialize(e1,e2)
		@subExp1 = e1
		@subExp2 = e2
	end
	def interpret()
		r1 = @subExp1.interpret()
		r2 = @subExp2.interpret()
		if r1 == true || r1 == false || r2 == true || r1 == false
			puts "Something went wrong"
			return -1
		end
		return r1 + r2
	end
end
class Times < IBExpr
	attr_accessor :subExp1, :subExp2
	def initialize(e1 ,e2)
		@subExp1 = e1
		@subExp2 = e2
	end
	def interpret()
		r1 = @subExp1.interpret()
		r2 = @subExp2.interpret()
		if r1 == true || r1 == false || r2 == true || r1 == false
			puts "Something went wrong"
			return -1
		end
		return r1 * r2
	end
end
class Minus < IBExpr
	attr_accessor :subExp1, :subExp2
	def initialize(e1 ,e2)
		@subExp1 = e1
		@subExp2 = e2
	end
	def interpret()
		r1 = @subExp1.interpret()
		r2 = @subExp2.interpret()
		if r1 == true || r1 == false || r2 == true || r1 == false
			puts "Something went wrong"
			return -1
		end
		return r1 - r2
	end
end
class Exp < IBExpr
	attr_accessor :subExp1, :subExp2
	def initialize(e1 ,e2)
		@subExp1 = e1
		@subExp2 = e2
	end
	def interpret()
		r1 = @subExp1.interpret()
		r2 = @subExp2.interpret()
		if r1 == true || r1 == false || r2 == true || r1 == false
			puts "Something went wrong"
			return -1
		end
		return pow(r1, r2)
	end
end
#TTT will return true
class TTT < IBExpr 
	attr_accessor :true
	def initialize()
		@true = true
	end
	def interpret()
		return true
	end
end
#FFF will return false
class FFF < IBExpr
	attr_accessor :false
	def initialize()
		@false = false
	end
	def interpret()
		return false
	end
end
#Lnot will return true if e1 is false or true if e1 is false.
class Lnot < IBExpr
	attr_accessor :exp
	def initialize(e1)
		@exp = e1
	end
	def interpret()
		r = exp.interpret()
		if r != true || r != false
			puts "Something went wrong"
			return -1
		end
		if r== true
			return false
		else
			return true
		end
	end
end
class Land < IBExpr
	attr_accessor :exp1, :exp2
	def initialize(e1, e2)
		@exp1 = e1
		@exp2 = e2
	end
	def interpret()
		r1 = exp1.interpret()
		r2 = exp2.interpret()
		if (r1 != true && r2 != true || r1 != false && r2 != false)
			puts "Something went wrong"
			return -1
		else
			return r1 && r2
		end
		
	end
end
class Lor < IBExpr
	attr_accessor :exp1, :exp2
	def initialize(e1, e2)
		@exp1 = e1
		@exp2 = e2
	end
	def interpret()
		r1 = exp1.interpret()
		r2 = exp2.interpret()
		if r1 != true && r2 != true || r1 != false && r2 != false
			puts "Something went wrong"
			return -1
		end
		return r1 || r2
	end
end
def pow(x, y)
	r = 1
	while (y > 0) 
		y = y - 1
		r = r * x
	end
	return r
end	
=begin
five = Cons.new(5)
six = Cons.new(6)
NegFive = Neg.new(five)
ExpFiveSix = Exp.new(five, six)
puts("neg 5 evaluates to #{NegFive.interpret()}")
puts("exp 5 6 evaluates to #{ExpFiveSix.interpret()}")
first = TTT.new()
second = FFF.new()
third = Lnot.new(second)
forth = Land.new(first, second)
puts "#{forth.interpret()}"
fifth = Cons.new(5)
sixth = Lnot.new(fifth)
a = Cons.new(0)
b = TTT.new()
c = Plus.new(b, a)
puts("#{c.interpret()}")
=end
