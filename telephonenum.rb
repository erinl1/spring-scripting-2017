require "csv"
ary = CSV.read("telephonenumbers.csv")
#for each broken phone #
CSV.open("correctnumbers.csv","wb") do |csv|
  changeNum = ary.map do |i|
    #make a new array to add the correct num
    newAry = []
    #get rid of spaces and stuff
    letterArray = i[0].scan /\w/
    #for each digit
    letterArray.each do |x|
      #check if each digit is an actual num
      checkDigit = x =~ /\A\d+\z/ ? true : false
      #if it is a digit, add to the ary
      if checkDigit == true
        newAry.push(x)
      end
    end
    #the 1- is not needed
    if newAry.length == 11
      # adds into file
      csv << ["#{newAry[0]}-#{newAry[1]}#{newAry[2]}#{newAry[3]}-#{newAry[4]}#{newAry[5]}#{newAry[6]}-#{newAry[7]}#{newAry[8]}#{newAry[9]}#{newAry[10]}"]
      #the 1- is needed
    elsif newAry.length == 10
      #adds into file
      csv << ["1-#{newAry[0]}#{newAry[1]}#{newAry[2]}-#{newAry[3]}#{newAry[4]}#{newAry[5]}-#{newAry[6]}#{newAry[7]}#{newAry[8]}#{newAry[9]}"]
    end
  end
end
