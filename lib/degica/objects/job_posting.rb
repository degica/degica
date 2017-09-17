module Degica
  class JobPosting < Object
    def name
      :postings
    end

    def describe
      <<~DESC

        Open Positions
        ==============

        ## Ruby Developer

        We are currently hiring junior and senior level Ruby developers.
        Please e-mail a resume and CV to recruit@degica.com

      DESC
    end
  end
end
