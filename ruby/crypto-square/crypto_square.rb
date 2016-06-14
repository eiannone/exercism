class Crypto
  attr_reader :normalize_plaintext, :size, :plaintext_segments, :ciphertext, :normalize_ciphertext
  def initialize(str)
    # Strips unwanted chars
    @normalize_plaintext = str.gsub(/\W/, '').downcase
    # Calculates required column size for a semi-square arrangement
    @size = Math.sqrt(@normalize_plaintext.length).ceil
    # Splits the string in segments (rows of the square)
    @plaintext_segments = @normalize_plaintext.scan(/.{1,#{@size}}/)
    # Transposes the segments, taking columns of the square as new segments
    cipher_segments = @plaintext_segments
        .map { |s| s.ljust(@size).chars } # Converts segments in a square matrix of chars
        .transpose                        # Transposes it (inverts rows with columns)
        .map { |s| s.join.strip }         # Creates new segments, stripping out white spaces
    @ciphertext = cipher_segments.join
    @normalize_ciphertext = cipher_segments.join(' ')
  end
end