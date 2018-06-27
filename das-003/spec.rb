def describe(description, &block)
	ExampleGroup.new(block).evaluate! 
end

class ExampleGroup 
	def initialize(block)
		@block = block 
	end
	def evaluate!
		@block.call
	end

	def it (description, &block)
		block.call
	end 
end


