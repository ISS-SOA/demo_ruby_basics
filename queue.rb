
q = Queue.new
# => #<Thread::Queue:0x007fa7ea178ee8>

th = Thread.new do
  while true do
    job = q.pop
    sleep(rand(2..4))
    puts ("Finished working on: #{job}")
  end
end

q.push('write tests')
q.push('write code')
q.push('refactor code')
q.push('deploy app')
