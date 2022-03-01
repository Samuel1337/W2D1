class Bootcamp
    def initialize(name,slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |hash, k| hash[k] = [] }
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def student_capacity
        @student_capacity
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def grades
        @grades
    end

    def name=(name)
        @name = name
    end

    def slogan=(slogan)
        @slogan = slogan
    end

    def student_capacity=(student_capacity)
        @student_capacity = student_capacity
    end

    def teachers=(teachers)
        @teachers = teachers
    end

    def students=(students)
        @students = students
    end

    def grades=(grades)
        @grades = grades
    end
 
    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if @student_capacity > @students.length 
            @students << student 
            true
        else
            false
        end
    end
    
    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        @students.length/@teachers.length.to_i
    end

    def add_grade(student, grade)
        @grades[student] << grade if self.enrolled?(student)
        self.enrolled?(student)
    end

    def num_grades(student)
        @grades[student].length
    end 

    def average_grade(student)
        self.enrolled?(student) && @grades[student] != [] ? \
        sum = @grades[student].sum/@grades[student].length :  nil
    end
end

