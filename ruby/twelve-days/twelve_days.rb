class TwelveDays
  DAYS = %w(first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth)
  OBJS = ['two Turtle Doves', 'three French Hens', 'four Calling Birds', 'five Gold Rings', 'six Geese-a-Laying',
          'seven Swans-a-Swimming', 'eight Maids-a-Milking', 'nine Ladies Dancing', 'ten Lords-a-Leaping',
          'eleven Pipers Piping', 'twelve Drummers Drumming']
  def self.song
    DAYS.map.with_index do |day, i|
      list = (i > 0)? OBJS.take(i).reverse.join(', ') + ', and ' : ''
      "On the #{day} day of Christmas my true love gave to me, #{list}a Partridge in a Pear Tree.\n"
    end.join("\n")
  end
end

module BookKeeping
  VERSION = 2
end