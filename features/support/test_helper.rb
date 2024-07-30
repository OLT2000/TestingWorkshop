# features/support/footer_helper.rb
module TestHelper

    def convert_number_to_date(number)
        case number
            when 1
            "January"
            when 2
            "February"
            when 3
            "March"
            when 4
            "April"
            when 5
            "May"
            when 6
            "June"
            when 7
            "July"
            when 8
            "August"
            when 9
            "September"
            when 10
            "October"
            when 11
            "November"
            when 12
            "December"
            else
            "Invalid month number"
            end
        end

    def check_standard_footer
        expect(page).to have_css "h2.govuk-heading-m"
        expect(page).to have_css "a.govuk-footer__link"
        [
            "Benefits",
            "Births, death, marriages and care",
            "Business and self-employed",
            "Childcare and parenting",
            "Citizenship and living in the UK",
            "Crime, justice and the law",
            "Disabled people",
            "Driving and transport",
            "Education and learning",
            "Employing people",
            "Environment and countryside",
            "Housing and local services",
            "Money and tax",
            "Passports, travel and living abroad",
            "Visas and immigration",
            "Working, jobs and pensions",
            "Departments",
            "News",
            "Guidance and regulation",
            "Research and statistics",
            "Policy papers and consultations",
            "Transparency",
            "How government works",
            "Get involved"
        ].each { |text|
            expect(page).to have_link(text)
        }
    end

    def convert_to_integer_if_possible(decimal)
        # Check if the decimal has no fractional part
        if decimal % 1 == 0
          # Convert to integer
            decimal.to_i
        else
            decimal
        end
      end
end

World(TestHelper)