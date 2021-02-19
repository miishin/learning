def sum_of_intervals(intervals)
  trimmed_intervals = []
  until intervals.length.zero? do
    res = trim(intervals)
    trimmed_intervals << res[0]
    intervals = res[1]
  end
  sum = 0
  trimmed_intervals.each { |interval| sum += i_length(interval) }
  sum
end

def i_length(interval)
    interval[1] - interval[0]
end

def trim(intervals)
  base = intervals.shift()
  intervals.each do |interval|
    if overlap?(base, interval)
      base = merge(base, interval)
      intervals.delete(interval)
    end
  end
  [base, intervals]
end

def overlap?(i1, i2)
  i1.any? { |n| n.between?(i2[0],i2[1])}
end

def merge(i1, i2)
  [[i1[0], i1[0]].min, [i1[1], i2[1]].max]
end