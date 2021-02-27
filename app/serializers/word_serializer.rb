class WordSerializer
  include FastJsonapi::ObjectSerializer
  attributes :spelling, :language, :english, :times_seen, :times_practiced

  Word.reflect_on_all_associations.each do |association|
    send(association.macro, association.name, if: proc { |_record, params| params && params[:include] && (params[:include].include? association.name.to_s) })
  end
end