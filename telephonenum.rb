require "csv"
ary = CSV.read("telephonenumbers.csv")
#for each broken phone #
CSV.open("correctnumbers.csv","wb") do |csv|
  change_num = ary.map do |i|
    #make a new array to add the correct num
    new_ary = []
    #get rid of spaces and stuff
    letter_array = i[0].scan /\w/
    #for each digit
    letter_array.each do |x|
      #check if each digit is an actual num
      check_digit = x =~ /\A\d+\z/ ? true : false
      #if it is a digit, add to the ary
      if check_digit == true
        new_ary.push(x)
      end
    end
    #the 1- is not needed
    if new_ary.length == 11
      # adds into file
      csv << ["#{new_ary[0]}-#{new_ary[1..3].join}-#{new_ary[4..6].join}-#{new_ary[7..10].join}"]
      #the 1- is needed
    elsif new_ary.length == 10
      #adds into file
      csv << ["1-#{new_ary[0..2].join}-#{new_ary[3..5].join}-#{new_ary[6..9].join}"]
    end
  end
end
