# Queue Basics

q = Queue.new

q.push 'first'
q.push 'second'
q.push 'third'

3.times { puts q.pop }

# Concurrency with Queues
require 'concurrent'

q = Queue.new

Concurrent::Promise.execute do
  while true do
    job = q.pop

    sleep(rand(2..4)) # pretend to work
    puts "Finished: #{job}"
  end
end;

q.push('write tests')
q.push('write code')
q.push('refactor code')
q.push('deploy app')
