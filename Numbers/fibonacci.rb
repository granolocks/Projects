# Generate an array with n steps of fibonacci
def fibonacci(steps)
  sequence = []
  steps.times do
    sequence << next_element(sequence)
  end
  sequence
end

def next_element(sequence)
  # Since the first two elements are 0 and 1 we can use the array length
  # at that point to seed the array
  #
  # This way 0 and 1 steps work properly
  (sequence.length > 1) ? (sequence[-1] + sequence[-2]) : sequence.length
end

puts fibonacci(0).inspect
puts fibonacci(1).inspect
puts fibonacci(10).inspect
puts fibonacci(100).inspect
