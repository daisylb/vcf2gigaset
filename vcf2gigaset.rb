require 'vcard'
require 'outdent'

cards = Vcard::Vcard.decode(STDIN)

cards.each do |card|
  card.telephones.each do |phone|
    name = "#{card.name.fullname} #{phone.location.join ""} #{phone.nonstandard.join ""}"
    formatted_phone = phone.gsub %r{[^0-9\+\*\#]+}, ""
    puts <<-EOS.outdent
      BEGIN:VCARD
      VERSION:2.1
      FN:#{name}
      N:#{name}
      TEL;HOME:#{formatted_phone}
      END:VCARD

    EOS
  end
end
