def describe(description, &block)
	ExampleGroup.new(block).evaluate! 
end

class ExampleGroup 
	def initialize(block)
		@block = block 
	end
	def evaluate!
		# once we have instance_eval into a method of class 
		# this block will run as it was a method of that class(ExampleGroup)
		instance_eval(&@block)
	end

	def it (description, &block)
		block.call
	end 
end

class Object
	def should(comparison_object=nil) 
	  # to enable real rspec it is just an if condition 
	  # if comparison_object
      #  ...
	  # else 
	   DelayedAssertion.new(self)
      #end
	end
end

class AssertionError < Exception
end

class DelayedAssertion
	def initialize(subject)
		@subject = subject
	end
	def ==(other)
		raise AssertionError unless @subject == other 
	end

end

