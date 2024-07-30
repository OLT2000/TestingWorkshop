Given('I navigate to the homepage') do 
    visit 'https://www.gov.uk/calculate-your-holiday-entitlement'
    sleep 1
end

And('I should see the homepage') do
    check_standard_footer
    @current_title ||= 'Calculate holiday entitlement - GOV.UK'
    expect(page).to have_title @current_title
    expect(page).to have_css 'h1.govuk-heading-xl'
    expect(page).to have_link 'Start now'
    expect(page).to have_content 'Use this tool to calculate holiday entitlement for:'
    expect(page).to have_content 'a full leave year'
    expect(page).to have_content 'part of a leave year, if the job started or finished part way through the year'
    expect(page).to have_content 'If an employee works irregular hours or for part of the year, you also use this calculator to work out how much leave they’ve built up (‘accrued’) over a pay period.'
    expect(page).to have_content 'Explore the topic'
    expect(page).to have_link 'Statutory leave and time off'
    expect(page).to have_link 'Holidays, time off, sick leave, maternity and paternity leave'
end

When ("I click on the 'Start now' button") do
    click_link('Start now')
    @stored_answers = Hash.new
end

And ('I select the option {string} for {string}') do |input, question|
    check_standard_footer
    @stored_answers[question] = input
    @current_title ||= "#{question} - Calculate holiday entitlement - GOV.UK"
    expect(page).to have_title @current_title
    choose(input, allow_label_click: true)
    find_button('Continue').click
end

And ('I input {float} for {string}') do |input, question|
    check_standard_footer
    @stored_answers[question] = input
    @current_title ||= "#{question} - Calculate holiday entitlement - GOV.UK"
    expect(page).to have_title @current_title
    fill_in("response",	with: input)
    click_button('Continue')
end

Then ('I should see the correct submitted answers') do
    check_standard_footer
    @current_title ||= 'Outcome - Calculate holiday entitlement - GOV.UK'
    expect(page).to have_title @current_title
    @stored_answers.each_pair do |key, value|
        expect(page).to have_css('dt', class: 'govuk-summary-list__key', text: key)
        expect(page).to have_css('dd', class: 'govuk-summary-list__value', text: value)
    end
end

And ('I should see {float} entitlement {string}') do |num, text|
    expect(page).to have_text("#{convert_to_integer_if_possible(num)} #{text}")
end

Then ('I do not redirect to a new page') do
    expect(page).to have_title @current_title
end

And ('I am provided with an error message') do 
    expect(page).to have_css("div", id: "error-summary")
    expect(page).to have_css("h2", class: "govuk-error-summary__title", text: "There is a problem")
end

And ('I am given a link to re-answer the open-text question') do
    expect(page).to have_css("a", href: "#response")
end