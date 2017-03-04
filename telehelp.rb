require "csv"
ary = CSV.read("telephonenumbers.csv")
ary.each do |i|
  newAry = []
  letterArray = i[0].scan /\w/
  letterArray.each do |x|
   checkDigit = x =~ /\A\d+\z/ ? true : false
    if checkDigit == true
      newAry.push(x)
    end
  end
  #puts newAry.inspect
  puts "#{newAry[0]}-#{newAry[1]}#{newAry[2]}#{newAry[3]}-#{newAry[4]}#{newAry[5]}#{newAry[6]}-#{newAry[7]}#{newAry[8]}#{newAry[9]}#{newAry[10]}"
end
