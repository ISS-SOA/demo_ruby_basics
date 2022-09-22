# frozen_string_literal: true

require 'benchmark'

Benchmark.bmbm do |bench|
  bench.report('no to_a ') { (1..10_000_000).select(&:odd?) }
  bench.report('use to_a') { (1..10_000_000).to_a.select(&:odd?) }
end

#                user     system      total        real
# no to_a    0.497194   0.004624   0.501818 (  0.501898)
# use to_a   0.534139   0.009723   0.543862 (  0.543879)
