#!/usr/bin/env ruby
# Sorts an Array and puts all negative numbers before positive
# Uses Quick Sort partitioning to sort array in place
# Pivots on 0
# Complexity is O(n)
class NegativeBeforePositive
  def self.sort!(keys=[])
    p quick(keys,0,keys.size-1)
  end
 
  private
 
  def self.quick(keys, left, right)
    if left < right
      pivot_index = (left + ((right - left) / 2)).to_i
      pivot_index = partition(keys, left, right, pivot_index)
      keys[pivot_index]
      quick(keys, left, pivot_index - 1)
      quick(keys, pivot_index + 1, right)
    end
    keys
  end
 
  def self.partition(keys, left, right, pivot)
    keys[pivot], keys[right] = keys[right], keys[pivot]  
    storeIndex = left 
    for i in left..right -1 
      if keys[i] < 0
        keys[storeIndex], keys[i] = keys[i], keys[storeIndex]
        storeIndex += 1
      end
    end
    keys[right], keys[storeIndex] = keys[storeIndex], keys[right]  
    return storeIndex
  end
end

NegativeBeforePositive.sort!([1,-10,3,5,-40,0])