def bubble(nums)
  p nums
  i = nums.length
  while i>0 do
    j = 0
    while j<i-1 do
      a = nums[j]
      b = nums[j+1]
      if a > b
        nums[j] = b
        nums[j+1] = a
      end
      j += 1
    end
    i -= 1
  end
  return nums
end
arr = [6,5,3,1,8,7,2,4]
arr2 = [654,4894,54,8465,4846,484,65]
p bubble(arr)
p bubble(arr2)