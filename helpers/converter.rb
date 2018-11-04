def convert_text_to_train_line(message)

  letters = {
    "a": ":la:",
    "à": ":la:",
    "b": ":lb:",
    "c": ":lc:",
    "ç": ":lc:",
    "d": ":ld:",
    "e": ":le:",
    "é": ":le:",
    "è": ":le:",
    "ê": ":le:",
    "f": ":lf:",
    "g": ":lg:",
    "h": ":lh:",
    "i": ":li:",
    "j": ":lj:",
    "k": ":lk:",
    "l": ":ll:",
    "m": ":lm:",
    "n": ":ln:",
    "o": ":lo:",
    "p": ":lp:",
    "q": ":lq:",
    "r": ":lr:",
    "s": ":ls:",
    "t": ":lt:",
    "u": ":lu:",
    "ù": ":lu:",
    "v": ":lv:",
    "w": ":lw:",
    "x": ":lx:",
    "y": ":ly:",
    "z": ":lz:",
  }

  numbers = {
    "1": ":m1:",
    "2": ":m2:",
    "3": ":m3:",
    "4": ":m4:",
    "5": ":m5:",
    "6": ":m6:",
    "7": ":m7:",
    "8": ":m8:",
    "9": ":m9:",
    "10": ":m10:",
    "11": ":m11:",
    "12": ":m12:",
    "13": ":m13:",
    "14": ":m14:",
  }

  result = []
  index = 0
  chars = message.chars

  while index < chars.count
    c = chars[index]
    next if c.nil?
    if c == " "
      result << "  "
    elsif numbers[c.downcase.to_sym]
      # check if number are 10, 11, 12, 13, 14
      key = "#{c}#{chars[index +1]}"
      if (index + 1) != chars.count && numbers[key.to_sym]
        value = numbers[key.to_sym]
        result << value
        index = index + 2
        next
      else
        value = numbers[c.downcase.to_sym]
        converted =  value ? value : c.downcase
        result << converted
      end
    else
      value = letters[c.downcase.to_sym]
      converted =  value ? value : c.downcase
      result << converted
    end
    index = index + 1
  end
  result.join()
end