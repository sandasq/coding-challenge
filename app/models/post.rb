class Post < ApplicationRecord
 has_many :comments, dependent: :destroy
 validates :title, presence: true,
     length: { minimum: 3 }

 def self.search(search)
   if search
     criteria = Post.find_by(title: search)
     if criteria
       self.where(id: criteria)
     else
       Post.all
     end
   else
      Post.all
   end  
 end 
end
