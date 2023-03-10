class VerifierService
    def initialize(word)
        @word = word
    end

    def call
        @responses = []
        
        phrase_array = split_space_phrase_in_array(@word)

        MessageVerifier.all.map{ |message_verifier| split_verifier_and_compare_to_word(message_verifier.content, phrase_array)}
   
        if @responses.size == 0
            ["caramba_viu", "ah_cara", "vou_mutar_as_mensagens"].sample
        else
            @responses.first.content
        end
    end

    def split_space_phrase_in_array(word)
        word.gsub(/\s+/m, ' ').strip.split(" ")
        #oi thay, tudo bem?
        #['oi', 'thay', 'tudo', 'bem?' ]
        
    end

    def split_verifier_and_compare_to_word(message_verifier_array, phrase_array)
        @count = 0
    
        message_verifier_array = split_space_phrase_in_array(message_verifier.content)
        phrase_array.map{ |phrase_word| @count += 1 if message_verifier_array.include?(phrase_word)}
    
        @responses << message_verifier.responses.first if @count >= 2 || @count == phrase_array
    end
end