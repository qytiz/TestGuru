module QuestionsHelper
    def question_header(action,test)
        if(test.persisted?)
            "Edit #{test.title} Question"
        else
            "Create New #{test.title} Question"
        end
    end
end
