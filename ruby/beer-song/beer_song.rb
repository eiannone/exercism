class BeerSong
  def verse(n)
    raise ArgumentError if n < 0 || n > 99
    "#{bottles(n).capitalize} of beer on the wall, #{bottles(n)} of beer.\n" +
     ((n == 0)?
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      : "Take #{(n == 1)? 'it' : 'one'} down and pass it around, #{bottles(n-1)} of beer on the wall.\n")
  end

  def verses(from, to)
    (from.downto(to)).map{|v| verse(v) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

  private
  def bottles(n)
    return 'no more bottles' if n == 0
    (n == 1) ? '1 bottle' : "#{n} bottles"
  end
end

module BookKeeping
  VERSION = 2
end