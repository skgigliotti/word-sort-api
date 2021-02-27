class WordsController < ApplicationController
    def list
    end
    
    def show
        result = nil
        status = :ok

        begin
            word = Word.find(params[:id])
            puts 'okkkk'
            result = serialize_word(word)
        rescue ActiveRecord::RecordNotFound
            result = "No Word with Id #{params[:id]}"
            status = :not_found
        end

        render json: result, status: status
    end
    
    def index
        result = nil
        status = :ok

        query_terms = params.except(:action, :controller, :word).to_enum.to_h

        begin
            words = Word.where(query_terms)
            result = serialize_word(words.to_a)
        rescue ActiveRecord::StatementInvalid
            result = serialize_word([])
        end
        render json: result, status: status
    end
    
    def create
        status = :ok

        address = Word.create(word_params)

        result = serialize_word(word)

        render json: result, status: status
    end
    
    def edit
    end
    
    def update
    end
    
    def delete
    end

    private

    def word_params
        params.permit(:spelling, :language, :english)
    end

    def serialize_word(word)
        puts 'blaghhh'
        puts "Is word nil? #{word.nil?}"
        WordSerializer.new(word, params).serialized_json
    end
end
