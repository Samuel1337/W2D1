# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        return nil if self == [] || !self.inject(:+).is_a?(Integer) 
        return self.max - self.min
    end
    
    def average
        self.length > 0 ? self.sum / (self.length * 1.0) : nil
    end

    def median
        return nil if self == []
        med = self.length/2
        if self.length % 2 == 0
            self.sort[med-1..med].average
        else 
            self.sort[med]
        end
    end

    def counts
        hash = Hash.new(0)
        self.each { |el| hash[el] += 1 }
        hash
    end
    
    def my_count(value)
        count = 0
        self.each { |el| count += 1 if el == value }
        count
    end
    
    def my_index(value)
        self.each_with_index { |el, i| return i if el == value }
        return nil
    end

    def my_uniq
        newArr = []
        self.each { |el| newArr << el if !newArr.include?(el) }
        newArr
    end

    def my_transpose
        newArr = []
        
        self.each do |subArr| 
            subArr.each_with_index do |el, i|
                newArr[i] = [] if newArr[i] == nil
                newArr[i] << el
            end
        end

        newArr
    end


end