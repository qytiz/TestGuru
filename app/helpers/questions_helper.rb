module QuestionsHelper
    def question_header(action,test)
        if(action=='New' || action == 'new')
            "Create New #{test.title} Question"
            else if(action == 'Edit'||action=='edit')
             "Edit #{test.title} Question"
            end
        end
    end
end
