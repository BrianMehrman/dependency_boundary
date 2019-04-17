module Wood
  class Tree
    def grow
      @water = Water::River.new.pull
      @curret = Date.new
    end

    def destroy
      Fire::Stove.new.light
    end
  end
end
