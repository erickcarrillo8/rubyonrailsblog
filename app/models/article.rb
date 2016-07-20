class Article < ActiveRecord::Base
	#La tabla => articles
	#campos => article.title() => 'EL titulo de articulo'
	#Escribir métodos.
	
	validates :title, presence: true, uniqueness: true
	validates :body, presence: true, length: { minimum: 20}

end
