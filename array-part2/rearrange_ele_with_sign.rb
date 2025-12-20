# **Rearrange Array Elements by Sign**

#    Problem Statement: Vairant 1 (Equal number of positives and negatives)
#    ----------------------------

#    There’s an array ‘A’ of size ‘N’ with an equal number of positive and negative elements. Without altering the relative order of positive and negative elements, you must return an array of alternately positive and negative values.

#    INPUT: [3,1,-2,-5,2,-4]
#    OUTPUT: [3,-2,1,-5,2,-4]

def rearrange_elents_by_sign(ary)
   posIndex = 0
   negIndex = 1
   result = []
   ary.each do |el|
      if(el.positive?)
         result[posIndex] = el
         posIndex +=2
      else
         result[negIndex] = el
         negIndex +=2
      end
   end
   result
end

p rearrange_elents_by_sign([3,1,-2,-5,2,-4])