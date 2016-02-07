class Skill
  attr_reader :title,
              :description,
              :id

  def initialize(data)
    @id          = data[:id].to_i
    @title       = data[:title]
    @description = data[:description]
  end
end
